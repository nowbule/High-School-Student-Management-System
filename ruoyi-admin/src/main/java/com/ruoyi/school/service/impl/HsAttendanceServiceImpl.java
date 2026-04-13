package com.ruoyi.school.service.impl;

import java.util.List;
import java.util.Map; // ✅ 补上了这个关键 import
import java.util.Date;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.HsAttendanceMapper;
import com.ruoyi.school.domain.HsAttendance;
import com.ruoyi.school.service.IHsAttendanceService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysUserService;

/**
 * 学生考勤Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@Service
public class HsAttendanceServiceImpl implements IHsAttendanceService
{
    @Autowired
    private HsAttendanceMapper hsAttendanceMapper;

    @Autowired
    private ISysUserService userService;

    /**
     * 初始化班级考勤
     */
    @Override
    public void initAttendance(Long deptId, Date date)
    {
        SysUser user = new SysUser();
        user.setDeptId(deptId);
        List<SysUser> students = userService.selectUserList(user);
        for (SysUser student : students)
        {
            // Check if exists
            HsAttendance query = new HsAttendance();
            query.setStudentId(student.getUserId());
            query.setAttendanceDate(date);
            List<HsAttendance> list = hsAttendanceMapper.selectHsAttendanceList(query);
            
            if (list.isEmpty())
            {
                HsAttendance attendance = new HsAttendance();
                attendance.setStudentId(student.getUserId());
                attendance.setStudentName(student.getNickName());
                attendance.setAttendanceDate(date);
                attendance.setStatus("1"); // Normal
                attendance.setCreateTime(DateUtils.getNowDate());
                hsAttendanceMapper.insertHsAttendance(attendance);
            }
        }
    }

    /**
     * 查询学生考勤
     * * @param attendanceId 学生考勤主键
     * @return 学生考勤
     */
    @Override
    public HsAttendance selectHsAttendanceByAttendanceId(Long attendanceId)
    {
        return hsAttendanceMapper.selectHsAttendanceByAttendanceId(attendanceId);
    }

    /**
     * 查询学生考勤列表
     * * @param hsAttendance 学生考勤
     * @return 学生考勤
     */
    @Override
    public List<HsAttendance> selectHsAttendanceList(HsAttendance hsAttendance)
    {
        return hsAttendanceMapper.selectHsAttendanceList(hsAttendance);
    }

    /**
     * 新增学生考勤
     * * @param hsAttendance 学生考勤
     * @return 结果
     */
    @Override
    public int insertHsAttendance(HsAttendance hsAttendance)
    {
        hsAttendance.setCreateTime(DateUtils.getNowDate());
        return hsAttendanceMapper.insertHsAttendance(hsAttendance);
    }

    /**
     * 修改学生考勤
     * * @param hsAttendance 学生考勤
     * @return 结果
     */
    @Override
    public int updateHsAttendance(HsAttendance hsAttendance)
    {
        hsAttendance.setUpdateTime(DateUtils.getNowDate());
        return hsAttendanceMapper.updateHsAttendance(hsAttendance);
    }

    /**
     * 批量删除学生考勤
     * * @param attendanceIds 需要删除的学生考勤主键
     * @return 结果
     */
    @Override
    public int deleteHsAttendanceByAttendanceIds(Long[] attendanceIds)
    {
        return hsAttendanceMapper.deleteHsAttendanceByAttendanceIds(attendanceIds);
    }

    /**
     * 删除学生考勤信息
     * * @param attendanceId 学生考勤主键
     * @return 结果
     */
    @Override
    public int deleteHsAttendanceByAttendanceId(Long attendanceId)
    {
        return hsAttendanceMapper.deleteHsAttendanceByAttendanceId(attendanceId);
    }

    /**
     * 统计考勤状态
     */
    @Override
    public List<Map<String, Object>> selectAttendanceStats(HsAttendance hsAttendance)
    {
        return hsAttendanceMapper.selectAttendanceStats(hsAttendance);
    }
}