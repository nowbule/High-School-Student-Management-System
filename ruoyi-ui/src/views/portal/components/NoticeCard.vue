<template>
  <el-card shadow="hover" class="notice-card mb-20">
    <div slot="header" class="card-header">
      <span><i class="el-icon-bell" style="color: #F56C6C;"></i> 班级公告</span>
      <el-tag size="mini" type="danger" effect="plain" style="float: right">New</el-tag>
    </div>
    <div class="notice-list">
      <el-timeline>
        <el-timeline-item
          v-for="(item, index) in noticeList"
          :key="index"
          :type="'primary'"
          :color="index === 0 ? '#F56C6C' : '#409EFF'"
          :timestamp="parseTime(item.createTime, '{y}-{m}-{d}')">

          <a class="notice-title-link" @click="handleViewNotice(item)">
            {{ item.noticeTitle }}
          </a>

        </el-timeline-item>
      </el-timeline>
      <div v-if="noticeList.length === 0" style="text-align: center; color: #999; padding: 20px;">暂无公告</div>
    </div>

    <el-dialog :title="currentNotice.noticeTitle" :visible.sync="openNotice" width="700px" append-to-body>
      <div class="notice-body">
         <div class="notice-meta">
           <span><i class="el-icon-user"></i> 发布者：{{ currentNotice.createBy }}</span>
           <span style="margin-left: 20px;"><i class="el-icon-time"></i> 时间：{{ parseTime(currentNotice.createTime) }}</span>
         </div>
         <el-divider></el-divider>
         <div v-html="currentNotice.noticeContent" class="notice-content"></div>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="openNotice = false">关 闭</el-button>
      </div>
    </el-dialog>
  </el-card>
</template>

<script>
import { listNotice } from "@/api/system/notice";

export default {
  name: 'NoticeCard',
  data() {
    return {
      noticeList: [],
      openNotice: false,
      currentNotice: {}
    }
  },
  created() {
    this.getNotices();
  },
  methods: {
    getNotices() {
      listNotice({ pageNum: 1, pageSize: 5 }).then(res => {
        this.noticeList = res.rows;
        this.$emit('update-count', this.noticeList.length);
      }).catch(() => {
         console.log("公告加载失败");
      });
    },
    handleViewNotice(item) {
        this.currentNotice = item;
        this.openNotice = true;
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.card-header { font-size: 16px; font-weight: bold; color: #303133; display: flex; align-items: center; justify-content: space-between; i { margin-right: 5px; color: #409EFF; } }
.notice-list { max-height: 300px; overflow-y: auto; padding-top: 10px; }
.notice-title-link { cursor: pointer; color: #606266; text-decoration: none; transition: color 0.2s; }
.notice-title-link:hover { color: #409EFF; text-decoration: underline; }
.notice-meta { font-size: 13px; color: #909399; margin-bottom: 10px; }
.notice-content { line-height: 1.8; font-size: 14px; color: #333; min-height: 100px; }
</style>
