package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.HsSchedule;

/**
 * 班级课程Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-23
 */
public interface HsScheduleMapper 
{
    /**
     * 查询班级课程
     * 
     * @param scheduleId 班级课程主键
     * @return 班级课程
     */
    public HsSchedule selectHsScheduleByScheduleId(Long scheduleId);

    /**
     * 查询班级课程列表
     * 
     * @param hsSchedule 班级课程
     * @return 班级课程集合
     */
    public List<HsSchedule> selectHsScheduleList(HsSchedule hsSchedule);

    /**
     * 新增班级课程
     * 
     * @param hsSchedule 班级课程
     * @return 结果
     */
    public int insertHsSchedule(HsSchedule hsSchedule);

    /**
     * 修改班级课程
     * 
     * @param hsSchedule 班级课程
     * @return 结果
     */
    public int updateHsSchedule(HsSchedule hsSchedule);

    /**
     * 删除班级课程
     * 
     * @param scheduleId 班级课程主键
     * @return 结果
     */
    public int deleteHsScheduleByScheduleId(Long scheduleId);

    /**
     * 批量删除班级课程
     * 
     * @param scheduleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHsScheduleByScheduleIds(Long[] scheduleIds);
}
