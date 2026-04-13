<template>
  <div class="app-container home-container">
    <div class="dynamic-bg"></div>

    <div class="content-wrapper">
      <welcome-header />
        <!-- {{ roleType }} -->
      <!-- 学生/老师端：我的课表 -->
      <!-- 老师可以看到“只看我教的课”选项，学生不能 -->
      <class-schedule
        v-if="roleType === 'student' || roleType === 'teacher'"
        :is-teacher="roleType === 'teacher'"
      />

      <!-- 管理员端：功能卡片 -->
      <admin-features v-if="roleType === 'admin'" />
    </div>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import WelcomeHeader from "./home/WelcomeHeader";
import ClassSchedule from "./home/ClassSchedule";
import AdminFeatures from "./home/AdminFeatures";

export default {
  name: "Index",
  components: {
    WelcomeHeader,
    ClassSchedule,
    AdminFeatures
  },
  data() {
    return {
      roleType: 'admin' // 默认为admin，避免闪烁
    };
  },
  computed: {
    ...mapGetters(["roles"])
  },
  created() {
    this.checkRole();
  },
  methods: {
    checkRole() {
      // 优先判断老师
      if (this.roles.includes("head_teacher") || this.roles.includes("mid-admin") ||
    this.roles.includes("teacher")) {
        this.roleType = 'teacher';
      }
      // 其次判断学生 (common角色也视为学生)
      else if (this.roles.includes("student") || this.roles.includes("common")) {
        this.roleType = 'student';
      }
      // 管理员
      else if (this.roles.includes("admin")) {
        this.roleType = 'admin';
      }
      // 其他角色默认显示学生视图（或者你可以改为admin视图）
      else {
        this.roleType = 'student';
      }
    }
  }
};
</script>

<style scoped lang="scss">
// 变量定义
$bg-gradient: linear-gradient(-45deg, #e0c3fc, #8ec5fc, #e0c3fc, #8ec5fc);

.app-container.home-container {
  position: relative;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}

/* --- 1. 动态流体背景 --- */
.dynamic-bg {
  position: absolute;
  top: 0; left: 0; width: 100%; height: 100%;
  background: $bg-gradient;
  background-size: 400% 400%;
  animation: gradientBG 15s ease infinite;
  z-index: 0;
}

.content-wrapper {
  position: relative;
  z-index: 1;
  max-width: 1000px;
  width: 100%;
  padding: 0 20px;
}

// 背景流动动画
@keyframes gradientBG {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}
</style>
