package com.ruoyi.school.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作业提交与成绩对象 homework_submission
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public class HomeworkSubmission extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long submissionId;

    /** 关联作业任务ID */
    @Excel(name = "关联作业任务ID")
    private Long taskId;

    /** 学生ID(关联sys_user) */
    @Excel(name = "学生ID(关联sys_user)")
    private Long studentId;

    /** 学生姓名(冗余字段方便统计展示) */
    @Excel(name = "学生姓名(冗余字段方便统计展示)")
    private String studentName;

    /** 提交内容 */
    @Excel(name = "提交内容")
    private String submitContent;

    /** 提交附件地址 */
    @Excel(name = "提交附件地址")
    private String submitFiles;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date submitTime;

    /** 状态（0未提交 1已提交 2已批改） */
    @Excel(name = "状态", readConverterExp = "0=未提交,1=已提交,2=已批改")
    private String status;

    /** 作业得分 */
    @Excel(name = "作业得分")
    private BigDecimal score;

    /** 教师评语 */
    @Excel(name = "教师评语")
    private String teacherComment;

    /** 批改时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "批改时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date gradeTime;

    /** 批改人ID */
    @Excel(name = "批改人ID")
    private Long graderId;

    /** * 🔥 提交作业卡片作业标题（必须加这个，否则报错）
     */
    private String taskTitle;

    /** * 🔥 截止时间（必须加这个，否则报错）
     */
    private Date deadlineTime;

    /** 教师姓名 (查询用) */
    private String teacherName;

    /** 科目名称 (查询用) */
    private String subject;

    public void setSubject(String subject)
    {
        this.subject = subject;
    }

    public String getSubject()
    {
        return subject;
    }

    // 👇👇👇 关键是下面这两个 Setter 方法，之前肯定缺了它们 👇👇👇

    public void setTaskTitle(String taskTitle)
    {
        this.taskTitle = taskTitle;
    }

    public String getTaskTitle()
    {
        return taskTitle;
    }

    public void setDeadlineTime(Date deadlineTime)
    {
        this.deadlineTime = deadlineTime;
    }

    public Date getDeadlineTime()
    {
        return deadlineTime;
    }

    public void setTeacherName(String teacherName) 
    {
        this.teacherName = teacherName;
    }

    public String getTeacherName() 
    {
        return teacherName;
    }

    /** * 作业标题（非数据库字段，用于图表展示）
     *  必须加这个，否则前端显示 undefined  图表前端批改作业字段
     */
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public void setSubmissionId(Long submissionId) 
    {
        this.submissionId = submissionId;
    }

    public Long getSubmissionId() 
    {
        return submissionId;
    }

    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }

    public void setStudentName(String studentName) 
    {
        this.studentName = studentName;
    }

    public String getStudentName() 
    {
        return studentName;
    }

    public void setSubmitContent(String submitContent) 
    {
        this.submitContent = submitContent;
    }

    public String getSubmitContent() 
    {
        return submitContent;
    }

    public void setSubmitFiles(String submitFiles) 
    {
        this.submitFiles = submitFiles;
    }

    public String getSubmitFiles() 
    {
        return submitFiles;
    }

    public void setSubmitTime(Date submitTime) 
    {
        this.submitTime = submitTime;
    }

    public Date getSubmitTime() 
    {
        return submitTime;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setScore(BigDecimal score) 
    {
        this.score = score;
    }

    public BigDecimal getScore() 
    {
        return score;
    }

    public void setTeacherComment(String teacherComment) 
    {
        this.teacherComment = teacherComment;
    }

    public String getTeacherComment() 
    {
        return teacherComment;
    }

    public void setGradeTime(Date gradeTime) 
    {
        this.gradeTime = gradeTime;
    }

    public Date getGradeTime() 
    {
        return gradeTime;
    }

    public void setGraderId(Long graderId) 
    {
        this.graderId = graderId;
    }

    public Long getGraderId() 
    {
        return graderId;
    }

    // 生成对应的 Getter 和 Setter 方法
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("submissionId", getSubmissionId())
            .append("taskId", getTaskId())
            .append("studentId", getStudentId())
            .append("studentName", getStudentName())
            .append("submitContent", getSubmitContent())
            .append("submitFiles", getSubmitFiles())
            .append("submitTime", getSubmitTime())
            .append("status", getStatus())
            .append("score", getScore())
            .append("teacherComment", getTeacherComment())
            .append("gradeTime", getGradeTime())
            .append("graderId", getGraderId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
