package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.HomeworkTask;

/**
 * 作业发布任务Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public interface HomeworkTaskMapper 
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
     * 删除作业发布任务
     * 
     * @param taskId 作业发布任务主键
     * @return 结果
     */
    public int deleteHomeworkTaskByTaskId(Long taskId);

    /**
     * 批量删除作业发布任务
     * 
     * @param taskIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHomeworkTaskByTaskIds(Long[] taskIds);
}
