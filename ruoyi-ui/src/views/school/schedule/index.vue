<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="班级名称" prop="classId">
        <treeselect v-model="queryParams.classId" :options="deptOptions" :show-count="true" :normalizer="normalizer" :append-to-body="true" placeholder="请选择班级" style="width: 200px; display: inline-block; vertical-align: middle;" @select="handleQuery" />
      </el-form-item>
      <el-form-item label="老师姓名" prop="teacherName">
        <el-input v-model="queryParams.teacherName" placeholder="请输入老师姓名" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['school:schedule:add']">新增排课</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" v-hasPermi="['school:schedule:export']">导出</el-button>
      </el-col>

      <el-col :span="12" style="text-align: right; float: right;">
        <el-radio-group v-model="viewMode" size="mini" @change="handleViewChange">
          <el-radio-button label="list"><i class="el-icon-tickets"></i> 列表管理</el-radio-button>
          <el-radio-button label="table"><i class="el-icon-date"></i> 课表视图</el-radio-button>
          <el-radio-button label="chart"><i class="el-icon-s-data"></i> 课时统计</el-radio-button>
        </el-radio-group>
      </el-col>
    </el-row>

    <div v-show="viewMode === 'list'">
      <el-table v-loading="loading" :data="scheduleList" @selection-change="handleSelectionChange">
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="班级" align="center" prop="className" />
        <el-table-column label="科目" align="center" prop="courseName" />
        <el-table-column label="老师" align="center" prop="teacherName" />
        <el-table-column label="星期" align="center" prop="weekDay">
            <template slot-scope="scope">周{{ parseWeek(scope.row.weekDay) }}</template>
        </el-table-column>
        <el-table-column label="节次" align="center" prop="section">
            <template slot-scope="scope">第{{ scope.row.section }}节</template>
        </el-table-column>
        <el-table-column label="地点" align="center" prop="classroom" />
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['school:schedule:edit']">修改</el-button>
            <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['school:schedule:remove']">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>
    </div>

    <div v-show="viewMode === 'table'">
      <el-card shadow="never" style="margin-top:10px;">
        <div slot="header" class="clearfix">
          <span style="font-weight:bold; font-size:16px;">
            <i class="el-icon-date"></i>
            {{ queryParams.className ? queryParams.className + ' - ' : '' }} 课程表预览
          </span>
          <span style="font-size:12px; color:#999; margin-left:10px;">(提示：使用上方搜索栏筛选具体班级或老师)</span>
        </div>

        <el-table :data="timetableGridData" border style="width: 100%" :cell-style="{padding: '5px 0'}">
          <el-table-column label="节次" width="100" align="center">
            <template slot-scope="scope">
              <div style="font-weight:bold; color:#333;">第 {{ scope.row.section }} 节</div>
              <div style="font-size:12px; color:#999;">{{ getSectionTime(scope.row.section) }}</div>
            </template>
          </el-table-column>

          <el-table-column v-for="day in weekLabels" :key="day.key" :label="day.label" align="center">
            <template slot-scope="scope">
              <div v-if="scope.row[day.key]"
                   class="course-card"
                   :class="getSubjectColorClass(scope.row[day.key].courseName)"
                   @click="handleUpdate(scope.row[day.key])"
              >
                <div class="course-name">{{ scope.row[day.key].courseName }}</div>
                <div class="course-teacher">
                    <i class="el-icon-user"></i> {{ scope.row[day.key].teacherName }}
                </div>
                <div class="course-room" v-if="!queryParams.className">
                    {{ scope.row[day.key].className }}
                </div>
                 <div class="course-room" v-if="scope.row[day.key].classroom">
                    📍{{ scope.row[day.key].classroom }}
                </div>
              </div>
              <div v-else class="empty-cell">-</div>
            </template>
          </el-table-column>
        </el-table>
      </el-card>
    </div>

    <div v-show="viewMode === 'chart'">
        <el-row :gutter="20" style="margin-top:20px;">
            <el-col :span="16">
                <el-card>
                    <div id="statsChart" style="width: 100%; height: 400px;"></div>
                </el-card>
            </el-col>
            <el-col :span="8">
                <el-card header="数据概览">
                     <el-table :data="statsList" height="400" stripe style="width: 100%">
                        <el-table-column prop="name" label="教师姓名" />
                        <el-table-column prop="count" label="周课时" sortable>
                            <template slot-scope="scope">
                                <el-tag>{{ scope.row.count }} 节</el-tag>
                            </template>
                        </el-table-column>
                    </el-table>
                </el-card>
            </el-col>
        </el-row>
    </div>
<!--
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="班级ID" prop="classId">
           <el-input-number v-model="form.classId" placeholder="请输入数字ID" style="width:100%"/>
        </el-form-item>
        <el-form-item label="班级名称" prop="className">
          <el-input v-model="form.className" placeholder="请输入班级名称" />
        </el-form-item>
        <el-form-item label="科目名称" prop="courseName">
          <el-input v-model="form.courseName" placeholder="例如：语文" />
        </el-form-item>
        <el-form-item label="授课老师" prop="teacherName">
          <el-input v-model="form.teacherName" placeholder="请输入姓名" />
        </el-form-item>
        <el-row>
            <el-col :span="12">
                <el-form-item label="星期" prop="weekDay">
                  <el-select v-model="form.weekDay" placeholder="请选择">
                      <el-option v-for="i in 7" :key="i" :label="'周'+parseWeek(i)" :value="i" />
                  </el-select>
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="节次" prop="section">
                  <el-input-number v-model="form.section" :min="1" :max="8" />
                </el-form-item>
            </el-col>
        </el-row>
        <el-form-item label="上课地点" prop="classroom">
          <el-input v-model="form.classroom" placeholder="请输入上课地点" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog> -->

    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
            <el-col :span="12">
                <el-form-item label="选择班级" prop="classId">
                   <treeselect v-model="form.classId" :options="deptOptions" :normalizer="normalizer" placeholder="请选择班级" @select="handleClassSelect" />
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="班级名称" prop="className">
                   <el-input v-model="form.className" disabled placeholder="自动填充" />
                </el-form-item>
            </el-col>
        </el-row>

        <el-row>
            <el-col :span="12">
                <el-form-item label="选择科目" prop="courseId">
                   <el-select v-model="form.courseId" placeholder="请选择科目" style="width: 100%" @change="handleCourseChange">
                      <el-option v-for="item in courseOptions" :key="item.courseId" :label="item.courseName" :value="item.courseId" />
                   </el-select>
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="科目名称" prop="courseName">
                   <el-input v-model="form.courseName" disabled placeholder="自动填充" />
                </el-form-item>
            </el-col>
        </el-row>

        <el-row>
            <el-col :span="12">
                <el-form-item label="选择老师" prop="teacherId">
                   <el-select v-model="form.teacherId" filterable placeholder="请选择老师" style="width: 100%" @change="handleTeacherChange">
                      <el-option v-for="item in teacherOptions" :key="item.userId" :label="item.nickName" :value="item.userId" />
                   </el-select>
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="老师姓名" prop="teacherName">
                   <el-input v-model="form.teacherName" disabled placeholder="自动填充" />
                </el-form-item>
            </el-col>
        </el-row>

        <el-row>
            <el-col :span="12">
                <el-form-item label="星期" prop="weekDay">
                  <el-select v-model="form.weekDay" placeholder="请选择" style="width:100%">
                      <el-option v-for="i in 7" :key="i" :label="'周'+parseWeek(i)" :value="i" />
                  </el-select>
                </el-form-item>
            </el-col>
            <el-col :span="12">
                <el-form-item label="节次" prop="section">
                  <el-input-number v-model="form.section" :min="1" :max="8" style="width:100%" />
                </el-form-item>
            </el-col>
        </el-row>

         <el-form-item label="时段" prop="timePeriod">
             <el-radio-group v-model="form.timePeriod">
                <el-radio label="0">上午</el-radio>
                <el-radio label="1">下午</el-radio>
                <el-radio label="2">晚自习</el-radio>
             </el-radio-group>
        </el-form-item>

        <el-form-item label="上课地点" prop="classroom">
          <el-input v-model="form.classroom" placeholder="请输入上课地点" />
        </el-form-item>

        <el-form-item label="学年学期" prop="schoolYear">
          <el-input v-model="form.schoolYear" placeholder="如 2024-1" />
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
// 注意：这里使用了正确的 API 路径
import { listSchedule, getSchedule, delSchedule, addSchedule, updateSchedule } from "@/api/school/schedule"
import { listCourse } from "@/api/school/course";
import { listDept } from "@/api/system/dept";
import { listUser } from "@/api/system/user";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import * as echarts from 'echarts'; // 需要安装: npm install echarts --save

export default {
  name: "Schedule",
  components: { Treeselect },
  data() {
    return {
      // === 新增/修改的状态变量 ===
      viewMode: 'list', // 当前视图模式：list, table, chart
      timetableGridData: [], // 转换后的网格数据
      weekLabels: [
          { label: '周一', key: '1' }, { label: '周二', key: '2' }, { label: '周三', key: '3' },
          { label: '周四', key: '4' }, { label: '周五', key: '5' }, { label: '周六', key: '6' }, { label: '周日', key: '7' }
      ],
      statsList: [], // 统计数据

      // 🔥 下拉选项数据
      courseOptions: [],
      deptOptions: [],
      teacherOptions: [],

      // === 原有变量 ===
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      scheduleList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 100, // 修改：为了看课表，一次查多点数据
        classId: null,
        className: null,
        courseId: null,
        courseName: null,
        teacherId: null,
        teacherName: null,
        weekDay: null,
        section: null,
        timePeriod: null,
        classroom: null,
        schoolYear: null,
      },
      form: {},
      rules: {
        classId: [{ required: true, message: "班级ID不能为空", trigger: "blur" }],
        courseName: [{ required: true, message: "科目不能为空", trigger: "blur" }],
        weekDay: [{ required: true, message: "星期不能为空", trigger: "blur" }],
        section: [{ required: true, message: "节次不能为空", trigger: "blur" }],
      }
    }
  },
  created() {
    this.getList();
    this.getCourseList();
    this.getDeptList();
    this.getTeacherList();
  },
  methods: {
    // 🔥 处理树形结构（如果 utils/ruoyi.js 中没有 handleTree）
    // 通常 RuoYi 全局挂载了，但为了保险起见，或者如果是局部引用
    // 这里我们直接用 this.handleTree，因为 main.js 已经挂载了

    /** 转换部门数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.deptId,
        label: node.deptName,
        children: node.children
      };
    },
    // 🔥 获取课程列表
    getCourseList() {
      listCourse().then(response => {
        // 兼容不同的返回格式 (RuoYi 可能是 rows 或 data)
        this.courseOptions = response.rows || response.data || [];
      });
    },
    // 🔥 获取部门列表
    getDeptList() {
      listDept().then(response => {
        // 部门列表通常返回 data
        const data = response.data || response.rows || [];
        this.deptOptions = this.handleTree(data, "deptId");
      });
    },
    // 🔥 获取用户列表(老师)
    getTeacherList() {
      // 必须传 pageNum/pageSize 否则默认只查10条
      listUser({ pageNum: 1, pageSize: 1000 }).then(response => {
        this.teacherOptions = response.rows || [];
      });
    },

    // 🔥 联动处理
    handleClassSelect(node) {
        if(node) this.form.className = node.deptName;
    },
    handleCourseChange(val) {
        const item = this.courseOptions.find(i => i.courseId === val);
        if(item) this.form.courseName = item.courseName;
    },
    handleTeacherChange(val) {
        const item = this.teacherOptions.find(i => i.userId === val);
        if(item) this.form.teacherName = item.nickName;
    },

    /** 查询班级课程列表 */
    getList() {
      this.loading = true
      listSchedule(this.queryParams).then(response => {
        this.scheduleList = response.rows
        this.total = response.total
        this.loading = false

        // ★ 获取数据后，立即刷新可视化视图
        this.refreshVisualViews();
      })
    },

    // === 新增核心方法：刷新可视化数据 ===
    refreshVisualViews() {
        this.generateTimetableGrid(); // 生成网格
        this.generateStats();         // 生成统计
    },

    // 1. 生成网格数据
    generateTimetableGrid() {
        const rows = [];
        for(let i=1; i<=8; i++) { // 假设每天8节课
            let rowData = { section: i };
            this.weekLabels.forEach(day => rowData[day.key] = null); // 初始化空
            rows.push(rowData);
        }

        // 填空
        this.scheduleList.forEach(item => {
            const rowIndex = item.section - 1; // 节次1 -> 下标0
            const dayKey = item.weekDay ? item.weekDay.toString() : '';

            if (rows[rowIndex] && dayKey) {
                // 如果是列表数据包含多个班级，这里默认显示找到的第一个，或者根据逻辑处理
                // 为了避免格子被覆盖，这里只显示最后一条匹配的
                rows[rowIndex][dayKey] = item;
            }
        });
        this.timetableGridData = rows;
    },

    // 2. 生成统计图表
    generateStats() {
        const map = {};
        this.scheduleList.forEach(item => {
            const name = item.teacherName || '未知';
            map[name] = (map[name] || 0) + 1;
        });

        // 转换成数组供表格显示
        this.statsList = Object.keys(map).map(key => ({ name: key, count: map[key] }));

        // 只有切换到图表模式时才渲染Echarts，节省资源
        if (this.viewMode === 'chart') {
            this.$nextTick(() => {
                this.initChart(map);
            });
        }
    },

    // 3. Echarts 初始化
    initChart(dataMap) {
        const chartDom = document.getElementById('statsChart');
        if (!chartDom) return;

        // 销毁旧实例防止内存泄漏
        let myChart = echarts.getInstanceByDom(chartDom);
        if (myChart) myChart.dispose();

        myChart = echarts.init(chartDom);
        const option = {
            title: { text: '教师课时分布图', left: 'center' },
            tooltip: { trigger: 'axis' },
            xAxis: { type: 'category', data: Object.keys(dataMap) },
            yAxis: { type: 'value', name: '节数' },
            series: [{
                data: Object.values(dataMap),
                type: 'bar',
                itemStyle: { color: '#409EFF' },
                label: { show: true, position: 'top' }
            }]
        };
        myChart.setOption(option);
    },

    // 视图切换事件
    handleViewChange(val) {
        if (val === 'chart') {
            this.generateStats();
        }
    },

    // === 辅助显示方法 ===
    parseWeek(val) {
        const map = {1:'一', 2:'二', 3:'三', 4:'四', 5:'五', 6:'六', 7:'日'};
        return map[val] || val;
    },
    getSectionTime(s) {
        const times = ["08:00", "08:55", "10:00", "10:55", "14:00", "14:55", "16:00", "16:55"];
        return times[s-1] || '';
    },
    getSubjectColorClass(name) {
        if (!name) return 'bg-default';
        if (name.includes('语')) return 'bg-pink';
        if (name.includes('数')) return 'bg-blue';
        if (name.includes('英')) return 'bg-purple';
        if (name.includes('体')) return 'bg-green';
        return 'bg-default';
    },

    // === 原有 CRUD 方法 (保持不变) ===
    cancel() { this.open = false; this.reset(); },
    reset() {
      this.form = { scheduleId: null, classId: null, className: null, courseId: null, courseName: null, teacherId: null, teacherName: null, weekDay: null, section: null, timePeriod: null, classroom: null, schoolYear: null, remark: null };
      this.resetForm("form");
    },
    handleQuery() { this.queryParams.pageNum = 1; this.getList(); },
    resetQuery() { this.resetForm("queryForm"); this.handleQuery(); },
    handleSelectionChange(selection) { this.ids = selection.map(item => item.scheduleId); this.single = selection.length!==1; this.multiple = !selection.length; },
    handleAdd() { this.reset(); this.open = true; this.title = "添加班级课程"; },
    handleUpdate(row) {
      this.reset();
      const scheduleId = row.scheduleId || this.ids;
      getSchedule(scheduleId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改班级课程";
      });
    },
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.scheduleId != null) {
            updateSchedule(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSchedule(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    handleDelete(row) {
      const scheduleIds = row.scheduleId || this.ids;
      this.$modal.confirm('是否确认删除？').then(function() { return delSchedule(scheduleIds); }).then(() => { this.getList(); this.$modal.msgSuccess("删除成功"); }).catch(() => {});
    },
    handleExport() {
      this.download('school/schedule/export', { ...this.queryParams }, `schedule_${new Date().getTime()}.xlsx`);
    }
  }
}
</script>

<style scoped>
/* 课表卡片样式 */
.course-card {
    padding: 8px;
    border-radius: 4px;
    color: #fff;
    font-size: 13px;
    min-height: 80px;
    cursor: pointer;
    transition: transform 0.2s;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
.course-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}
.course-name {
    font-weight: bold;
    font-size: 15px;
    margin-bottom: 5px;
}
.course-teacher, .course-room {
    font-size: 12px;
    opacity: 0.9;
    margin-top: 2px;
}
.empty-cell {
    color: #e0e0e0;
    font-size: 20px;
}

/* 颜色类 */
.bg-pink { background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%); }
.bg-blue { background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%); }
.bg-purple { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.bg-green { background: linear-gradient(135deg, #84fab0 0%, #8fd3f4 100%); }
.bg-default { background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%); color: #666; }
</style>
