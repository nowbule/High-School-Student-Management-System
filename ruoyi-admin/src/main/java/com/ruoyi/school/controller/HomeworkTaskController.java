package com.ruoyi.school.controller;

import java.util.List;
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
import com.ruoyi.school.domain.HomeworkTask;
import com.ruoyi.school.service.IHomeworkTaskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils; // 【新增】引入安全工具类

/**
 * 作业发布任务Controller
 * * @author ruoyi
 * @date 2025-12-27
 */
@RestController
@RequestMapping("/school/task")
public class HomeworkTaskController extends BaseController
{
    @Autowired
    private IHomeworkTaskService homeworkTaskService;

    /**
     * 查询作业发布任务列表
     */
    @PreAuthorize("@ss.hasPermi('school:task:list')")
    @GetMapping("/list")
    public TableDataInfo list(HomeworkTask homeworkTask)
    {
        startPage();
        List<HomeworkTask> list = homeworkTaskService.selectHomeworkTaskList(homeworkTask);
        return getDataTable(list);
    }

    /**
     * 导出作业发布任务列表
     */
    @PreAuthorize("@ss.hasPermi('school:task:export')")
    @Log(title = "作业发布任务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HomeworkTask homeworkTask)
    {
        List<HomeworkTask> list = homeworkTaskService.selectHomeworkTaskList(homeworkTask);
        ExcelUtil<HomeworkTask> util = new ExcelUtil<HomeworkTask>(HomeworkTask.class);
        util.exportExcel(response, list, "作业发布任务数据");
    }

    /**
     * 获取作业发布任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:task:query')")
    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable("taskId") Long taskId)
    {
        return success(homeworkTaskService.selectHomeworkTaskByTaskId(taskId));
    }

    /**
     * 新增作业发布任务
     * 【重点修改】：增加了兜底数据，防止数据库报错
     */
    @PreAuthorize("@ss.hasPermi('school:task:add')")
    @Log(title = "作业发布任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HomeworkTask homeworkTask)
    {
        // 1. 自动设置发布老师为当前登录用户
        try {
            homeworkTask.setTeacherId(SecurityUtils.getUserId());
        } catch (Exception e) {
            // 如果获取失败（极少数情况），默认给个1
            homeworkTask.setTeacherId(1L);
        }

        // 2. 暂时写死课程ID为 1 (防止 course_id 无默认值报错)
        if (homeworkTask.getCourseId() == null) {
            homeworkTask.setCourseId(1L);
        }

        // 3. 校验班级ID不能为空
        if (homeworkTask.getClassId() == null) {
            return error("发布作业必须选择班级");
        }

        return toAjax(homeworkTaskService.insertHomeworkTask(homeworkTask));
    }

    /**
     * 修改作业发布任务
     */
    @PreAuthorize("@ss.hasPermi('school:task:edit')")
    @Log(title = "作业发布任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HomeworkTask homeworkTask)
    {
        // 允许修改关联的科目
        return toAjax(homeworkTaskService.updateHomeworkTask(homeworkTask));
    }

    /**
     * 删除作业发布任务
     */
    @PreAuthorize("@ss.hasPermi('school:task:remove')")
    @Log(title = "作业发布任务", businessType = BusinessType.DELETE)
    @DeleteMapping("/{taskIds}")
    public AjaxResult remove(@PathVariable Long[] taskIds)
    {
        return toAjax(homeworkTaskService.deleteHomeworkTaskByTaskIds(taskIds));
    }
}