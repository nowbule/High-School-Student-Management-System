package com.ruoyi.school.mapper;

import java.util.List;
import java.util.Map;
import com.ruoyi.school.domain.HsAttendance;
import org.apache.ibatis.annotations.Mapper;       // ✅ 新增
import org.springframework.stereotype.Repository; // ✅ 新增，消除IDEA报错

/**
 * 学生考勤Mapper接口
 * @author ruoyi
 * @date 2025-12-27
 */
@Mapper      // ✅ 必须加这个，MyBatis 才能扫描到
@Repository  // ✅ 加这个是为了让 Serviceimpl 里的 @Autowired 不爆红
public interface HsAttendanceMapper
{
    /**
     * 查询学生考勤
     * @param attendanceId 学生考勤主键
     * @return 学生考勤
     */
    public HsAttendance selectHsAttendanceByAttendanceId(Long attendanceId);

    /**
     * 查询学生考勤列表
     * @param hsAttendance 学生考勤
     * @return 学生考勤集合
     */
    public List<HsAttendance> selectHsAttendanceList(HsAttendance hsAttendance);

    /**
     * 新增学生考勤
     * @param hsAttendance 学生考勤
     * @return 结果
     */
    public int insertHsAttendance(HsAttendance hsAttendance);

    /**
     * 修改学生考勤
     * @param hsAttendance 学生考勤
     * @return 结果
     */
    public int updateHsAttendance(HsAttendance hsAttendance);

    /**
     * 删除学生考勤
     * @param attendanceId 学生考勤主键
     * @return 结果
     */
    public int deleteHsAttendanceByAttendanceId(Long attendanceId);

    /**
     * 批量删除学生考勤
     * @param attendanceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHsAttendanceByAttendanceIds(Long[] attendanceIds);

    /**
     * 统计考勤状态
     */
    public List<Map<String, Object>> selectAttendanceStats(HsAttendance hsAttendance);
}