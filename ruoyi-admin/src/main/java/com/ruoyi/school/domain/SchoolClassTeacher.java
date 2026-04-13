package com.ruoyi.school.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 班级科任老师对象 school_class_teacher
 * 
 * @author ruoyi
 * @date 2026-01-24
 */
public class SchoolClassTeacher extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long classId;

    /** 教师ID */
    @Excel(name = "教师ID")
    private Long teacherId;

    /** 科目 */
    @Excel(name = "科目")
    private String subject;

    /** 类型 */
    private String type;

    /** 教师姓名 (非数据库字段) */
    private String teacherName;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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

    public void setSubject(String subject) 
    {
        this.subject = subject;
    }

    public String getSubject() 
    {
        return subject;
    }

    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("classId", getClassId())
            .append("teacherId", getTeacherId())
            .append("subject", getSubject())
            .append("type", getType())
            .append("createTime", getCreateTime())
            .toString();
    }
}
