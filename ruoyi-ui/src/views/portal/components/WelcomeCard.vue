<template>
  <el-card shadow="hover" class="welcome-card mb-20">
    <div class="welcome-wrap">
      <div class="welcome-text">
        <h2>早安，{{ userInfo.nickName }}同学！今天也要加油哦 💪</h2>
        <p class="sub-text">
          <i class="el-icon-location-outline"></i>
          所属班级：{{ userInfo.deptName || '加载中...' }} |
          <i class="el-icon-date"></i> 今日日期：{{ currentDate }}
        </p>
      </div>
      <div class="welcome-stat">
        <div class="stat-box">
          <div class="num">{{ todoCount }}</div>
          <div class="label">待办作业</div>
        </div>
        <div class="stat-box">
          <div class="num">{{ noticeCount }}</div>
          <div class="label">最新通知</div>
        </div>
      </div>
    </div>
  </el-card>
</template>

<script>
export default {
  name: 'WelcomeCard',
  props: {
    userInfo: { type: Object, default: () => ({}) },
    todoCount: { type: Number, default: 0 },
    noticeCount: { type: Number, default: 0 }
  },
  data() {
    return {
      currentDate: new Date().toLocaleDateString()
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.welcome-card { background: linear-gradient(135deg, #e3f2fd 0%, #ffffff 100%); border: none; .welcome-wrap { display: flex; justify-content: space-between; align-items: center; .welcome-text h2 { margin: 0 0 10px 0; color: #303133; } .welcome-text .sub-text { color: #909399; font-size: 14px; margin: 0; } .welcome-stat { display: flex; gap: 30px; .stat-box { text-align: center; .num { font-size: 24px; font-weight: bold; color: #409EFF; } .label { font-size: 12px; color: #909399; } } } } }
</style>
