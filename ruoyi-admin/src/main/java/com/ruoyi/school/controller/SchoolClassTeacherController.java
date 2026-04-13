package com.ruoyi.school.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.school.domain.SchoolClassTeacher;
import com.ruoyi.school.service.ISchoolClassTeacherService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 班级科任老师Controller
 * 
 * @author ruoyi
 * @date 2026-01-24
 */
@RestController
@RequestMapping("/school/classTeacher")
public class SchoolClassTeacherController extends BaseController
{
    @Autowired
    private ISchoolClassTeacherService schoolClassTeacherService;

    /**
     * 查询班级科任老师列表
     */
    @PreAuthorize("@ss.hasPermi('school:banji:query')")
    @GetMapping("/list")
    public TableDataInfo list(SchoolClassTeacher schoolClassTeacher)
    {
        startPage();
        List<SchoolClassTeacher> list = schoolClassTeacherService.selectSchoolClassTeacherList(schoolClassTeacher);
        return getDataTable(list);
    }

    /**
     * 新增班级科任老师
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "班级科任老师", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SchoolClassTeacher schoolClassTeacher)
    {
        return toAjax(schoolClassTeacherService.insertSchoolClassTeacher(schoolClassTeacher));
    }

    /**
     * 删除班级科任老师
     */
    @PreAuthorize("@ss.hasRole('admin')")
    @Log(title = "班级科任老师", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(schoolClassTeacherService.deleteSchoolClassTeacherByIds(ids));
    }
}
