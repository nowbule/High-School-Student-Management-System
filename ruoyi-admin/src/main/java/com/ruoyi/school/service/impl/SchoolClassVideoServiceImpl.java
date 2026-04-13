package com.ruoyi.school.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.school.mapper.SchoolClassVideoMapper;
import com.ruoyi.school.domain.SchoolClassVideo;
import com.ruoyi.school.service.ISchoolClassVideoService;

/**
 * 班级视频Service业务层处理
 * 
 * @author ruoyi
 * @date 2026-01-14
 */
@Service
public class SchoolClassVideoServiceImpl implements ISchoolClassVideoService 
{
    @Autowired
    private SchoolClassVideoMapper schoolClassVideoMapper;

    /**
     * 查询班级视频
     * 
     * @param id 班级视频主键
     * @return 班级视频
     */
    @Override
    public SchoolClassVideo selectSchoolClassVideoById(Long id)
    {
        return schoolClassVideoMapper.selectSchoolClassVideoById(id);
    }

    /**
     * 查询班级视频列表
     * 
     * @param schoolClassVideo 班级视频
     * @return 班级视频
     */
    @Override
    public List<SchoolClassVideo> selectSchoolClassVideoList(SchoolClassVideo schoolClassVideo)
    {
        return schoolClassVideoMapper.selectSchoolClassVideoList(schoolClassVideo);
    }

    /**
     * 新增班级视频
     * 
     * @param schoolClassVideo 班级视频
     * @return 结果
     */
    @Override
    public int insertSchoolClassVideo(SchoolClassVideo schoolClassVideo)
    {
        schoolClassVideo.setCreateTime(DateUtils.getNowDate());
        return schoolClassVideoMapper.insertSchoolClassVideo(schoolClassVideo);
    }

    /**
     * 修改班级视频
     * 
     * @param schoolClassVideo 班级视频
     * @return 结果
     */
    @Override
    public int updateSchoolClassVideo(SchoolClassVideo schoolClassVideo)
    {
        return schoolClassVideoMapper.updateSchoolClassVideo(schoolClassVideo);
    }

    /**
     * 批量删除班级视频
     * 
     * @param ids 需要删除的班级视频主键
     * @return 结果
     */
    @Override
    public int deleteSchoolClassVideoByIds(Long[] ids)
    {
        return schoolClassVideoMapper.deleteSchoolClassVideoByIds(ids);
    }

    /**
     * 删除班级视频信息
     * 
     * @param id 班级视频主键
     * @return 结果
     */
    @Override
    public int deleteSchoolClassVideoById(Long id)
    {
        return schoolClassVideoMapper.deleteSchoolClassVideoById(id);
    }
}
