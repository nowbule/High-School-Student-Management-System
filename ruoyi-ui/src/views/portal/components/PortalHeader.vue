<template>
  <nav class="nav-bar">
    <div class="logo-area">
      <i class="el-icon-reading" style="margin-right: 8px; font-size: 24px;"></i>
      <span class="logo-text">高中班级管理门户</span>
    </div>
    <div class="user-area">
      <el-dropdown trigger="click" @command="handleCommand">
        <div class="user-info-trigger">
          <el-avatar :size="36" :src="userInfo.avatar" class="user-avatar"></el-avatar>
          <span class="user-name">欢迎您，{{ userInfo.nickName }} <i class="el-icon-arrow-down el-icon--right"></i></span>
        </div>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item command="profile" icon="el-icon-user">个人中心</el-dropdown-item>
          <el-dropdown-item command="logout" icon="el-icon-switch-button" divided>退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'PortalHeader',
  props: {
    userInfo: {
      type: Object,
      required: true
    }
  },
  methods: {
    handleCommand(command) {
      if (command === 'logout') {
        this.logout();
      } else if (command === 'profile') {
        this.$router.push('/student/profile');
      }
    },
    async logout() {
      this.$confirm('确定注销并退出系统吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          location.href = '/index';
        })
      }).catch(() => {});
    }
  }
}
</script>

<style scoped lang="scss">
.nav-bar { background: #fff; height: 60px; padding: 0 30px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05); position: sticky; top: 0; z-index: 1000; }
.logo-area { display: flex; align-items: center; color: #409EFF; font-weight: bold; font-size: 20px; }
.user-info-trigger { display: flex; align-items: center; cursor: pointer; padding: 5px 10px; border-radius: 20px; transition: background 0.3s; &:hover { background: #f0f2f5; } .user-avatar { margin-right: 10px; } .user-name { font-size: 14px; color: #606266; font-weight: 500; } }
</style>
