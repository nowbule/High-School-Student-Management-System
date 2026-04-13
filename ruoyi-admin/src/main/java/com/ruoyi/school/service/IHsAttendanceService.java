package com.ruoyi.school.service;

import java.util.List;
import java.util.Map; // ✅ 补上了这个 import
import com.ruoyi.school.domain.HsAttendance;

import java.util.Date;

/**
 * 学生考勤Service接口
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public interface IHsAttendanceService
{
    /**
     * 初始化班级考勤
     * 
     * @param deptId 班级ID
     * @param date 考勤日期
     */
    public void initAttendance(Long deptId, Date date);

    /**
     * 查询学生考勤
     * * @param attendanceId 学生考勤主键
     * @return 学生考勤
     */
    public HsAttendance selectHsAttendanceByAttendanceId(Long attendanceId);

    /**
     * 查询学生考勤列表
     * * @param hsAttendance 学生考勤
     * @return 学生考勤集合
     */
    public List<HsAttendance> selectHsAttendanceList(HsAttendance hsAttendance);

    /**
     * 新增学生考勤
     * * @param hsAttendance 学生考勤
     * @return 结果
     */
    public int insertHsAttendance(HsAttendance hsAttendance);

    /**
     * 修改学生考勤
     * * @param hsAttendance 学生考勤
     * @return 结果
     */
    public int updateHsAttendance(HsAttendance hsAttendance);

    /**
     * 批量删除学生考勤
     * * @param attendanceIds 需要删除的学生考勤主键集合
     * @return 结果
     */
    public int deleteHsAttendanceByAttendanceIds(Long[] attendanceIds);

    /**
     * 删除学生考勤信息
     * * @param attendanceId 学生考勤主键
     * @return 结果
     */
    public int deleteHsAttendanceByAttendanceId(Long attendanceId);

    /**
     * 统计考勤状态
     */
    public List<Map<String, Object>> selectAttendanceStats(HsAttendance hsAttendance);
}