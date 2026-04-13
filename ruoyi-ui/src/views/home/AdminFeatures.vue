<template>
  <div class="features-section">
    <el-row :gutter="40">
      <el-col :span="8" class="feature-col fade-in-up" style="animation-delay: 0.2s">
        <div class="feature-card glass-effect">
          <div class="card-icon blue-icon">
            <i class="el-icon-monitor"></i>
          </div>
          <h3>数据监控</h3>
          <p>实时多维度的业务数据动态看板</p>
        </div>
      </el-col>

      <el-col :span="8" class="feature-col fade-in-up" style="animation-delay: 0.4s">
        <div class="feature-card glass-effect">
          <div class="card-icon purple-icon">
            <i class="el-icon-setting"></i>
          </div>
          <h3>系统管理</h3>
          <p>精细化的RBAC角色与权限配置</p>
        </div>
      </el-col>

      <el-col :span="8" class="feature-col fade-in-up" style="animation-delay: 0.6s">
        <div class="feature-card glass-effect">
          <div class="card-icon green-icon">
            <i class="el-icon-data-line"></i>
          </div>
          <h3>统计分析</h3>
          <p>深度挖掘数据价值的报表引擎</p>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: "AdminFeatures"
};
</script>

<style scoped lang="scss">
$card-bg: rgba(255, 255, 255, 0.65);

.features-section {
  .feature-card {
    background: $card-bg;
    backdrop-filter: blur(12px); // 磨砂玻璃效果
    -webkit-backdrop-filter: blur(12px);
    border: 1px solid rgba(255, 255, 255, 0.8);
    border-radius: 16px;
    padding: 30px 20px;
    text-align: center;
    transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.07);
    cursor: default;

    &:hover {
      transform: translateY(-10px); // 悬浮上移
      background: rgba(255, 255, 255, 0.85);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
      border-color: #fff;
    }

    .card-icon {
      width: 60px;
      height: 60px;
      line-height: 60px;
      border-radius: 50%;
      margin: 0 auto 20px;
      font-size: 28px;
      color: #fff;
      transition: transform 0.5s ease;
    }

    // 不同颜色的图标背景
    .blue-icon { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4); }
    .purple-icon { background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%); box-shadow: 0 5px 15px rgba(161, 140, 209, 0.4); }
    .green-icon { background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%); box-shadow: 0 5px 15px rgba(132, 250, 176, 0.4); }

    &:hover .card-icon {
      transform: rotateY(180deg); // 鼠标悬停时图标旋转
    }

    h3 {
      font-size: 20px;
      color: #2c3e50;
      margin-bottom: 10px;
      font-weight: 600;
    }

    p {
      font-size: 14px;
      color: #7f8c8d;
      line-height: 1.6;
    }
  }
}

// 向上渐入
@keyframes fadeInUp {
  from { opacity: 0; transform: translate3d(0, 30px, 0); }
  to { opacity: 1; transform: translate3d(0, 0, 0); }
}
.fade-in-up {
  animation: fadeInUp 0.8s ease-out both;
}

// 响应式微调
@media (max-width: 768px) {
  .features-section .el-col {
    width: 100% !important;
    margin-bottom: 20px;
  }
}
</style>
