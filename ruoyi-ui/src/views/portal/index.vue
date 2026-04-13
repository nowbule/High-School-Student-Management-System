<template>
  <div class="portal-container">
    <PortalHeader :user-info="userInfo" />

    <div class="main-content">
      <WelcomeCard
        :user-info="userInfo"
        :todo-count="todoCount"
        :notice-count="noticeCount"
      />

      <el-row :gutter="20">
        <el-col :span="16" :xs="24">
          <NoticeCard @update-count="updateNoticeCount" />
          <AttendanceChart />
          <ScoreAnalysis />
          <HomeworkCard @update-count="updateTodoCount" />
        </el-col>

        <el-col :span="8" :xs="24">
          <QuickNav />
          <ClassSchedule />
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import { getUserProfile } from "@/api/system/user";
import PortalHeader from './components/PortalHeader';
import WelcomeCard from './components/WelcomeCard';
import NoticeCard from './components/NoticeCard';
import AttendanceChart from './components/AttendanceChart';
import ScoreAnalysis from './components/ScoreAnalysis';
import HomeworkCard from './components/HomeworkCard';
import QuickNav from './components/QuickNav';
import ClassSchedule from './components/ClassSchedule';

export default {
  name: "StudentPortal",
  components: {
    PortalHeader,
    WelcomeCard,
    NoticeCard,
    AttendanceChart,
    ScoreAnalysis,
    HomeworkCard,
    QuickNav,
    ClassSchedule
  },
  data() {
    return {
      userInfo: {},
      todoCount: 0,
      noticeCount: 0
    };
  },
  created() {
    this.getUserInfo();
  },
  methods: {
    getUserInfo() {
      getUserProfile().then(response => {
        this.userInfo = response.data;
        if (this.userInfo.roles && this.userInfo.roles.length > 0) {
             this.$set(this.userInfo, 'roleName', this.userInfo.roles[0].roleName);
        }
      });
    },
    updateTodoCount(count) {
      this.todoCount = count;
    },
    updateNoticeCount(count) {
      this.noticeCount = count;
    }
  }
}
</script>

<style scoped lang="scss">
.portal-container {
  background-color: #f5f7fa;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
.main-content {
  padding: 20px;
  max-width: 1400px;
  margin: 0 auto;
  width: 100%;
  box-sizing: border-box;
}
</style>
