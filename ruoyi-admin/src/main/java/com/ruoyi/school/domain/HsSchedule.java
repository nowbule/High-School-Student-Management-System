package com.ruoyi.school.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 班级课程对象 hs_schedule
 * 
 * @author ruoyi
 * @date 2025-12-23
 */
public class HsSchedule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 课表ID */
    private Long scheduleId;

    /** 班级ID */
    @Excel(name = "班级ID")
    private Long classId;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String className;

    /** 科目ID */
    @Excel(name = "科目ID")
    private Long courseId;

    /** 科目名称 */
    @Excel(name = "科目名称")
    private String courseName;

    /** 授课老师ID */
    @Excel(name = "授课老师ID")
    private Long teacherId;

    /** 授课老师姓名 */
    @Excel(name = "授课老师姓名")
    private String teacherName;

    /** 星期(1-7) */
    @Excel(name = "星期(1-7)")
    private Integer weekDay;

    /** 节次(1-8) */
    @Excel(name = "节次(1-8)")
    private Integer section;

    /** 时段(0上午 1下午 2晚自习) */
    @Excel(name = "时段(0上午 1下午 2晚自习)")
    private String timePeriod;

    /** 上课地点 */
    @Excel(name = "上课地点")
    private String classroom;

    /** 学年学期(如2024-1) */
    @Excel(name = "学年学期(如2024-1)")
    private String schoolYear;

    public void setScheduleId(Long scheduleId) 
    {
        this.scheduleId = scheduleId;
    }

    public Long getScheduleId() 
    {
        return scheduleId;
    }

    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }

    public void setClassName(String className) 
    {
        this.className = className;
    }

    public String getClassName() 
    {
        return className;
    }

    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }

    public void setCourseName(String courseName) 
    {
        this.courseName = courseName;
    }

    public String getCourseName() 
    {
        return courseName;
    }

    public void setTeacherId(Long teacherId) 
    {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() 
    {
        return teacherId;
    }

    public void setTeacherName(String teacherName) 
    {
        this.teacherName = teacherName;
    }

    public String getTeacherName() 
    {
        return teacherName;
    }

    public void setWeekDay(Integer weekDay) 
    {
        this.weekDay = weekDay;
    }

    public Integer getWeekDay() 
    {
        return weekDay;
    }

    public void setSection(Integer section) 
    {
        this.section = section;
    }

    public Integer getSection() 
    {
        return section;
    }

    public void setTimePeriod(String timePeriod) 
    {
        this.timePeriod = timePeriod;
    }

    public String getTimePeriod() 
    {
        return timePeriod;
    }

    public void setClassroom(String classroom) 
    {
        this.classroom = classroom;
    }

    public String getClassroom() 
    {
        return classroom;
    }

    public void setSchoolYear(String schoolYear) 
    {
        this.schoolYear = schoolYear;
    }

    public String getSchoolYear() 
    {
        return schoolYear;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("scheduleId", getScheduleId())
            .append("classId", getClassId())
            .append("className", getClassName())
            .append("courseId", getCourseId())
            .append("courseName", getCourseName())
            .append("teacherId", getTeacherId())
            .append("teacherName", getTeacherName())
            .append("weekDay", getWeekDay())
            .append("section", getSection())
            .append("timePeriod", getTimePeriod())
            .append("classroom", getClassroom())
            .append("schoolYear", getSchoolYear())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
