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
import com.ruoyi.school.domain.SchoolClassVideo;
import com.ruoyi.school.service.ISchoolClassVideoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 班级视频Controller
 * 
 * @author ruoyi
 * @date 2026-01-14
 */
@RestController
@RequestMapping("/school/video")
public class SchoolClassVideoController extends BaseController
{
    @Autowired
    private ISchoolClassVideoService schoolClassVideoService;

    /**
     * 查询班级视频列表
     */
    @PreAuthorize("@ss.hasPermi('school:video:list')")
    @GetMapping("/list")
    public TableDataInfo list(SchoolClassVideo schoolClassVideo)
    {
        startPage();
        List<SchoolClassVideo> list = schoolClassVideoService.selectSchoolClassVideoList(schoolClassVideo);
        return getDataTable(list);
    }

    /**
     * 导出班级视频列表
     */
    @PreAuthorize("@ss.hasPermi('school:video:export')")
    @Log(title = "班级视频", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SchoolClassVideo schoolClassVideo)
    {
        List<SchoolClassVideo> list = schoolClassVideoService.selectSchoolClassVideoList(schoolClassVideo);
        ExcelUtil<SchoolClassVideo> util = new ExcelUtil<SchoolClassVideo>(SchoolClassVideo.class);
        util.exportExcel(response, list, "班级视频数据");
    }

    /**
     * 获取班级视频详细信息
     */
    @PreAuthorize("@ss.hasPermi('school:video:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(schoolClassVideoService.selectSchoolClassVideoById(id));
    }

    /**
     * 新增班级视频
     */
    @PreAuthorize("@ss.hasPermi('school:video:add')")
    @Log(title = "班级视频", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SchoolClassVideo schoolClassVideo)
    {
        return toAjax(schoolClassVideoService.insertSchoolClassVideo(schoolClassVideo));
    }

    /**
     * 修改班级视频
     */
    @PreAuthorize("@ss.hasPermi('school:video:edit')")
    @Log(title = "班级视频", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SchoolClassVideo schoolClassVideo)
    {
        return toAjax(schoolClassVideoService.updateSchoolClassVideo(schoolClassVideo));
    }

    /**
     * 删除班级视频
     */
    @PreAuthorize("@ss.hasPermi('school:video:remove')")
    @Log(title = "班级视频", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(schoolClassVideoService.deleteSchoolClassVideoByIds(ids));
    }
}
