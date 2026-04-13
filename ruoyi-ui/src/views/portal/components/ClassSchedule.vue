<template>
  <el-card shadow="hover" class="mb-20">
    <div slot="header" class="card-header">
      <div style="display: flex; align-items: center;">
        <span><i class="el-icon-date" style="color: #67C23A; margin-right: 5px;"></i> 我的课表</span>
      </div>
      <div style="display: flex; align-items: center;">
        <el-date-picker
          v-model="selectedDate"
          type="date"
          placeholder="选择日期"
          size="mini"
          style="width: 140px; margin-right: 10px;"
          :picker-options="pickerOptions"
          @change="handleDateChange"
          value-format="yyyy-MM-dd">
        </el-date-picker>
        <el-tag size="mini" type="success" effect="plain">{{ getWeekDay(selectedDate) }}</el-tag>
      </div>
    </div>
    <div class="schedule-list" v-loading="loading">
      <div v-if="displaySchedule.length === 0" class="empty-schedule">
         <i class="el-icon-sunny" style="font-size: 40px; color: #E6A23C; margin-bottom: 10px;"></i>
         <p>该日没有安排课程哦~</p>
      </div>
      <div v-else
           v-for="(item, index) in displaySchedule"
           :key="index"
           class="schedule-item"
           :class="{'active': isCurrentPeriod(item)}">
        <div class="time-col">
          <div class="start">{{ getPeriodTime(item.section).start }}</div>
          <div class="end">{{ getPeriodTime(item.section).end }}</div>
        </div>
        <div class="divider-col">
           <div class="dot"></div>
           <div class="line" v-if="index !== displaySchedule.length - 1"></div>
        </div>
        <div class="course-col">
          <div class="course-name">{{ item.subjectName || item.courseName }}</div>
          <div class="teacher-name" v-if="item.teacherName"><i class="el-icon-user"></i> {{ item.teacherName }}</div>
          <div class="classroom" v-if="item.classroom"><i class="el-icon-location-outline"></i> {{ item.classroom }}</div>
        </div>
        <div class="status-col" v-if="isCurrentPeriod(item)">
           <el-tag size="mini" effect="dark" type="success">进行中</el-tag>
        </div>
      </div>
    </div>
  </el-card>
</template>

<script>
import { getAllSchedule } from "@/api/school/student";

export default {
  name: 'ClassSchedule',
  data() {
    return {
      loading: false,
      allSchedules: [], // 所有课表数据
      displaySchedule: [], // 当前展示的课表
      selectedDate: this.parseTime(new Date(), '{y}-{m}-{d}'),
      timer: null,
      pickerOptions: {
        firstDayOfWeek: 1
      },
      // 硬编码的作息时间表 (示例，实际可从后台获取)
      periodTimes: {
        1: { start: '08:00', end: '08:45' },
        2: { start: '08:55', end: '09:40' },
        3: { start: '10:00', end: '10:45' },
        4: { start: '10:55', end: '11:40' },
        5: { start: '14:00', end: '14:45' },
        6: { start: '14:55', end: '15:40' },
        7: { start: '16:00', end: '16:45' },
        8: { start: '16:55', end: '17:40' }
      }
    }
  },
  created() {
    this.getSchedule();
    // 每分钟检查一次当前课程状态
    this.timer = setInterval(this.$forceUpdate, 60000);
  },
  beforeDestroy() {
    if (this.timer) clearInterval(this.timer);
  },
  methods: {
    getWeekDay(dateStr) {
      if (!dateStr) return '';
      const date = new Date(dateStr);
      const days = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
      return days[date.getDay()];
    },
    getSchedule() {
      this.loading = true;
      getAllSchedule().then(res => {
        this.allSchedules = res.data || [];
        this.filterScheduleByDate();
        this.loading = false;
      }).catch(() => {
        console.log("课表加载失败");
        this.loading = false;
      });
    },
    handleDateChange() {
      this.filterScheduleByDate();
    },
    filterScheduleByDate() {
      if (!this.selectedDate) return;

      const date = new Date(this.selectedDate);
      // getDay返回0-6 (周日-周六)，后端weekDay通常是1-7 (周一-周日)
      // 需要转换: 周日(0) -> 7, 其他不变
      let dayOfWeek = date.getDay();
      if (dayOfWeek === 0) dayOfWeek = 7;

      // 筛选对应星期的课程并按节次排序
      this.displaySchedule = this.allSchedules
        .filter(item => item.weekDay == dayOfWeek)
        .sort((a, b) => a.section - b.section);
    },
    getPeriodTime(section) {
      return this.periodTimes[section] || { start: '--:--', end: '--:--' };
    },
    isCurrentPeriod(item) {
      // 只有当选中的是今天时，才显示“进行中”
      const todayStr = this.parseTime(new Date(), '{y}-{m}-{d}');
      if (this.selectedDate !== todayStr) return false;

      const time = this.getPeriodTime(item.section);
      if (time.start === '--:--') return false;

      const now = new Date();
      const currentMinutes = now.getHours() * 60 + now.getMinutes();

      const [startH, startM] = time.start.split(':').map(Number);
      const [endH, endM] = time.end.split(':').map(Number);
      const startTotal = startH * 60 + startM;
      const endTotal = endH * 60 + endM;

      return currentMinutes >= startTotal && currentMinutes < endTotal;
    }
  }
}
</script>

<style scoped lang="scss">
.mb-20 { margin-bottom: 20px; }
.card-header { font-size: 16px; font-weight: bold; color: #303133; display: flex; align-items: center; justify-content: space-between; }
.schedule-list { min-height: 200px; max-height: 400px; overflow-y: auto; padding: 10px 0; }
.empty-schedule { text-align: center; padding: 30px 0; color: #909399; }
.schedule-item {
  display: flex;
  padding: 12px 0;
  border-bottom: 1px solid #f0f2f5;
  position: relative;
  transition: all 0.3s;

  &:last-child { border-bottom: none; }
  &:hover { background-color: #f9faFc; }

  &.active {
    background-color: #f0f9eb;
    .course-name { color: #67C23A; font-weight: bold; }
  }
}

.time-col {
  width: 60px;
  text-align: right;
  padding-right: 15px;
  color: #909399;
  font-size: 12px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.divider-col {
  width: 20px;
  position: relative;
  display: flex;
  justify-content: center;

  .dot {
    width: 8px;
    height: 8px;
    background-color: #E4E7ED;
    border-radius: 50%;
    margin-top: 6px; // Adjust based on layout
    z-index: 1;
  }

  .line {
    position: absolute;
    top: 14px;
    bottom: -18px;
    width: 2px;
    background-color: #EBEEF5;
  }
}
.schedule-item.active .divider-col .dot {
  background-color: #67C23A;
  box-shadow: 0 0 0 3px rgba(103, 194, 58, 0.2);
}

.course-col {
  flex: 1;
  padding-left: 10px;

  .course-name { font-size: 15px; color: #303133; margin-bottom: 4px; }
  .teacher-name, .classroom { font-size: 12px; color: #909399; margin-right: 10px; display: inline-block; }
}

.status-col {
  width: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>

