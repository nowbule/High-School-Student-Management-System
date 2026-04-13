package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.SysClassMapper;
import com.ruoyi.school.domain.SysClass;
import com.ruoyi.school.service.ISysClassService;

/**
 * 班级信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@Service
public class SysClassServiceImpl implements ISysClassService 
{
    @Autowired
    private SysClassMapper sysClassMapper;

    /**
     * 查询班级信息
     * 
     * @param classId 班级信息主键
     * @return 班级信息
     */
    @Override
    public SysClass selectSysClassByClassId(Long classId)
    {
        return sysClassMapper.selectSysClassByClassId(classId);
    }

    /**
     * 查询班级信息列表
     * 
     * @param sysClass 班级信息
     * @return 班级信息
     */
    @Override
    public List<SysClass> selectSysClassList(SysClass sysClass)
    {
        return sysClassMapper.selectSysClassList(sysClass);
    }

    /**
     * 新增班级信息
     * 
     * @param sysClass 班级信息
     * @return 结果
     */
    @Override
    public int insertSysClass(SysClass sysClass)
    {
        sysClass.setCreateTime(DateUtils.getNowDate());
        return sysClassMapper.insertSysClass(sysClass);
    }

    /**
     * 修改班级信息
     * 
     * @param sysClass 班级信息
     * @return 结果
     */
    @Override
    public int updateSysClass(SysClass sysClass)
    {
        sysClass.setUpdateTime(DateUtils.getNowDate());
        return sysClassMapper.updateSysClass(sysClass);
    }

    /**
     * 批量删除班级信息
     * 
     * @param classIds 需要删除的班级信息主键
     * @return 结果
     */
    @Override
    public int deleteSysClassByClassIds(Long[] classIds)
    {
        return sysClassMapper.deleteSysClassByClassIds(classIds);
    }

    /**
     * 删除班级信息信息
     * 
     * @param classId 班级信息主键
     * @return 结果
     */
    @Override
    public int deleteSysClassByClassId(Long classId)
    {
        return sysClassMapper.deleteSysClassByClassId(classId);
    }
}
