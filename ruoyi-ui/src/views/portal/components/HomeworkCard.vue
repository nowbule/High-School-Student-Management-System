<template>
  <el-card shadow="hover" class="homework-card mb-20">
    <div slot="header" class="card-header">
      <div class="header-title">
        <i class="el-icon-collection" style="color: #E6A23C; font-size: 18px;"></i>
        <span style="font-weight: bold; margin-left: 8px; font-size: 16px;">待提交作业</span>
        <el-badge :value="homeworkList.length" :max="99" class="header-badge" type="danger" v-if="homeworkList.length > 0"></el-badge>
      </div>
      <el-button type="text" class="view-all-btn" @click="navTo('homework')">
        全部作业 <i class="el-icon-arrow-right"></i>
      </el-button>
    </div>

    <el-table :data="homeworkList" style="width: 100%" :show-header="false" class="custom-table" row-class-name="homework-row">

      <el-table-column width="70" align="center">
        <template slot-scope="scope">
          <div class="subject-box" :class="getSubjectColor(scope.row.subject || scope.row.taskTitle)">
            {{ getSubjectChar(scope.row.subject || scope.row.taskTitle) }}
          </div>
        </template>
      </el-table-column>

      <el-table-column min-width="200">
         <template slot-scope="scope">
            <div class="task-info" @click="navTo('homework')">
              <div class="task-top">
                <span class="task-title">{{ scope.row.taskTitle || '未命名作业' }}</span>

                <el-tag size="mini" effect="dark" type="danger" v-if="isUrgent(scope.row.deadlineTime)" class="urgent-tag">
                  <i class="el-icon-time"></i> 急
                </el-tag>
              </div>
              <div class="task-sub">
                 <span style="margin-right: 10px;" v-if="scope.row.teacherName || scope.row.createBy">
                   <i class="el-icon-user"></i> {{ scope.row.teacherName || scope.row.createBy }}
                 </span>
                 <span style="margin-right: 10px;">
                   <i class="el-icon-notebook-2"></i> {{ scope.row.subject || '综合' }}
                 </span>
                 <span><i class="el-icon-date"></i> {{ parseTime(scope.row.deadlineTime, '{m}-{d} {h}:{i}') || '长期' }}</span>
              </div>
            </div>
         </template>
      </el-table-column>

      <el-table-column width="100" align="right">
        <template slot-scope="scope">
          <div class="deadline-status" :class="{'text-red': isUrgent(scope.row.deadlineTime)}">
            {{ getRemainingText(scope.row.deadlineTime) }}
          </div>
        </template>
      </el-table-column>

      <template slot="empty">
         <div class="empty-placeholder">
            <img src="https://gw.alipayobjects.com/zos/antfincdn/ZHrcdLPrvN/empty.svg" style="width: 80px; margin-bottom: 10px;">
            <p>暂无待办作业，太棒了！</p>
         </div>
      </template>
    </el-table>
  </el-card>
</template>

<script>
import { listMyHomework } from "@/api/school/submission";

export default {
  name: 'HomeworkCard',
  data() {
    return {
      homeworkList: []
    }
  },
  created() {
    this.getUnexpiredHomework();
  },
  methods: {
    navTo(path) {
      if (path === 'homework') {
          this.$router.push(`/school/homework`);
      } else {
          this.$router.push(`/school/${path}`);
      }
    },
    getUnexpiredHomework() {
      // 🔥 使用 listMyHomework 替代 listSubmission，确保后端自动过滤班级
      listMyHomework({
        pageNum: 1,
        pageSize: 100
      }).then(res => {
        const allList = res.rows || [];
        const now = new Date().getTime();

        this.homeworkList = allList.filter(item => {
           if (!item.deadlineTime) return true;
           return new Date(item.deadlineTime).getTime() > now;
        });

        this.homeworkList.sort((a, b) => {
          return new Date(a.deadlineTime || 0) - new Date(b.deadlineTime || 0);
        });

        this.$emit('update-count', this.homeworkList.length);
      });
    },
    getSubjectColor(name) {
      if (!name) name = "";
      if (name.includes('数')) return 'bg-blue';
      if (name.includes('语')) return 'bg-pink';
      if (name.includes('英')) return 'bg-purple';
      if (name.includes('理') || name.includes('物')) return 'bg-cyan';
      if (name.includes('化') || name.includes('学')) return 'bg-orange';
      if (name.includes('生')) return 'bg-green';
      return 'bg-default';
    },
    getSubjectChar(str) {
      if (!str) return '综';
      if (str.includes('数')) return '数';
      if (str.includes('语')) return '语';
      if (str.includes('英')) return '英';
      return str.substring(0, 1);
    },
    isUrgent(deadlineStr) {
      if (!deadlineStr) return false;
      const diff = new Date(deadlineStr) - new Date();
      return diff > 0 && diff < 24 * 60 * 60 * 1000;
    },
    getRemainingText(deadlineStr) {
      if (!deadlineStr) return '长期';
      const diff = new Date(deadlineStr) - new Date();
      if (diff < 0) return '已超期';

      const days = Math.floor(diff / (24 * 3600 * 1000));
      const hours = Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000));

      if (days === 0) return `剩 ${hours} 小时`;
      if (days === 1) return '明天截止';
      if (days <= 3) return `剩 ${days} 天`;
      return `${days}天后`;
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.card-header { font-size: 16px; font-weight: bold; color: #303133; display: flex; align-items: center; justify-content: space-between; }
.header-title { display: flex; align-items: center; }
.header-badge { margin-left: 5px; ::v-deep .el-badge__content { border: none; } }
.view-all-btn { color: #909399; padding: 0; font-size: 13px; &:hover { color: #409EFF; } }

.subject-box {
  width: 40px; height: 40px; line-height: 40px;
  border-radius: 12px; color: #fff; font-weight: bold; font-size: 16px;
  text-align: center; box-shadow: 0 3px 8px rgba(0,0,0,0.1);
  transition: transform 0.2s;
}
.homework-row:hover .subject-box { transform: scale(1.1); }

.bg-blue { background: linear-gradient(135deg, #36D1DC, #5B86E5); }
.bg-pink { background: linear-gradient(135deg, #FF9A9E, #FECFEF); }
.bg-purple { background: linear-gradient(135deg, #A18CD1, #FBC2EB); }
.bg-cyan { background: linear-gradient(135deg, #4facfe, #00f2fe); }
.bg-orange { background: linear-gradient(135deg, #f6d365, #fda085); }
.bg-green { background: linear-gradient(135deg, #84fab0, #8fd3f4); }
.bg-default { background: linear-gradient(135deg, #e0c3fc, #8ec5fc); }

.task-info { cursor: pointer; display: flex; flex-direction: column; justify-content: center; height: 50px; }
.task-top { display: flex; align-items: center; margin-bottom: 4px; }
.task-title { font-size: 14px; font-weight: 500; color: #333; margin-right: 8px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 200px; }
.task-info:hover .task-title { color: #409EFF; }
.task-sub { font-size: 12px; color: #999; }
.urgent-tag { transform: scale(0.9); border-radius: 4px; padding: 0 5px; height: 20px; line-height: 18px; }

.deadline-status { font-size: 13px; color: #67C23A; font-weight: bold; }
.deadline-status.text-red { color: #F56C6C; animation: pulse 2s infinite; }

@keyframes pulse {
  0% { opacity: 1; }
  50% { opacity: 0.6; }
  100% { opacity: 1; }
}

.custom-table ::v-deep td { border-bottom: 1px dashed #f0f0f0; padding: 12px 0; }
.custom-table ::v-deep .el-table__row:last-child td { border-bottom: none; }
.custom-table::before { height: 0; }

.empty-placeholder { padding: 30px 0; text-align: center; color: #909399; font-size: 13px; }
</style>
