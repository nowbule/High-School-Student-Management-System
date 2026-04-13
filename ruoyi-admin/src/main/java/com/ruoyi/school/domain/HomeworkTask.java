package com.ruoyi.school.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作业发布任务对象 homework_task
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public class HomeworkTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 作业任务ID */
    private Long taskId;

    /** 作业标题 */
    @Excel(name = "作业标题")
    private String taskTitle;

    /** 作业内容/要求 */
    @Excel(name = "作业内容/要求")
    private String taskContent;

    /** 附件地址(支持多个) */
    @Excel(name = "附件地址(支持多个)")
    private String fileUrls;

    /** 所属课程ID */
    @Excel(name = "所属课程ID")
    private Long courseId;

    /** 目标班级ID */
    @Excel(name = "目标班级ID")
    private Long classId;

    /** 发布教师ID(关联sys_user) */
    @Excel(name = "发布教师ID(关联sys_user)")
    private Long teacherId;

    /** 截止时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "截止时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deadlineTime;

    /** 状态（0草稿 1已发布 2已结束） */
    @Excel(name = "状态", readConverterExp = "0=草稿,1=已发布,2=已结束")
    private String status;

    public void setTaskId(Long taskId) 
    {
        this.taskId = taskId;
    }

    public Long getTaskId() 
    {
        return taskId;
    }

    public void setTaskTitle(String taskTitle) 
    {
        this.taskTitle = taskTitle;
    }

    public String getTaskTitle() 
    {
        return taskTitle;
    }

    public void setTaskContent(String taskContent) 
    {
        this.taskContent = taskContent;
    }

    public String getTaskContent() 
    {
        return taskContent;
    }

    public void setFileUrls(String fileUrls) 
    {
        this.fileUrls = fileUrls;
    }

    public String getFileUrls() 
    {
        return fileUrls;
    }

    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }

    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }

    public void setTeacherId(Long teacherId) 
    {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() 
    {
        return teacherId;
    }

    public void setDeadlineTime(Date deadlineTime) 
    {
        this.deadlineTime = deadlineTime;
    }

    public Date getDeadlineTime() 
    {
        return deadlineTime;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("taskId", getTaskId())
            .append("taskTitle", getTaskTitle())
            .append("taskContent", getTaskContent())
            .append("fileUrls", getFileUrls())
            .append("courseId", getCourseId())
            .append("classId", getClassId())
            .append("teacherId", getTeacherId())
            .append("deadlineTime", getDeadlineTime())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
