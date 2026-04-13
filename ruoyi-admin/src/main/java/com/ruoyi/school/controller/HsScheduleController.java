package com.ruoyi.school.controller;

import java.util.List;
import java.util.stream.Collectors;
import java.util.Collections;
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
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.school.domain.HsSchedule;
import com.ruoyi.school.service.IHsScheduleService;
import com.ruoyi.school.domain.SchoolClassTeacher;
import com.ruoyi.school.service.ISchoolClassTeacherService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 班级课程Controller
 * 
 * @author ruoyi
 * @date 2025-12-23
 */
@RestController
@RequestMapping("/school/schedule")
public class HsScheduleController extends BaseController
{
    @Autowired
    private IHsScheduleService hsScheduleService;

    @Autowired
    private ISchoolClassTeacherService schoolClassTeacherService;

    /**
     * 查询班级课程列表
     */
    @PreAuthorize("@ss.hasPermi('school:schedule:list')")
    @GetMapping("/list")
    public TableDataInfo list(HsSchedule hsSchedule)
    {
        // 如果不是管理员，只能查看自己任教班级的课表
        if (!SysUser.isAdmin(getUserId())) {
            SchoolClassTeacher query = new SchoolClassTeacher();
            query.setTeacherId(getUserId());
            List<SchoolClassTeacher> teacherClasses = schoolClassTeacherService.selectSchoolClassTeacherList(query);
            
            if (teacherClasses != null && !teacherClasses.isEmpty()) {
                List<Long> classIds = teacherClasses.stream()
                        .map(SchoolClassTeacher::getClassId)
                        .distinct()
                        .collect(Collectors.toList());
                hsSchedule.getParams().put("classIds", classIds);
            } else {
                // 如果没有任教班级，则不显示任何数据
                hsSchedule.getParams().put("classIds", Collections.singletonList(-1L));
            }
        }

        startPage();
        List<HsSchedule> list = hsScheduleService.selectHsScheduleList(hsSchedule);
        return getDataTable(list);
    }

    /**
     * 导出班级课程列表
     */
    @PreAuthorize("@ss.hasPermi('school:schedule:export')")
    @Log(title = "班级课程", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HsSchedule hsSchedule)
    {
        List<HsSchedule> list = hsScheduleService.selectHsScheduleList(hsSchedule);
        ExcelUtil<HsSchedule> util = new ExcelUtil<HsSchedule>(HsSchedule.class);
        util.exportExcel(response, list, "班级课程数据");
    }

    /**
     * 获取班级课程详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:schedule:query')")
    @GetMapping(value = "/{scheduleId}")
    public AjaxResult getInfo(@PathVariable("scheduleId") Long scheduleId)
    {
        return success(hsScheduleService.selectHsScheduleByScheduleId(scheduleId));
    }

    /**
     * 新增班级课程
     */
    @PreAuthorize("@ss.hasPermi('school:schedule:add')")
    @Log(title = "班级课程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HsSchedule hsSchedule)
    {
        return toAjax(hsScheduleService.insertHsSchedule(hsSchedule));
    }

    /**
     * 修改班级课程
     */
    @PreAuthorize("@ss.hasPermi('school:schedule:edit')")
    @Log(title = "班级课程", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HsSchedule hsSchedule)
    {
        return toAjax(hsScheduleService.updateHsSchedule(hsSchedule));
    }

    /**
     * 删除班级课程
     */
    @PreAuthorize("@ss.hasPermi('school:schedule:remove')")
    @Log(title = "班级课程", businessType = BusinessType.DELETE)
	@DeleteMapping("/{scheduleIds}")
    public AjaxResult remove(@PathVariable Long[] scheduleIds)
    {
        return toAjax(hsScheduleService.deleteHsScheduleByScheduleIds(scheduleIds));
    }
}
