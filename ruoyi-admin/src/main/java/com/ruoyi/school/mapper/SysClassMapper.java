package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.SysClass;

/**
 * 班级信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public interface SysClassMapper 
{
    /**
     * 查询班级信息
     * 
     * @param classId 班级信息主键
     * @return 班级信息
     */
    public SysClass selectSysClassByClassId(Long classId);

    /**
     * 查询班级信息列表
     * 
     * @param sysClass 班级信息
     * @return 班级信息集合
     */
    public List<SysClass> selectSysClassList(SysClass sysClass);

    /**
     * 新增班级信息
     * 
     * @param sysClass 班级信息
     * @return 结果
     */
    public int insertSysClass(SysClass sysClass);

    /**
     * 修改班级信息
     * 
     * @param sysClass 班级信息
     * @return 结果
     */
    public int updateSysClass(SysClass sysClass);

    /**
     * 删除班级信息
     * 
     * @param classId 班级信息主键
     * @return 结果
     */
    public int deleteSysClassByClassId(Long classId);

    /**
     * 批量删除班级信息
     * 
     * @param classIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysClassByClassIds(Long[] classIds);
}
