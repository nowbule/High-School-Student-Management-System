package com.ruoyi.school.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.school.domain.SysCourse;
import com.ruoyi.school.service.ISysCourseService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 课程信息Controller
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@RestController
@RequestMapping("/school/course")
public class SysCourseController extends BaseController
{
    @Autowired
    private ISysCourseService sysCourseService;

    /**
     * 查询课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('school:course:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysCourse sysCourse)
    {
        startPage();
        List<SysCourse> list = sysCourseService.selectSysCourseList(sysCourse);
        return getDataTable(list);
    }

    /**
     * 导出课程信息列表
     */
    @PreAuthorize("@ss.hasPermi('school:course:export')")
    @Log(title = "课程信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysCourse sysCourse)
    {
        List<SysCourse> list = sysCourseService.selectSysCourseList(sysCourse);
        ExcelUtil<SysCourse> util = new ExcelUtil<SysCourse>(SysCourse.class);
        util.exportExcel(response, list, "课程信息数据");
    }

    /**
     * 获取课程信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:course:query')")
    @GetMapping(value = "/{courseId}")
    public AjaxResult getInfo(@PathVariable("courseId") Long courseId)
    {
        return success(sysCourseService.selectSysCourseByCourseId(courseId));
    }

    /**
     * 新增课程信息
     */
    @PreAuthorize("@ss.hasPermi('school:course:add')")
    @Log(title = "课程信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysCourse sysCourse)
    {
        return toAjax(sysCourseService.insertSysCourse(sysCourse));
    }

    /**
     * 修改课程信息
     */
    @PreAuthorize("@ss.hasPermi('school:course:edit')")
    @Log(title = "课程信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysCourse sysCourse)
    {
        return toAjax(sysCourseService.updateSysCourse(sysCourse));
    }

    /**
     * 删除课程信息
     */
    @PreAuthorize("@ss.hasPermi('school:course:remove')")
    @Log(title = "课程信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{courseIds}")
    public AjaxResult remove(@PathVariable Long[] courseIds)
    {
        return toAjax(sysCourseService.deleteSysCourseByCourseIds(courseIds));
    }
}
