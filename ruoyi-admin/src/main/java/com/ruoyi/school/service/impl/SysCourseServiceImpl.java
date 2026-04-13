package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.SysCourseMapper;
import com.ruoyi.school.domain.SysCourse;
import com.ruoyi.school.service.ISysCourseService;

/**
 * 课程信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@Service
public class SysCourseServiceImpl implements ISysCourseService 
{
    @Autowired
    private SysCourseMapper sysCourseMapper;

    /**
     * 查询课程信息
     * 
     * @param courseId 课程信息主键
     * @return 课程信息
     */
    @Override
    public SysCourse selectSysCourseByCourseId(Long courseId)
    {
        return sysCourseMapper.selectSysCourseByCourseId(courseId);
    }

    /**
     * 查询课程信息列表
     * 
     * @param sysCourse 课程信息
     * @return 课程信息
     */
    @Override
    public List<SysCourse> selectSysCourseList(SysCourse sysCourse)
    {
        return sysCourseMapper.selectSysCourseList(sysCourse);
    }

    /**
     * 新增课程信息
     * 
     * @param sysCourse 课程信息
     * @return 结果
     */
    @Override
    public int insertSysCourse(SysCourse sysCourse)
    {
        sysCourse.setCreateTime(DateUtils.getNowDate());
        return sysCourseMapper.insertSysCourse(sysCourse);
    }

    /**
     * 修改课程信息
     * 
     * @param sysCourse 课程信息
     * @return 结果
     */
    @Override
    public int updateSysCourse(SysCourse sysCourse)
    {
        sysCourse.setUpdateTime(DateUtils.getNowDate());
        return sysCourseMapper.updateSysCourse(sysCourse);
    }

    /**
     * 批量删除课程信息
     * 
     * @param courseIds 需要删除的课程信息主键
     * @return 结果
     */
    @Override
    public int deleteSysCourseByCourseIds(Long[] courseIds)
    {
        return sysCourseMapper.deleteSysCourseByCourseIds(courseIds);
    }

    /**
     * 删除课程信息信息
     * 
     * @param courseId 课程信息主键
     * @return 结果
     */
    @Override
    public int deleteSysCourseByCourseId(Long courseId)
    {
        return sysCourseMapper.deleteSysCourseByCourseId(courseId);
    }
}
