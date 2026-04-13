package com.ruoyi.school.mapper;

import java.util.List;
import com.ruoyi.school.domain.SysCourse;

/**
 * 课程信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
public interface SysCourseMapper 
{
    /**
     * 查询课程信息
     * 
     * @param courseId 课程信息主键
     * @return 课程信息
     */
    public SysCourse selectSysCourseByCourseId(Long courseId);

    /**
     * 查询课程信息列表
     * 
     * @param sysCourse 课程信息
     * @return 课程信息集合
     */
    public List<SysCourse> selectSysCourseList(SysCourse sysCourse);

    /**
     * 新增课程信息
     * 
     * @param sysCourse 课程信息
     * @return 结果
     */
    public int insertSysCourse(SysCourse sysCourse);

    /**
     * 修改课程信息
     * 
     * @param sysCourse 课程信息
     * @return 结果
     */
    public int updateSysCourse(SysCourse sysCourse);

    /**
     * 删除课程信息
     * 
     * @param courseId 课程信息主键
     * @return 结果
     */
    public int deleteSysCourseByCourseId(Long courseId);

    /**
     * 批量删除课程信息
     * 
     * @param courseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysCourseByCourseIds(Long[] courseIds);
}
