<template>
  <div class="student-section fade-in-up" style="animation-delay: 0.2s">
    <el-card class="box-card glass-effect">
      <div slot="header" class="clearfix" style="display: flex; align-items: center; justify-content: space-between;">
        <span><i class="el-icon-date"></i> 我的课表</span>
        <div style="display: flex; align-items: center;">
          <el-date-picker
            v-model="selectedDate"
            type="date"
            placeholder="选择日期筛选"
            size="mini"
            style="width: 150px; margin-right: 10px;"
            clearable
          />
          <el-checkbox v-if="isTeacher" v-model="teacherView" @change="fetchSchedule">只看我教的课</el-checkbox>
        </div>
      </div>
      <el-table :data="timetableData" border style="width: 100%" v-loading="loading">
        <el-table-column prop="period" label="节次" width="100" align="center">
          <template slot-scope="scope">
            第 {{ scope.row.period }} 节
          </template>
        </el-table-column>
        <el-table-column v-for="day in visibleDays" :key="day" :label="getDayLabel(day)" :class-name="getDayClass(day)" align="center">
          <template slot-scope="scope">
            <div v-if="scope.row[day]" class="course-cell">
              <div class="course-name">{{ scope.row[day].courseName }}</div>
              <div class="teacher-name" v-if="!teacherView">{{ scope.row[day].teacherName }}</div>
              <div class="teacher-name" v-else>{{ scope.row[day].className }}</div>
            </div>
            <div v-else class="empty-cell">-</div>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import { getMyClassSchedule } from "@/api/school/schedule";

export default {
  name: "ClassSchedule",
  props: {
    isTeacher: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      teacherView: false,
      selectedDate: null,
      loading: false,
      scheduleList: [],
      timetableData: []
    };
  },
  computed: {
    // 始终显示周一到周日
    visibleDays() {
      return [1, 2, 3, 4, 5, 6, 7];
    }
  },
  created() {
    this.fetchSchedule();
  },
  methods: {
    getDayLabel(day) {
      const weekName = "周" + this.parseWeek(day);
      if (!this.selectedDate) {
        return weekName;
      }
      // 计算选中日期所在周的周一
      const current = new Date(this.selectedDate);
      const currentDay = current.getDay() || 7; // 把周日0改为7
      // 计算该周周一的时间戳
      const mondayTime = current.getTime() - (currentDay - 1) * 24 * 60 * 60 * 1000;
      
      // 计算目标day的日期
      const targetTime = mondayTime + (day - 1) * 24 * 60 * 60 * 1000;
      const targetDate = new Date(targetTime);
      
      const month = (targetDate.getMonth() + 1).toString().padStart(2, '0');
      const date = targetDate.getDate().toString().padStart(2, '0');
      
      return `${weekName} (${month}-${date})`;
    },
    getDayClass(day) {
      if (!this.selectedDate) return "";
      const current = new Date(this.selectedDate);
      const currentDay = current.getDay() || 7;
      return day === currentDay ? "highlight-col" : "";
    },
    fetchSchedule() {
      this.loading = true;
      // 传入 teacherView 参数
      // 如果不是老师，teacherView 应该是 false (但这里 v-model 绑定了，如果是 false 就传 false)
      // 但为了安全，如果 isTeacher 为 false，强制传 false? 
      // getMyClassSchedule 接收 boolean/string? Usually param object.
      const params = {
        teacherView: this.isTeacher ? this.teacherView : false
      };
      
      getMyClassSchedule(params).then(response => {
        this.scheduleList = response.data;
        this.generateTimetable();
        this.loading = false;
      }).catch(() => {
        this.loading = false;
        // 报错处理交由全局或忽略
      });
    },
    generateTimetable() {
      const rows = [];
      for (let i = 1; i <= 8; i++) {
        rows.push({ period: i });
      }

      this.scheduleList.forEach(item => {
        const rowIndex = item.section - 1;
        if (rows[rowIndex]) {
          rows[rowIndex][item.weekDay] = item;
        }
      });

      this.timetableData = rows;
    },
    parseWeek(day) {
      const weeks = ["", "一", "二", "三", "四", "五", "六", "日"];
      return weeks[day] || day;
    }
  }
};
</script>

<style scoped lang="scss">
$card-bg: rgba(255, 255, 255, 0.65);

.box-card {
  background: $card-bg;
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  border: 1px solid rgba(255, 255, 255, 0.8);
  border-radius: 16px;
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.07);
}

.course-cell {
  padding: 5px;
  background-color: #f0f9eb;
  border-radius: 4px;

  .course-name {
    font-weight: bold;
    color: #409EFF;
    margin-bottom: 4px;
  }

  .teacher-name {
    font-size: 12px;
    color: #666;
  }
}

.empty-cell {
  color: #ddd;
}

/* 高亮列样式 */
::v-deep .el-table .highlight-col {
  background-color: rgba(64, 158, 255, 0.1) !important;
}

// 向上渐入
@keyframes fadeInUp {
  from { opacity: 0; transform: translate3d(0, 30px, 0); }
  to { opacity: 1; transform: translate3d(0, 0, 0); }
}
.fade-in-up {
  animation: fadeInUp 0.8s ease-out both;
}
</style>
