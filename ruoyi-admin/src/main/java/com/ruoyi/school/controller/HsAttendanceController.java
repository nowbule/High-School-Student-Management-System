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
import com.ruoyi.school.domain.HsAttendance;
import com.ruoyi.school.service.IHsAttendanceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 学生考勤Controller
 * 
 * @author ruoyi
 * @date 2025-12-27
 */
@RestController
@RequestMapping("/school/attendance")
public class HsAttendanceController extends BaseController
{
    @Autowired
    private IHsAttendanceService hsAttendanceService;

    /**
     * 查询学生考勤列表
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:list')")
    @GetMapping("/list")
    public TableDataInfo list(HsAttendance hsAttendance)
    {
        startPage();
        List<HsAttendance> list = hsAttendanceService.selectHsAttendanceList(hsAttendance);
        return getDataTable(list);
    }

    /**
     * 导出学生考勤列表
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:export')")
    @Log(title = "学生考勤", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HsAttendance hsAttendance)
    {
        List<HsAttendance> list = hsAttendanceService.selectHsAttendanceList(hsAttendance);
        ExcelUtil<HsAttendance> util = new ExcelUtil<HsAttendance>(HsAttendance.class);
        util.exportExcel(response, list, "学生考勤数据");
    }

    /**
     * 获取学生考勤详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:query')")
    @GetMapping(value = "/{attendanceId}")
    public AjaxResult getInfo(@PathVariable("attendanceId") Long attendanceId)
    {
        return success(hsAttendanceService.selectHsAttendanceByAttendanceId(attendanceId));
    }

    /**
     * 新增学生考勤
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:add')")
    @Log(title = "学生考勤", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HsAttendance hsAttendance)
    {
        return toAjax(hsAttendanceService.insertHsAttendance(hsAttendance));
    }

    /**
     * 修改学生考勤
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:edit')")
    @Log(title = "学生考勤", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HsAttendance hsAttendance)
    {
        return toAjax(hsAttendanceService.updateHsAttendance(hsAttendance));
    }

    /**
     * 删除学生考勤
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:remove')")
    @Log(title = "学生考勤", businessType = BusinessType.DELETE)
	@DeleteMapping("/{attendanceIds}")
    public AjaxResult remove(@PathVariable Long[] attendanceIds)
    {
        return toAjax(hsAttendanceService.deleteHsAttendanceByAttendanceIds(attendanceIds));
    }

    /**
     * 初始化班级考勤（默认全勤）
     */
    @PreAuthorize("@ss.hasPermi('school:attendance:add')")
    @Log(title = "学生考勤", businessType = BusinessType.INSERT)
    @PostMapping("/init")
    public AjaxResult init(@RequestBody HsAttendance hsAttendance)
    {
        if (hsAttendance.getDeptId() == null || hsAttendance.getAttendanceDate() == null) {
            return error("请选择班级和日期");
        }
        hsAttendanceService.initAttendance(hsAttendance.getDeptId(), hsAttendance.getAttendanceDate());
        return success();
    }

    /**
     * 获取考勤统计图表数据
     */
    @GetMapping("/stats")
    public AjaxResult stats(HsAttendance hsAttendance)
    {
        return success(hsAttendanceService.selectAttendanceStats(hsAttendance));
    }
}
