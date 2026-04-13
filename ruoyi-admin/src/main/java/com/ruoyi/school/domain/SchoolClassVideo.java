package com.ruoyi.school.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 班级视频对象 school_class_video
 * 
 * @author ruoyi
 * @date 2026-01-14
 */
public class SchoolClassVideo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 视频ID */
    private Long id;

    /** 视频标题 */
    @Excel(name = "视频标题")
    private String title;

    /** 视频地址 */
    @Excel(name = "视频地址")
    private String videoUrl;

    /** 封面地址 */
    @Excel(name = "封面地址")
    private String coverUrl;

    /** 简介 */
    @Excel(name = "简介")
    private String description;

    /** 科目/类型 */
    @Excel(name = "科目")
    private String subject;

    /** 所属班级ID */
    @Excel(name = "所属班级ID")
    private Long classId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }

    public void setVideoUrl(String videoUrl) 
    {
        this.videoUrl = videoUrl;
    }

    public String getVideoUrl() 
    {
        return videoUrl;
    }

    public void setCoverUrl(String coverUrl) 
    {
        this.coverUrl = coverUrl;
    }

    public String getCoverUrl() 
    {
        return coverUrl;
    }

    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }

    public void setSubject(String subject) 
    {
        this.subject = subject;
    }

    public String getSubject() 
    {
        return subject;
    }

    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("videoUrl", getVideoUrl())
            .append("coverUrl", getCoverUrl())
            .append("description", getDescription())
            .append("classId", getClassId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
