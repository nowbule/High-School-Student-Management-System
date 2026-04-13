package com.ruoyi.school.service;

import java.util.List;
import com.ruoyi.school.domain.HomeworkTask;

/**
 * 作业发布任务Service接口
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public interface IHomeworkTaskService 
{
    /**
     * 查询作业发布任务
     * 
     * @param taskId 作业发布任务主键
     * @return 作业发布任务
     */
    public HomeworkTask selectHomeworkTaskByTaskId(Long taskId);

    /**
     * 查询作业发布任务列表
     * 
     * @param homeworkTask 作业发布任务
     * @return 作业发布任务集合
     */
    public List<HomeworkTask> selectHomeworkTaskList(HomeworkTask homeworkTask);

    /**
     * 新增作业发布任务
     * 
     * @param homeworkTask 作业发布任务
     * @return 结果
     */
    public int insertHomeworkTask(HomeworkTask homeworkTask);

    /**
     * 修改作业发布任务
     * 
     * @param homeworkTask 作业发布任务
     * @return 结果
     */
    public int updateHomeworkTask(HomeworkTask homeworkTask);

    /**
     * 批量删除作业发布任务
     * 
     * @param taskIds 需要删除的作业发布任务主键集合
     * @return 结果
     */
    public int deleteHomeworkTaskByTaskIds(Long[] taskIds);

    /**
     * 删除作业发布任务信息
     * 
     * @param taskId 作业发布任务主键
     * @return 结果
     */
    public int deleteHomeworkTaskByTaskId(Long taskId);
}
