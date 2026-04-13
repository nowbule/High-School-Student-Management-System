package com.ruoyi.school.service;

import java.util.List;
import com.ruoyi.school.domain.SchoolClassVideo;

/**
 * 班级视频Service接口
 * 
 * @author ruoyi
 * @date 2026-01-14
 */
public interface ISchoolClassVideoService 
{
    /**
     * 查询班级视频
     * 
     * @param id 班级视频主键
     * @return 班级视频
     */
    public SchoolClassVideo selectSchoolClassVideoById(Long id);

    /**
     * 查询班级视频列表
     * 
     * @param schoolClassVideo 班级视频
     * @return 班级视频集合
     */
    public List<SchoolClassVideo> selectSchoolClassVideoList(SchoolClassVideo schoolClassVideo);

    /**
     * 新增班级视频
     * 
     * @param schoolClassVideo 班级视频
     * @return 结果
     */
    public int insertSchoolClassVideo(SchoolClassVideo schoolClassVideo);

    /**
     * 修改班级视频
     * 
     * @param schoolClassVideo 班级视频
     * @return 结果
     */
    public int updateSchoolClassVideo(SchoolClassVideo schoolClassVideo);

    /**
     * 批量删除班级视频
     * 
     * @param ids 需要删除的班级视频主键集合
     * @return 结果
     */
    public int deleteSchoolClassVideoByIds(Long[] ids);

    /**
     * 删除班级视频信息
     * 
     * @param id 班级视频主键
     * @return 结果
     */
    public int deleteSchoolClassVideoById(Long id);
}
