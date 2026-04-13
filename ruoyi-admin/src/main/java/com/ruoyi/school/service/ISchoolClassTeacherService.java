package com.ruoyi.school.service;

import java.util.List;
import com.ruoyi.school.domain.SchoolClassTeacher;

/**
 * 班级科任老师Service接口
 * 
 * @author ruoyi
 * @date 2026-01-24
 */
public interface ISchoolClassTeacherService 
{
    /**
     * 查询班级科任老师列表
     * 
     * @param schoolClassTeacher 班级科任老师
     * @return 班级科任老师集合
     */
    public List<SchoolClassTeacher> selectSchoolClassTeacherList(SchoolClassTeacher schoolClassTeacher);

    /**
     * 新增班级科任老师
     * 
     * @param schoolClassTeacher 班级科任老师
     * @return 结果
     */
    public int insertSchoolClassTeacher(SchoolClassTeacher schoolClassTeacher);

    /**
     * 批量删除班级科任老师
     * 
     * @param ids 需要删除的班级科任老师主键集合
     * @return 结果
     */
    public int deleteSchoolClassTeacherByIds(Long[] ids);

    /**
     * 删除班级科任老师信息
     * 
     * @param id 班级科任老师主键
     * @return 结果
     */
    public int deleteSchoolClassTeacherById(Long id);
}
