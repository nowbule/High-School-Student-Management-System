package com.ruoyi.school.controller;

import java.util.*;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.github.pagehelper.PageHelper;
// 引入分页返回对象
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.school.domain.HsSchedule;

// 引入业务相关类
import com.ruoyi.school.domain.HomeworkSubmission;
import com.ruoyi.school.service.IHomeworkSubmissionService;
import com.ruoyi.school.domain.HsAttendance;
import com.ruoyi.school.service.IHsAttendanceService;
import com.ruoyi.school.service.IHsScheduleService;




@RestController
@RequestMapping("/school/portal")
public class StudentPortalController extends BaseController
{
    @Autowired
    private IHomeworkSubmissionService submissionService;

    @Autowired
    private IHsAttendanceService attendanceService;

    // 🔥🔥🔥 关键：您刚才缺的就是这段变量声明！ 🔥🔥🔥
    @Autowired
    private IHsScheduleService scheduleService;



    /**
     * 1. 获取我的待办作业
     */
    @GetMapping("/homework")
    public AjaxResult myRecentHomework()
    {
        // 获取当前登录用户ID
        Long userId = SecurityUtils.getUserId();

        HomeworkSubmission query = new HomeworkSubmission();
        query.setStudentId(userId);
        query.setStatus("0"); // 未提交

        // 🔥 开启学生视图 + 班级过滤
        query.getParams().put("studentView", true);
        query.getParams().put("classId", SecurityUtils.getDeptId());

        PageHelper.startPage(1, 5, "create_time desc");
        List<HomeworkSubmission> list = submissionService.selectHomeworkSubmissionList(query);

        return AjaxResult.success(list);
    }

    /**
     * 2. 获取我的考勤图表
     */
    @GetMapping("/attendance")
    public AjaxResult myAttendanceStats()
    {
        Long userId = SecurityUtils.getUserId();

        Map<String, Object> data = new HashMap<>();
        List<String> dates = new ArrayList<>();
        List<Integer> values = new ArrayList<>();

        // 查询最近7天考勤逻辑
        HsAttendance query = new HsAttendance();
        query.setStudentId(userId);
        List<HsAttendance> list = attendanceService.selectHsAttendanceList(query);

        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, -6);

        for (int i = 0; i < 7; i++) {
            String dateStr = sdf.format(cal.getTime());
            dates.add(dateStr);
            boolean isPresent = false;

            if (list != null) {
                for (HsAttendance att : list) {
                    if (att.getAttendanceDate() != null &&
                            sdf.format(att.getAttendanceDate()).equals(dateStr)) {
                        String status = att.getStatus();
                        if (status != null) {
                            status = status.trim();
                        }
                        // 排除缺勤状态(4或"缺勤")
                        if(!"4".equals(status) && !"缺勤".equals(status)){
                            isPresent = true;
                        }
                    }
                }
            }
            values.add(isPresent ? 0 : 1);
            cal.add(Calendar.DAY_OF_YEAR, 1);
        }

        data.put("dates", dates);
        data.put("values", values);

        return AjaxResult.success(data);
    }

    /**
     * 3. 获取我的考勤列表 (分页 + 绕过权限)
     * 对应前端页面的 "我的考勤记录" 表格
     */
    @GetMapping("/attendance/list")
    public TableDataInfo myAttendanceList(HsAttendance attendance)
    {
        // 🔥 强制设置当前用户的ID，确保只能查自己的
        attendance.setStudentId(SecurityUtils.getUserId());

        // 开启分页
        startPage();

        // 查询数据库
        List<HsAttendance> list = attendanceService.selectHsAttendanceList(attendance);

        // 返回表格数据格式
        return getDataTable(list);
    }

// ... 原有的 import

    /**
     * 🔥 新增：获取课表列表 (支持按班级/老师筛选)
     * 这个接口返回当前登录学生所在班级的数据，或者老师自己的排课数据
     */
    // 1. 获取所有课表 (直连数据库接口)
    @GetMapping("/schedule/all")
    public AjaxResult listAllSchedules(Boolean teacherView)
    {
        HsSchedule query = new HsSchedule();
        Long userId = SecurityUtils.getUserId();

        // 如果是老师视角，或者传入了 teacherView=true
        if (Boolean.TRUE.equals(teacherView)) {
             query.setTeacherId(userId);
        } else {
            // 获取当前登录用户的部门ID（即班级ID）
            Long classId = SecurityUtils.getDeptId();
            if (classId == null) {
                return AjaxResult.success(Collections.emptyList());
            }
            query.setClassId(classId); // 仅查询本班
        }

        return AjaxResult.success(scheduleService.selectHsScheduleList(query));
    }

//    前端可视化分析成绩
    /**
     * 🔥 新增接口：获取学生个人的成绩分析
     */
    @GetMapping("/score/analysis")
    public AjaxResult getScoreAnalysis()
    {
        // 1. 查询当前学生的所有作业
        HomeworkSubmission query = new HomeworkSubmission();
        query.setStudentId(SecurityUtils.getUserId());
        List<HomeworkSubmission> list = submissionService.selectHomeworkSubmissionList(query);

        // 2. 统计变量初始化
        int total = list.size();
        int graded = 0;
        double sum = 0;
        double max = 0;
        double min = 0;

        // 分数段计数
        int excellent = 0; // 90-100
        int good = 0;      // 80-89
        int pass = 0;      // 60-79
        int fail = 0;      // <60

        // 3. 遍历计算
        for (HomeworkSubmission item : list) {
            if (item.getScore() != null) {
                double s = item.getScore().doubleValue();
                graded++;
                sum += s;

                // 初始化或更新最大最小值
                if (graded == 1) { max = s; min = s; }
                else {
                    if (s > max) max = s;
                    if (s < min) min = s;
                }

                // 统计分布
                if (s >= 90) excellent++;
                else if (s >= 80) good++;
                else if (s >= 60) pass++;
                else fail++;
            }
        }

        // 4. 计算百分比
        double div = graded == 0 ? 1 : graded;
        Map<String, Object> dist = new HashMap<>();
        dist.put("excellent", graded == 0 ? 0 : (excellent * 100 / div));
        dist.put("good", graded == 0 ? 0 : (good * 100 / div));
        dist.put("pass", graded == 0 ? 0 : (pass * 100 / div));
        dist.put("fail", graded == 0 ? 0 : (fail * 100 / div));

        // 5. 封装结果
        Map<String, Object> res = new HashMap<>();
        res.put("total", total);
        res.put("graded", graded);
        res.put("avg", graded == 0 ? 0 : String.format("%.1f", sum / graded));
        res.put("max", max);
        res.put("min", min);
        res.put("percents", dist); // 百分比
        res.put("counts", new int[]{excellent, good, pass, fail}); // 具体人数

        return AjaxResult.success(res);
    }


    /**
     * 🔥 新增接口：专门用于前端图表显示
     * 访问路径：/school/submission/weekly/analysis
     */
    /**
     * 查询学生作业成绩分析
     * 🔥 修改这里：改成 /trend/analysis，避开 ID 冲突
     */

}