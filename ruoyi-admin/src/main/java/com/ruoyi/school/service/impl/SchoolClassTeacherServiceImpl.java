package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.SchoolClassTeacherMapper;
import com.ruoyi.school.domain.SchoolClassTeacher;
import com.ruoyi.school.service.ISchoolClassTeacherService;

/**
 * 班级科任老师Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-01-24
 */
@Service
public class SchoolClassTeacherServiceImpl implements ISchoolClassTeacherService 
{
    @Autowired
    private SchoolClassTeacherMapper schoolClassTeacherMapper;

    /**
     * 查询班级科任老师列表
     * 
     * @param schoolClassTeacher 班级科任老师
     * @return 班级科任老师
     */
    @Override
    public List<SchoolClassTeacher> selectSchoolClassTeacherList(SchoolClassTeacher schoolClassTeacher)
    {
        return schoolClassTeacherMapper.selectSchoolClassTeacherList(schoolClassTeacher);
    }

    /**
     * 新增班级科任老师
     * 
     * @param schoolClassTeacher 班级科任老师
     * @return 结果
     */
    @Override
    public int insertSchoolClassTeacher(SchoolClassTeacher schoolClassTeacher)
    {
        schoolClassTeacher.setCreateTime(DateUtils.getNowDate());
        return schoolClassTeacherMapper.insertSchoolClassTeacher(schoolClassTeacher);
    }

    /**
     * 批量删除班级科任老师
     * 
     * @param ids 需要删除的班级科任老师主键
     * @return 结果
     */
    @Override
    public int deleteSchoolClassTeacherByIds(Long[] ids)
    {
        return schoolClassTeacherMapper.deleteSchoolClassTeacherByIds(ids);
    }

    /**
     * 删除班级科任老师信息
     * 
     * @param id 班级科任老师主键
     * @return 结果
     */
    @Override
    public int deleteSchoolClassTeacherById(Long id)
    {
        return schoolClassTeacherMapper.deleteSchoolClassTeacherById(id);
    }
}
