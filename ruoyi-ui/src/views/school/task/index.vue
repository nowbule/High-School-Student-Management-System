<template>
  <div class="app-container">
    <el-card shadow="always" style="margin-bottom: 20px;">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px" style="margin-top: 10px;">
        <el-form-item label="科目" prop="courseId">
          <el-select v-model="queryParams.courseId" placeholder="请选择科目" clearable style="width: 200px">
            <el-option v-for="item in courseOptions" :key="item.courseId" :label="item.courseName" :value="item.courseId" />
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="classId">
          <treeselect v-model="queryParams.classId" :options="deptOptions" :show-count="true" :normalizer="normalizer" :append-to-body="true" placeholder="请选择班级" style="width: 200px; display: inline-block; vertical-align: middle;" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['school:task:add']">发布新作业</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['school:task:edit']">修改作业</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['school:task:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="taskList" @selection-change="handleSelectionChange" border stripe>
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="任务ID" align="center" prop="taskId" width="80" />

      <el-table-column label="科目" align="center" prop="taskTitle" min-width="120">
        <template slot-scope="scope">
          <el-tag type="info" effect="plain" size="medium">{{ scope.row.taskTitle }}</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="作业内容/要求" align="left" prop="taskContent" min-width="200" :show-overflow-tooltip="true">
         <template slot-scope="scope">
           <!-- 简单展示文本内容，去除HTML标签 -->
           <span>{{ stripHtml(scope.row.taskContent) }}</span>
         </template>
      </el-table-column>

      <el-table-column label="截止时间" align="center" prop="deadlineTime" width="180">
        <template slot-scope="scope">
          <span :style="isExpired(scope.row.deadlineTime) ? 'color: red; font-weight: bold;' : ''">
            <i class="el-icon-time"></i> {{ parseTime(scope.row.deadlineTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
          </span>
          <el-tag size="mini" type="danger" effect="dark" v-if="isExpired(scope.row.deadlineTime)" style="margin-left:5px; transform: scale(0.8);">已截止</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="状态" align="center" prop="status" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === '0'" type="info" effect="plain">草稿</el-tag>
          <el-tag v-else-if="scope.row.status === '1'" type="success" effect="dark">已发布</el-tag>
          <el-tag v-else type="danger">已结束</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="250">
        <template slot-scope="scope">
          <el-button size="mini" type="primary" icon="el-icon-s-data" @click="handleCheckSubmissions(scope.row)" plain>查看提交</el-button>
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['school:task:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" style="color: #F56C6C;" @click="handleDelete(scope.row)" v-hasPermi="['school:task:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="科目" prop="courseId">
              <el-select v-model="form.courseId" placeholder="请选择科目" style="width: 100%" @change="handleCourseChange">
                 <el-option v-for="item in courseOptions" :key="item.courseId" :label="item.courseName" :value="item.courseId" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="班级" prop="classId">
              <treeselect v-model="form.classId" :options="deptOptions" :normalizer="normalizer" placeholder="请选择班级" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="截止时间" prop="deadlineTime">
              <el-date-picker
                style="width: 100%;"
                :popper-append-to-body="false"
                clearable
                v-model="form.deadlineTime"
                type="datetime"
                value-format="yyyy-MM-dd HH:mm:ss"
                placeholder="请选择截止时间">
              </el-date-picker>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态" prop="status">
              <el-radio-group v-model="form.status">
                <el-radio label="0">草稿</el-radio>
                <el-radio label="1">立即发布</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>

        <el-form-item label="作业内容">
          <editor v-model="form.taskContent" :min-height="250"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitTask" icon="el-icon-check">确 定</el-button>
        <el-button @click="cancel" icon="el-icon-close">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {listTask, getTask, delTask, addTask, updateTask} from "@/api/school/task";
import { listCourse } from "@/api/school/course";
import { listDept } from "@/api/system/dept";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Task",
  components: { Treeselect },
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      taskList: [],
      title: "",
      open: false,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskTitle: null,
        courseId: null, // 🔥 新增：按课程筛选
        classId: null   // 🔥 新增：按班级筛选
      },
      form: {},
      rules: {
        taskTitle: [{required: true, message: "科目/标题不能为空", trigger: "change"}],
        courseId: [{required: true, message: "所属科目不能为空", trigger: "change"}],
        classId: [{required: true, message: "所属班级不能为空", trigger: "change"}],
        deadlineTime: [{required: true, message: "截止时间不能为空", trigger: "change"}]
      },
      // subjectOptions: ['语文', '数学', '英语', '物理', '化学', '生物', '政治', '历史', '地理', '体育', '音乐', '美术', '信息技术', '通用技术'],
      courseOptions: [], // 🔥 新增：从后端获取的课程列表
      deptOptions: []    // 🔥 新增：班级列表
    };
  },
  created() {
    this.getList();
    this.getCourseList(); // 🔥 获取课程列表
    this.getDeptList();   // 🔥 获取班级列表
  },
  methods: {
    // 辅助函数：去除HTML标签用于列表展示
    stripHtml(html) {
      if (!html) return "";
      return html.replace(/<[^>]+>/g, "").substring(0, 50) + (html.length > 50 ? "..." : "");
    },
    // 辅助函数：判断是否过期
    isExpired(deadline) {
      if (!deadline) return false;
      return new Date(deadline).getTime() < new Date().getTime();
    },
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
    /** 查询部门下拉树结构 */
    getDeptList() {
      listDept().then(response => {
        this.deptOptions = this.handleTree(response.data, "deptId");
      });
    },
    getList() {
      this.loading = true;
      listTask(this.queryParams).then(response => {
        this.taskList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    cancel() {
      this.open = false;
      this.reset();
    },
    reset() {
      this.form = {
        taskId: null,
        taskTitle: null,
        courseId: null,
        classId: null,
        taskContent: null,
        deadlineTime: null,
        status: "0"
      };
      this.resetForm("form");
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.taskId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "发布新作业";
    },
    handleUpdate(row) {
      this.reset();
      const taskId = row.taskId || this.ids
      getTask(taskId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改作业信息";
      });
    },

    submitTask() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.taskId != null) {
            updateTask(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTask(this.form).then(response => {
              this.$modal.msgSuccess("发布成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },

    handleDelete(row) {
      const taskIds = row.taskId || this.ids;
      this.$modal.confirm('是否确认删除作业编号为"' + taskIds + '"的数据项？').then(function () {
        return delTask(taskIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },

    // 跳转到成绩批改页面
    handleCheckSubmissions(row) {
      this.$router.push({
        path: '/school/submission',
        query: {
           // 传递任务ID，精准筛选
           taskId: row.taskId,
           // 传递科目参数，自动筛选 (保留作为参考)
           'params[subject]': row.taskTitle
        }
      });
    },
    // 🔥 获取课程列表
    getCourseList() {
      listCourse().then(response => {
        // 兼容 rows 或 data
        this.courseOptions = response.rows || response.data || [];
      });
    },
    // 🔥 选择课程后，自动填充标题（可选）
    handleCourseChange(courseId) {
        const course = this.courseOptions.find(item => item.courseId === courseId);
        if (course) {
            // 自动填充科目名称到 taskTitle，确保列表显示正常
            this.form.taskTitle = course.courseName;
        }
    }
  }
};
</script>
