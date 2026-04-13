package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.HomeworkSubmissionMapper;
import com.ruoyi.school.domain.HomeworkSubmission;
import com.ruoyi.school.service.IHomeworkSubmissionService;

/**
 * 作业提交与成绩Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@Service
public class HomeworkSubmissionServiceImpl implements IHomeworkSubmissionService 
{
    @Autowired
    private HomeworkSubmissionMapper homeworkSubmissionMapper;

    /**
     * 查询作业提交与成绩
     * 
     * @param submissionId 作业提交与成绩主键
     * @return 作业提交与成绩
     */
    @Override
    public HomeworkSubmission selectHomeworkSubmissionBySubmissionId(Long submissionId)
    {
        return homeworkSubmissionMapper.selectHomeworkSubmissionBySubmissionId(submissionId);
    }

    /**
     * 查询作业提交与成绩列表
     * 
     * @param homeworkSubmission 作业提交与成绩
     * @return 作业提交与成绩
     */
    @Override
    public List<HomeworkSubmission> selectHomeworkSubmissionList(HomeworkSubmission homeworkSubmission)
    {
        return homeworkSubmissionMapper.selectHomeworkSubmissionList(homeworkSubmission);
    }

    /**
     * 新增作业提交与成绩
     * 
     * @param homeworkSubmission 作业提交与成绩
     * @return 结果
     */
    @Override
    public int insertHomeworkSubmission(HomeworkSubmission homeworkSubmission)
    {
        homeworkSubmission.setCreateTime(DateUtils.getNowDate());
        return homeworkSubmissionMapper.insertHomeworkSubmission(homeworkSubmission);
    }

    /**
     * 修改作业提交与成绩
     * 
     * @param homeworkSubmission 作业提交与成绩
     * @return 结果
     */
    @Override
    public int updateHomeworkSubmission(HomeworkSubmission homeworkSubmission)
    {
        homeworkSubmission.setUpdateTime(DateUtils.getNowDate());
        return homeworkSubmissionMapper.updateHomeworkSubmission(homeworkSubmission);
    }

    /**
     * 批量删除作业提交与成绩
     * 
     * @param submissionIds 需要删除的作业提交与成绩主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkSubmissionBySubmissionIds(Long[] submissionIds)
    {
        return homeworkSubmissionMapper.deleteHomeworkSubmissionBySubmissionIds(submissionIds);
    }

    /**
     * 删除作业提交与成绩信息
     * 
     * @param submissionId 作业提交与成绩主键
     * @return 结果
     */
    @Override
    public int deleteHomeworkSubmissionBySubmissionId(Long submissionId)
    {
        return homeworkSubmissionMapper.deleteHomeworkSubmissionBySubmissionId(submissionId);
    }

    /**
     * 查询学生作业成绩分析
     */
    @Override
    public List<HomeworkSubmission> selectStudentScoreAnalysis(HomeworkSubmission homeworkSubmission)
    {
        return homeworkSubmissionMapper.selectStudentScoreAnalysis(homeworkSubmission);
    }
}
