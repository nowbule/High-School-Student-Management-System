<template>
  <el-card shadow="hover" class="mb-20">
    <div slot="header" class="card-header">
      <span><i class="el-icon-menu" style="color: #409EFF; margin-right: 5px;"></i> 快捷导航</span>
    </div>
    <div class="quick-nav-grid">
      <div class="nav-item" @click="navTo('homework')">
        <div class="nav-icon" style="background: #e1f3d8; color: #67C23A;">
          <i class="el-icon-edit-outline"></i>
        </div>
        <span>我的作业</span>
      </div>
      <div class="nav-item" @click="navTo('student/drive')">
        <div class="nav-icon" style="background: #ecf5ff; color: #409EFF;">
          <i class="el-icon-collection"></i>
        </div>
        <span>班级网盘</span>
      </div>
      <!-- <div class="nav-item" @click="navTo('exam')">
        <div class="nav-icon" style="background: #fdf6ec; color: #E6A23C;">
          <i class="el-icon-trophy"></i>
        </div>
        <span>我的成绩</span>
      </div> -->
      <div class="nav-item" @click="navTo('attendance')">
        <div class="nav-icon" style="background: #fef0f0; color: #F56C6C;">
          <i class="el-icon-date"></i>
        </div>
        <span>考勤记录</span>
      </div>
      <!-- <div class="nav-item" @click="navTo('leave')">
        <div class="nav-icon" style="background: #f4f4f5; color: #909399;">
          <i class="el-icon-s-promotion"></i>
        </div>
        <span>请假申请</span>
      </div> -->
      <div class="nav-item" @click="navTo('student/profile')">
        <div class="nav-icon" style="background: #e8eaf6; color: #3f51b5;">
          <i class="el-icon-user"></i>
        </div>
        <span>个人中心</span>
      </div>
    </div>
  </el-card>
</template>

<script>
export default {
  name: 'QuickNav',
  methods: {
    navTo(path) {
      if (path.startsWith('student/')) {
         this.$router.push(`/${path}`);
      } else if (path === 'homework') {
         this.$router.push(`/school/homework`);
      } else if (path === 'attendance') {
         this.$router.push(`/school/attendance-my`);
      } else {
         this.$router.push(`/school/${path}`);
      }
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.card-header { font-size: 16px; font-weight: bold; color: #303133; display: flex; align-items: center; justify-content: space-between; }
.quick-nav-grid { display: flex; flex-wrap: wrap; justify-content: space-between; padding: 10px 5px; }
.nav-item {
  width: 30%; text-align: center; margin-bottom: 15px; cursor: pointer; transition: transform 0.2s;
  &:hover { transform: translateY(-5px); .nav-icon { box-shadow: 0 5px 15px rgba(0,0,0,0.1); } }
  span { display: block; margin-top: 8px; font-size: 13px; color: #555; }
}
.nav-icon {
  width: 48px; height: 48px; line-height: 48px; margin: 0 auto;
  border-radius: 16px; font-size: 24px; transition: box-shadow 0.3s;
}
</style>
