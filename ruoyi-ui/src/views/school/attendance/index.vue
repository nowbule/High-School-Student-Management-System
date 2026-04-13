<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="8" :xs="24">
        <el-card class="box-card" shadow="hover">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-pie-chart"></i> 考勤状态分析</span>
          </div>
          <div v-loading="chartLoading" id="attendanceChart" style="height: 300px;"></div>
        </el-card>

        <el-card class="box-card" shadow="hover" style="margin-top: 20px;">
           <div slot="header"><span><i class="el-icon-info"></i> 说明</span></div>
           <div style="font-size: 13px; color: #666; line-height: 1.8;">
             <li>迟到：上课时间未到</li>
             <li>早退：下课时间未到先走</li>
             <li>缺勤：全天未打卡</li>
           </div>
        </el-card>
      </el-col>

      <el-col :span="16" :xs="24">
        <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch">
          <el-form-item label="班级" prop="deptId">
            <treeselect v-model="queryParams.deptId" :options="classOptions" :show-count="true" placeholder="请选择班级" style="width: 240px" />
          </el-form-item>
          <el-form-item label="学生姓名" prop="studentName">
            <el-input v-model="queryParams.studentName" placeholder="请输入学生姓名" clearable @keyup.enter.native="handleQuery"/>
          </el-form-item>

          <el-form-item label="状态" prop="status">
            <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
              <el-option label="正常/出勤" value="1" />
              <el-option label="迟到" value="2" />
              <el-option label="早退" value="3" />
              <el-option label="缺勤" value="4" />
            </el-select>
          </el-form-item>

          <el-form-item label="考勤日期">
            <el-date-picker
              v-model="dateRange"
              size="small"
              style="width: 240px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
            ></el-date-picker>
          </el-form-item>

          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            <el-button type="success" plain icon="el-icon-plus" size="mini" @click="handleAdd">新增考勤记录</el-button>
            <el-button type="info" plain icon="el-icon-s-tools" size="mini" @click="handleInit">一键生成</el-button>
          </el-form-item>
        </el-form>

        <el-table v-loading="loading" :data="filteredList" border stripe>
          <el-table-column label="考勤日期" align="center" prop="attendanceDate" width="180">
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.attendanceDate, '{y}-{m}-{d}') }}</span>
            </template>
          </el-table-column>
          <el-table-column label="班级" align="center" prop="deptName" />
          <el-table-column label="学号" align="center" prop="studentNo" />
          <el-table-column label="学生姓名" align="center" prop="studentName" />
          <el-table-column label="状态" align="center" prop="status">
            <template slot-scope="scope">
               <el-tag v-if="scope.row.status == '1'" type="success">正常/出勤</el-tag>
               <el-tag v-else-if="scope.row.status == '2'" type="warning">迟到</el-tag>
               <el-tag v-else-if="scope.row.status == '3'" type="danger">早退</el-tag>
               <el-tag v-else-if="scope.row.status == '4'" type="info" effect="dark">缺勤</el-tag>
               <el-tag v-else>请假</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="备注" align="center" prop="remark" />
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)">修改</el-button>
              <el-button size="mini" type="text" icon="el-icon-delete" style="color:red" @click="handleDelete(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>

        <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>
      </el-col>
    </el-row>

    <!-- 一键生成弹窗 -->
    <el-dialog title="一键生成考勤" :visible.sync="initOpen" width="400px" append-to-body>
      <el-form :model="initForm" label-width="80px">
        <el-form-item label="选择班级">
           <treeselect v-model="initForm.deptId" :options="classOptions" :show-count="true" placeholder="请选择班级" />
        </el-form-item>
        <el-form-item label="考勤日期">
           <el-date-picker v-model="initForm.attendanceDate" type="date" value-format="yyyy-MM-dd" placeholder="选择日期" style="width:100%"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitInit">确 定</el-button>
        <el-button @click="initOpen = false">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="选择学生" prop="studentId">
           <el-select v-model="form.studentId" filterable placeholder="请搜索选择学生" style="width:100%" @change="handleStudentChange">
              <el-option
                v-for="user in userList"
                :key="user.userId"
                :label="user.nickName + ' (' + user.userName + ')'"
                :value="user.userId">
              </el-option>
           </el-select>
        </el-form-item>

        <el-form-item label="考勤日期" prop="attendanceDate">
          <el-date-picker clearable v-model="form.attendanceDate" type="date" value-format="yyyy-MM-dd" placeholder="选择日期" style="width:100%"/>
        </el-form-item>

        <el-form-item label="考勤状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio label="1">正常/出勤</el-radio>
            <el-radio label="2">迟到</el-radio>
            <el-radio label="3">早退</el-radio>
            <el-radio label="4">缺勤</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
// 引入基础API
import { listAttendance, getAttendance, delAttendance, addAttendance, updateAttendance, initAttendance, getAttendanceStats } from "@/api/school/attendance";
// 引入用户列表API（用于下拉框）
import { listUser, deptTreeSelect } from "@/api/system/user";
import request from '@/utils/request';
import * as echarts from 'echarts';
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Attendance",
  components: { Treeselect },
  data() {
    return {
      loading: true,
      chartLoading: false,
      ids: [],
      showSearch: true,
      total: 0,
      attendanceList: [],
      userList: [], // 存放所有学生列表
      classOptions: [], // 班级列表

      // 🔥🔥🔥 新增：日期范围变量，用于前端筛选 🔥🔥🔥
      dateRange: [],

      title: "",
      open: false,
      initOpen: false, // 一键生成弹窗
      queryParams: { pageNum: 1, pageSize: 10, studentName: null, status: null, deptId: null },
      form: {},
      initForm: {}, // 一键生成表单
      rules: {
        studentId: [{ required: true, message: "必须选择学生", trigger: "change" }],
        attendanceDate: [{ required: true, message: "日期不能为空", trigger: "blur" }],
        status: [{ required: true, message: "状态不能为空", trigger: "blur" }]
      },
      myChart: null
    };
  },

  // 🔥🔥🔥 新增：计算属性，用于前端实时过滤数据 🔥🔥🔥
  computed: {
    filteredList() {
        // 1. 如果没有选择日期，直接返回后端给的原始数据
        if (!this.dateRange || this.dateRange.length === 0) {
            return this.attendanceList;
        }

        // 2. 如果选了日期，就在前端进行筛选
        const start = this.dateRange[0];
        const end = this.dateRange[1];

        return this.attendanceList.filter(item => {
            // 这里比较日期字符串 "2024-01-01"
            return item.attendanceDate >= start && item.attendanceDate <= end;
        });
    }
  },

  created() {
    this.getList();
    this.getUserList(); // 加载下拉框的学生
    this.getClassList(); // 加载班级
    this.getChartData(); // 加载图表
  },
  methods: {
    // 0. 获取班级列表
    getClassList() {
      deptTreeSelect().then(response => {
        this.classOptions = response.data;
      });
    },
    // 1. 获取考勤列表
    getList() {
      this.loading = true;
      listAttendance(this.queryParams).then(response => {
        this.attendanceList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 2. 获取用户列表（填充下拉框）
    getUserList() {
      listUser({ pageNum: 1, pageSize: 100 }).then(response => {
         this.userList = response.rows;
      });
    },
    // 3. 选择学生后，自动填入名字
    handleStudentChange(val) {
        const user = this.userList.find(item => item.userId === val);
        if (user) {
            this.form.studentName = user.nickName;
        }
    },
    // 4. 获取图表统计数据
    getChartData() {
        this.chartLoading = true;
        // 🔥 传递查询参数给图表接口
        getAttendanceStats(this.queryParams).then(res => {
            this.initChart(res.data);
            this.chartLoading = false;
        });
    },
    // 5. 渲染饼图
    initChart(data) {
        const chartDom = document.getElementById('attendanceChart');
        if(!chartDom) return;
        if(this.myChart) this.myChart.dispose();

        this.myChart = echarts.init(chartDom);
        const option = {
            tooltip: { trigger: 'item' },
            legend: { top: '5%', left: 'center' },
            color: ['#67C23A', '#E6A23C', '#F56C6C', '#909399', '#409EFF'], // 对应正常,迟到,早退,缺勤
            series: [
                {
                    name: '考勤分布',
                    type: 'pie',
                    radius: ['40%', '70%'],
                    avoidLabelOverlap: false,
                    itemStyle: { borderRadius: 10, borderColor: '#fff', borderWidth: 2 },
                    label: { show: false, position: 'center' },
                    emphasis: { label: { show: true, fontSize: 20, fontWeight: 'bold' } },
                    labelLine: { show: false },
                    data: data // 后端返回的 {name: '迟到', value: 5} 格式
                }
            ]
        };
        this.myChart.setOption(option);
    },

    // 常规增删改查
    cancel() { this.open = false; this.reset(); },
    reset() {
        this.form = { attendanceId: null, studentId: null, studentName: null, attendanceDate: new Date(), status: "1", remark: null };
        this.resetForm("form");
    },
    handleQuery() {
        this.queryParams.pageNum = 1;
        this.getList();
        this.getChartData(); // 刷新图表
    },
    resetQuery() {
        this.resetForm("queryForm");
        this.dateRange = []; // 重置时也要清空日期
        this.handleQuery();
    },
    // 一键生成
    handleInit() {
      this.initForm = {};
      this.initOpen = true;
    },
    // 提交一键生成
    submitInit() {
        if (!this.initForm.deptId || !this.initForm.attendanceDate) {
            this.$modal.msgError("请选择班级和日期");
            return;
        }
        initAttendance(this.initForm).then(response => {
            this.$modal.msgSuccess("生成成功");
            this.initOpen = false;
            this.getList();
            this.getChartData();
        });
    },
    handleAdd() { this.reset(); this.open = true; this.title = "新增考勤"; },
    handleUpdate(row) {
      this.reset();
      getAttendance(row.attendanceId).then(response => { this.form = response.data; this.open = true; this.title = "修改考勤"; });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.attendanceId != null) {
            updateAttendance(this.form).then(() => { this.$modal.msgSuccess("修改成功"); this.open = false; this.getList(); this.getChartData(); });
          } else {
            addAttendance(this.form).then(() => { this.$modal.msgSuccess("新增成功"); this.open = false; this.getList(); this.getChartData(); });
          }
        }
      });
    },
    handleDelete(row) {
      this.$modal.confirm('确认删除？').then(() => { return delAttendance(row.attendanceId); }).then(() => { this.getList(); this.getChartData(); this.$modal.msgSuccess("删除成功"); });
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.attendanceId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    }
  }
};
</script>
