package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.HsScheduleMapper;
import com.ruoyi.school.domain.HsSchedule;
import com.ruoyi.school.service.IHsScheduleService;

/**
 * 班级课程Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-23
 */
@Service
public class HsScheduleServiceImpl implements IHsScheduleService 
{
    @Autowired
    private HsScheduleMapper hsScheduleMapper;

    /**
     * 查询班级课程
     * 
     * @param scheduleId 班级课程主键
     * @return 班级课程
     */
    @Override
    public HsSchedule selectHsScheduleByScheduleId(Long scheduleId)
    {
        return hsScheduleMapper.selectHsScheduleByScheduleId(scheduleId);
    }

    /**
     * 查询班级课程列表
     * 
     * @param hsSchedule 班级课程
     * @return 班级课程
     */
    @Override
    public List<HsSchedule> selectHsScheduleList(HsSchedule hsSchedule)
    {
        return hsScheduleMapper.selectHsScheduleList(hsSchedule);
    }

    /**
     * 新增班级课程
     * 
     * @param hsSchedule 班级课程
     * @return 结果
     */
    @Override
    public int insertHsSchedule(HsSchedule hsSchedule)
    {
        hsSchedule.setCreateTime(DateUtils.getNowDate());
        return hsScheduleMapper.insertHsSchedule(hsSchedule);
    }

    /**
     * 修改班级课程
     * 
     * @param hsSchedule 班级课程
     * @return 结果
     */
    @Override
    public int updateHsSchedule(HsSchedule hsSchedule)
    {
        hsSchedule.setUpdateTime(DateUtils.getNowDate());
        return hsScheduleMapper.updateHsSchedule(hsSchedule);
    }

    /**
     * 批量删除班级课程
     * 
     * @param scheduleIds 需要删除的班级课程主键
     * @return 结果
     */
    @Override
    public int deleteHsScheduleByScheduleIds(Long[] scheduleIds)
    {
        return hsScheduleMapper.deleteHsScheduleByScheduleIds(scheduleIds);
    }

    /**
     * 删除班级课程信息
     * 
     * @param scheduleId 班级课程主键
     * @return 结果
     */
    @Override
    public int deleteHsScheduleByScheduleId(Long scheduleId)
    {
        return hsScheduleMapper.deleteHsScheduleByScheduleId(scheduleId);
    }
}
