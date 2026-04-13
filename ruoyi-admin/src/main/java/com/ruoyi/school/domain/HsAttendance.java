package com.ruoyi.school.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 学生考勤对象 hs_attendance
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public class HsAttendance extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 考勤ID */
    private Long attendanceId;

    /** 学生ID(关联sys_user) */
    @Excel(name = "学生ID(关联sys_user)")
    private Long studentId;

    /** 学生姓名(冗余方便查询) */
    @Excel(name = "学生姓名(冗余方便查询)")
    private String studentName;

    /** 考勤日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "考勤日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date attendanceDate;

    /** 班级名称 */
    @Excel(name = "班级名称")
    private String deptName;

    /** 学号/账号 */
    @Excel(name = "学号")
    private String studentNo;

    /** 班级ID (用于查询) */
    private Long deptId;

    /** 状态(1正常 2迟到 3早退 4缺勤 5请假) */
    @Excel(name = "状态(1正常 2迟到 3早退 4缺勤 5请假)")
    private String status;

    /** 删除标志 */
    private String delFlag;

    public void setAttendanceId(Long attendanceId) 
    {
        this.attendanceId = attendanceId;
    }

    public Long getAttendanceId() 
    {
        return attendanceId;
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

    public void setAttendanceDate(Date attendanceDate) 
    {
        this.attendanceDate = attendanceDate;
    }

    public Date getAttendanceDate() 
    {
        return attendanceDate;
    }

    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }

    public void setStudentNo(String studentNo) 
    {
        this.studentNo = studentNo;
    }

    public String getStudentNo() 
    {
        return studentNo;
    }

    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("attendanceId", getAttendanceId())
            .append("studentId", getStudentId())
            .append("studentName", getStudentName())
            .append("attendanceDate", getAttendanceDate())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
