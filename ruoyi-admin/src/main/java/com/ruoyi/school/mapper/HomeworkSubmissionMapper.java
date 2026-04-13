package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.HomeworkSubmission;

/**
 * 作业提交与成绩Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public interface HomeworkSubmissionMapper 
{
    /**
     * 查询作业提交与成绩
     * 
     * @param submissionId 作业提交与成绩主键
     * @return 作业提交与成绩
     */
    public HomeworkSubmission selectHomeworkSubmissionBySubmissionId(Long submissionId);

    /**
     * 查询作业提交与成绩列表
     * 
     * @param homeworkSubmission 作业提交与成绩
     * @return 作业提交与成绩集合
     */
    public List<HomeworkSubmission> selectHomeworkSubmissionList(HomeworkSubmission homeworkSubmission);

    /**
     * 新增作业提交与成绩
     * 
     * @param homeworkSubmission 作业提交与成绩
     * @return 结果
     */
    public int insertHomeworkSubmission(HomeworkSubmission homeworkSubmission);

    /**
     * 修改作业提交与成绩
     * 
     * @param homeworkSubmission 作业提交与成绩
     * @return 结果
     */
    public int updateHomeworkSubmission(HomeworkSubmission homeworkSubmission);

    /**
     * 删除作业提交与成绩
     * 
     * @param submissionId 作业提交与成绩主键
     * @return 结果
     */
    public int deleteHomeworkSubmissionBySubmissionId(Long submissionId);

    /**
     * 批量删除作业提交与成绩
     * 
     * @param submissionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHomeworkSubmissionBySubmissionIds(Long[] submissionIds);

    /**
     * 查询学生作业成绩分析
     */
    public List<HomeworkSubmission> selectStudentScoreAnalysis(HomeworkSubmission homeworkSubmission);
}
