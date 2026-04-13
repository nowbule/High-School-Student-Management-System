<template>
  <div class="app-container">
    <el-page-header @back="$router.go(-1)" content="我的考勤记录" style="margin-bottom: 20px;">
    </el-page-header>

    <el-card shadow="hover" class="box-card">
      <el-form :model="queryParams" ref="queryForm" :inline="true" size="small" class="filter-container">
        <el-form-item label="考勤状态" prop="status">
          <el-select v-model="queryParams.status" placeholder="请选择状态" clearable style="width: 140px" @change="handleQuery">
            <el-option label="正常" value="1" />
            <el-option label="迟到" value="2" />
            <el-option label="早退" value="3" />
            <el-option label="缺勤" value="4" />
          </el-select>
        </el-form-item>

        <el-form-item label="日期范围">
          <el-date-picker
            v-model="dateRange"
            size="small"
            style="width: 240px"
            value-format="yyyy-MM-dd"
            type="daterange"
            range-separator="-"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @change="handleQuery"
          ></el-date-picker>
        </el-form-item>

        <el-form-item label="日期排序">
           <el-radio-group v-model="queryParams.isAsc" size="small" @change="handleQuery">
             <el-radio-button label="desc">最新在前</el-radio-button>
             <el-radio-button label="asc">最早在前</el-radio-button>
           </el-radio-group>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-table :data="list" v-loading="loading" border style="width: 100%" :header-cell-style="{background:'#f5f7fa',color:'#606266'}">
        <el-table-column type="index" label="序号" width="60" align="center" />

        <el-table-column label="考勤时间" align="center" width="220">
          <template slot-scope="scope">
            <div class="date-cell">
              <i class="el-icon-date" style="margin-right: 5px; color: #409EFF;"></i>
              <span style="font-weight: bold;">{{ parseTime(scope.row.attendanceDate, '{y}-{m}-{d}') }}</span>
              <span class="week-tag" :class="{ 'is-weekend': isWeekend(scope.row.attendanceDate) }">
                {{ getWeekDay(scope.row.attendanceDate) }}
              </span>
            </div>
          </template>
        </el-table-column>

        <el-table-column label="考勤状态" align="center" prop="status">
          <template slot-scope="scope">
            <el-tag v-if="scope.row.status == '1'" type="success" effect="light" size="medium">
              <i class="el-icon-circle-check"></i> 正常
            </el-tag>
            <el-tag v-else-if="scope.row.status == '2'" type="warning" effect="light" size="medium">
              <i class="el-icon-time"></i> 迟到
            </el-tag>
            <el-tag v-else-if="scope.row.status == '3'" type="danger" effect="plain" size="medium">
              <i class="el-icon-watch"></i> 早退
            </el-tag>
            <el-tag v-else-if="scope.row.status == '4'" type="danger" effect="dark" size="medium">
              <i class="el-icon-close"></i> 缺勤
            </el-tag>
            <el-tag v-else type="info" effect="plain">未知</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="备注信息" align="center" prop="remark" show-overflow-tooltip>
           <template slot-scope="scope">
              <span v-if="scope.row.remark">{{ scope.row.remark }}</span>
              <span v-else style="color: #ccc;">-</span>
           </template>
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-card>
  </div>
</template>

<script>
  import { getMyAttendanceList } from "@/api/school/student";
  import { getUserProfile } from "@/api/system/user";

  export default {
    name: "MyRecord",
    data() {
      return {
        loading: true,
        list: [],
        total: 0,
        dateRange: [],
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          studentId: null,
          status: null,
          orderByColumn: 'attendance_date',
          isAsc: 'desc',
          params: {}
        }
      };
    },
    created() {
      this.getCurrentUser();
    },
    methods: {
      getCurrentUser() {
        getUserProfile().then(res => {
          this.queryParams.studentId = res.data.userId;
          this.getList();
        });
      },
      getList() {
        this.loading = true;

        // 处理日期范围
        this.queryParams.params = {};
        if (null != this.dateRange && '' != this.dateRange) {
          this.queryParams.params["beginAttendanceDate"] = this.dateRange[0];
          this.queryParams.params["endAttendanceDate"] = this.dateRange[1];
        }

        getMyAttendanceList(this.queryParams).then(response => {
          this.list = response.rows;
          this.total = response.total;
          this.loading = false;
        }).catch(() => {
            this.loading = false;
        });
      },
      // 搜索按钮
      handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
      },
      // 重置按钮
      resetQuery() {
        this.queryParams.status = null;
        this.queryParams.isAsc = 'desc';
        this.dateRange = [];
        this.handleQuery();
      },
      getWeekDay(dateStr) {
         if(!dateStr) return "";
         const days = ["周日", "周一", "周二", "周三", "周四", "周五", "周六"];
         return days[new Date(dateStr).getDay()];
      },
      // 判断是否是周末，用于加红显示
      isWeekend(dateStr) {
        const day = new Date(dateStr).getDay();
        return day === 0 || day === 6; // 0是周日，6是周六
      }
    }
  };
</script>

<style scoped>
/* 一些简单的样式优化 */
.filter-container {
  margin-bottom: 10px;
  background: #f8f9fa;
  padding: 15px 15px 0 15px;
  border-radius: 4px;
}
.date-cell {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
}
.week-tag {
  font-size: 12px;
  background-color: #ecf5ff;
  color: #409EFF;
  padding: 2px 6px;
  border-radius: 4px;
}
.week-tag.is-weekend {
  background-color: #fef0f0;
  color: #f56c6c; /* 周末显示红色 */
}
</style>
