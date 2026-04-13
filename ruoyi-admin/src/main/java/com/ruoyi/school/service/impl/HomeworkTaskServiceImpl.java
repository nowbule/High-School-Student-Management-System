package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.HomeworkTaskMapper;
import com.ruoyi.school.domain.HomeworkTask;
import com.ruoyi.school.service.IHomeworkTaskService;

/**
 * 作业发布任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@Service
public class HomeworkTaskServiceImpl implements IHomeworkTaskService 
{
    @Autowired
    private HomeworkTaskMapper homeworkTaskMapper;

    /**
     * 查询作业发布任务
     * 
     * @param taskId 作业发布任务主键
     * @return 作业发布任务
     */
    @Override
    public HomeworkTask selectHomeworkTaskByTaskId(Long taskId)
    {
        return homeworkTaskMapper.selectHomeworkTaskByTaskId(taskId);
    }

    /**
     * 查询作业发布任务列表
     * 
     * @param homeworkTask 作业发布任务
     * @return 作业发布任务
     */
    @Override
    public List<HomeworkTask> selectHomeworkTaskList(HomeworkTask homeworkTask)
    {
        return homeworkTaskMapper.selectHomeworkTaskList(homeworkTask);
    }

    /**
     * 新增作业发布任务
     * 
     * @param homeworkTask 作业发布任务
     * @return 结果
     */
    @Override
    public int insertHomeworkTask(HomeworkTask homeworkTask)
    {
        homeworkTask.setCreateTime(DateUtils.getNowDate());
        return homeworkTaskMapper.insertHomeworkTask(homeworkTask);
    }

    /**
     * 修改作业发布任务
     * 
     * @param homeworkTask 作业发布任务
     * @return 结果
     */
    @Override
    public int updateHomeworkTask(HomeworkTask homeworkTask)
    {
        homeworkTask.setUpdateTime(DateUtils.getNowDate());
        return homeworkTaskMapper.updateHomeworkTask(homeworkTask);
    }

    /**
     * 批量删除作业发布任务
     * 
     * @param taskIds 需要删除的作业发布任务主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkTaskByTaskIds(Long[] taskIds)
    {
        return homeworkTaskMapper.deleteHomeworkTaskByTaskIds(taskIds);
    }

    /**
     * 删除作业发布任务信息
     * 
     * @param taskId 作业发布任务主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkTaskByTaskId(Long taskId)
    {
        return homeworkTaskMapper.deleteHomeworkTaskByTaskId(taskId);
    }



}
