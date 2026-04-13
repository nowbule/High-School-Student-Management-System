<template>
  <div class="welcome-header fade-in-down">
    <div class="icon-wrapper float-anim">
      <i class="el-icon-s-platform welcome-icon"></i>
      <div class="icon-shadow"></div>
    </div>

    <h1 class="title gradient-text">欢迎使用高中班级管理系统</h1>
    <p class="subtitle typing-effect">一切都为了学生</p>
  </div>
</template>

<script>
export default {
  name: "WelcomeHeader"
};
</script>

<style scoped lang="scss">
.welcome-header {
  text-align: center;
  margin-bottom: 60px;

  .icon-wrapper {
    position: relative;
    display: inline-block;
    margin-bottom: 20px;

    .welcome-icon {
      font-size: 80px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      filter: drop-shadow(0 10px 15px rgba(118, 75, 162, 0.3));
    }

    // 图标下方的呼吸阴影
    .icon-shadow {
      width: 60px;
      height: 10px;
      background: rgba(0,0,0,0.1);
      border-radius: 50%;
      margin: 0 auto;
      filter: blur(5px);
      animation: shadowPulse 3s ease-in-out infinite;
    }
  }

  .title {
    font-size: 42px;
    font-weight: 800;
    margin: 10px 0;
    letter-spacing: 2px;
  }

  // 渐变文字效果
  .gradient-text {
    background: linear-gradient(to right, #30cfd0 0%, #330867 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .subtitle {
    font-size: 18px;
    color: #555;
    margin-top: 15px;
    font-weight: 300;
    letter-spacing: 1px;
  }
}

// 动画 Keyframes
@keyframes float {
  0% { transform: translateY(0px); }
  50% { transform: translateY(-15px); }
  100% { transform: translateY(0px); }
}
.float-anim {
  animation: float 4s ease-in-out infinite;
}

@keyframes shadowPulse {
  0% { transform: scale(1); opacity: 0.2; }
  50% { transform: scale(0.8); opacity: 0.1; }
  100% { transform: scale(1); opacity: 0.2; }
}

@keyframes fadeInDown {
  from { opacity: 0; transform: translate3d(0, -30px, 0); }
  to { opacity: 1; transform: translate3d(0, 0, 0); }
}
.fade-in-down {
  animation: fadeInDown 1s ease-out both;
}

@media (max-width: 768px) {
  .title { font-size: 28px !important; }
}
</style>
