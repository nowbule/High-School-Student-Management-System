package com.ruoyi.school.controller;

import java.util.List;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.school.domain.HomeworkSubmission;
import com.ruoyi.school.service.IHomeworkSubmissionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.DateUtils;
/**
 * 作业提交与成绩Controller   1.8 021
 * @author ruoyi
 * @date 2025-12-27
 */
@RestController
@RequestMapping("/school/submission")
public class HomeworkSubmissionController extends BaseController
{
    @Autowired
    private IHomeworkSubmissionService homeworkSubmissionService;

    /**
     * 查询作业提交与成绩列表
     */
    @PreAuthorize("@ss.hasPermi('school:submission:list')")
    @GetMapping("/list")
    public TableDataInfo list(HomeworkSubmission homeworkSubmission)
    {
        startPage();
        List<HomeworkSubmission> list = homeworkSubmissionService.selectHomeworkSubmissionList(homeworkSubmission);
        return getDataTable(list);
    }

    /**
     * 导出作业提交与成绩列表
     */
    @PreAuthorize("@ss.hasPermi('school:submission:export')")
    @Log(title = "作业提交与成绩", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HomeworkSubmission homeworkSubmission)
    {
        List<HomeworkSubmission> list = homeworkSubmissionService.selectHomeworkSubmissionList(homeworkSubmission);
        ExcelUtil<HomeworkSubmission> util = new ExcelUtil<HomeworkSubmission>(HomeworkSubmission.class);
        util.exportExcel(response, list, "作业提交与成绩数据");
    }

    /**
     * 获取作业提交与成绩详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:submission:query')")
    @GetMapping(value = "/{submissionId}")
    public AjaxResult getInfo(@PathVariable("submissionId") Long submissionId)
    {
        return success(homeworkSubmissionService.selectHomeworkSubmissionBySubmissionId(submissionId));
    }

    /**11
     * 新增作业提交与成绩 (后台标准接口)
     * 【已修复】：自动防重复，存在则更新，不存在则插入
     */
    @PreAuthorize("@ss.hasPermi('school:submission:add')")
    @Log(title = "作业提交与成绩", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HomeworkSubmission homeworkSubmission)
    {
        return saveSubmissionSafe(homeworkSubmission);
    }

    /**
     * 修改作业提交与成绩
     */
    @PreAuthorize("@ss.hasPermi('school:submission:edit')")
    @Log(title = "作业提交与成绩", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HomeworkSubmission homeworkSubmission)
    {
        return toAjax(homeworkSubmissionService.updateHomeworkSubmission(homeworkSubmission));
    }

    /**
     * 删除作业提交与成绩
     */
    @PreAuthorize("@ss.hasPermi('school:submission:remove')")
    @Log(title = "作业提交与成绩", businessType = BusinessType.DELETE)
    @DeleteMapping("/{submissionIds}")
    public AjaxResult remove(@PathVariable Long[] submissionIds)
    {
        return toAjax(homeworkSubmissionService.deleteHomeworkSubmissionBySubmissionIds(submissionIds));
    }

    /**
     * 学生端 - 提交作业功能 (自定义接口)
     * 【已修复】：即使前端调用这个，也不会报错了
     */
    @PostMapping("/studentSubmit")
    public AjaxResult submitHomework(@RequestBody HomeworkSubmission homeworkSubmission)
    {
        return saveSubmissionSafe(homeworkSubmission);
    }

    /**
     * 查询学生成绩分析
     */
    @GetMapping("/weekly/analysis")
    public TableDataInfo weeklyAnalysis(HomeworkSubmission homeworkSubmission)
    {
        startPage();
        // 1. 获取当前登录用户的ID
        homeworkSubmission.setStudentId(com.ruoyi.common.utils.SecurityUtils.getUserId());

        // 2. 调用Service查询（如果不加Status条件，这里补上）
        homeworkSubmission.setStatus("2"); // 确保只查已批改的

        // 3. 调用之前写好的接口
        List<HomeworkSubmission> list = homeworkSubmissionService.selectStudentScoreAnalysis(homeworkSubmission);

        return getDataTable(list);
    }

    /**
     * 核心逻辑：安全保存（防重复）
     * 提取出来供上面两个方法共同调用
     */
    private AjaxResult saveSubmissionSafe(HomeworkSubmission homeworkSubmission) {
        // 1. 获取当前用户身份
        Long userId = SecurityUtils.getUserId();

        // 2. 补全信息
        homeworkSubmission.setStudentId(userId);
        homeworkSubmission.setStudentName(SecurityUtils.getUsername()); // 获取用户名
        // 如果没有提交时间，则设置为当前时间
        // 在保存/插入之前
        homeworkSubmission.setSubmitTime(new Date());
        if (homeworkSubmission.getCreateTime() == null) {
            homeworkSubmission.setCreateTime(DateUtils.getNowDate());
        }
        homeworkSubmission.setStatus("1"); // 强制设为已提交

        // 3. 【关键逻辑】先查一下库里有没有（根据任务ID + 学生ID）
        HomeworkSubmission query = new HomeworkSubmission();
        query.setTaskId(homeworkSubmission.getTaskId());
        query.setStudentId(userId);

        List<HomeworkSubmission> list = homeworkSubmissionService.selectHomeworkSubmissionList(query);

        // 4. 判断逻辑
        if (list != null && list.size() > 0) {
            // 【如果已存在】：走更新逻辑 (Update)
            // 拿到旧数据的ID，赋给当前对象，然后更新
            HomeworkSubmission oldData = list.get(0);
            homeworkSubmission.setSubmissionId(oldData.getSubmissionId());
            return toAjax(homeworkSubmissionService.updateHomeworkSubmission(homeworkSubmission));
        } else {
            // 【如果不存在】：走插入逻辑 (Insert)
            try {
                return toAjax(homeworkSubmissionService.insertHomeworkSubmission(homeworkSubmission));
            } catch (Exception e) {
                // 双重保险：万一并发导致插入时报错重复，捕获异常再次尝试更新
                e.printStackTrace();
                // 再次尝试查找更新（极少数情况）
                List<HomeworkSubmission> retryList = homeworkSubmissionService.selectHomeworkSubmissionList(query);
                if (retryList != null && retryList.size() > 0) {
                    homeworkSubmission.setSubmissionId(retryList.get(0).getSubmissionId());
                    return toAjax(homeworkSubmissionService.updateHomeworkSubmission(homeworkSubmission));
                }
                return error("提交失败，请刷新重试");
            }
        }
    }
    /**
     * 🔥🔥🔥 新增：学生首页专用查询接口 🔥🔥🔥
     * 作用：只查任务表，不管有无提交记录 (解决首页卡片显示不全的问题)
     * 注意：不要改原本的 list 方法，否则老师端会崩
     */
    @GetMapping("/student/list")
    public TableDataInfo studentList(HomeworkSubmission homeworkSubmission)
    {
        startPage();
        // 1. 强制绑定当前登录学生ID
        homeworkSubmission.setStudentId(SecurityUtils.getUserId());

        // 2. 🔥 核心：告诉 XML 开启 "学生视图模式" (连表查询 Task 主表)
        homeworkSubmission.getParams().put("studentView", true);

        // 3. 🔥 核心：只查未过期的 (首页卡片专用)
        homeworkSubmission.getParams().put("onlyUnexpired", true);

        // 4. 🔥 核心：只查本班级的 (防止看到其他班级的作业)
        homeworkSubmission.getParams().put("classId", SecurityUtils.getDeptId());

        List<HomeworkSubmission> list = homeworkSubmissionService.selectHomeworkSubmissionList(homeworkSubmission);
        return getDataTable(list);
    }
}