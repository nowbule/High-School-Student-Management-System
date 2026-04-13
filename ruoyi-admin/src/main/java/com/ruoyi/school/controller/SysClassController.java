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
import com.ruoyi.school.domain.SysClass;
import com.ruoyi.school.service.ISysClassService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 班级信息Controller
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@RestController
@RequestMapping("/school/banji")
public class SysClassController extends BaseController
{
    @Autowired
    private ISysClassService sysClassService;

    /**
     * 查询班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('school:banji:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysClass sysClass)
    {
        startPage();
        List<SysClass> list = sysClassService.selectSysClassList(sysClass);
        return getDataTable(list);
    }

    /**
     * 导出班级信息列表
     */
    @PreAuthorize("@ss.hasPermi('school:banji:export')")
    @Log(title = "班级信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysClass sysClass)
    {
        List<SysClass> list = sysClassService.selectSysClassList(sysClass);
        ExcelUtil<SysClass> util = new ExcelUtil<SysClass>(SysClass.class);
        util.exportExcel(response, list, "班级信息数据");
    }

    /**
     * 获取班级信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:banji:query')")
    @GetMapping(value = "/{classId}")
    public AjaxResult getInfo(@PathVariable("classId") Long classId)
    {
        return success(sysClassService.selectSysClassByClassId(classId));
    }

    /**
     * 新增班级信息
     */
    @PreAuthorize("@ss.hasPermi('school:banji:add')")
    @Log(title = "班级信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysClass sysClass)
    {
        return toAjax(sysClassService.insertSysClass(sysClass));
    }

    /**
     * 修改班级信息
     */
    @PreAuthorize("@ss.hasPermi('school:banji:edit')")
    @Log(title = "班级信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysClass sysClass)
    {
        return toAjax(sysClassService.updateSysClass(sysClass));
    }

    /**
     * 删除班级信息
     */
    @PreAuthorize("@ss.hasPermi('school:banji:remove')")
    @Log(title = "班级信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{classIds}")
    public AjaxResult remove(@PathVariable Long[] classIds)
    {
        return toAjax(sysClassService.deleteSysClassByClassIds(classIds));
    }
}
