<template>
  <div class="app-container">
    <div class="page-header-wrapper">
      <el-page-header @back="$router.go(-1)" content="我的作业列表" title="返回" />
    </div>

    <el-card shadow="hover" class="box-card">
      <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" size="small">
        <el-form-item label="作业标题" prop="taskTitle">
          <el-input
            v-model="queryParams.taskTitle"
            placeholder="请输入关键词搜索"
            clearable
            prefix-icon="el-icon-search"
            @keyup.enter.native="handleQuery"
            style="width: 240px"
          />
        </el-form-item>
        <!-- 新增科目筛选 -->
        <el-form-item label="科目" prop="subject">
          <el-select v-model="filterSubject" placeholder="请选择科目" clearable style="width: 150px" @change="handleQuery">
             <el-option v-for="sub in subjectOptions" :key="sub" :label="sub" :value="sub" />
          </el-select>
        </el-form-item>

        <!-- 新增状态筛选 -->
        <el-form-item label="状态" prop="status">
          <el-select v-model="filterStatus" placeholder="请选择状态" clearable style="width: 150px" @change="handleQuery">
             <el-option v-for="dict in statusOptions" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleQuery">查询</el-button>
          <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-table
        v-loading="loading"
        :data="homeworkList"
        stripe
        border
        :header-cell-style="{background:'#f8f8f9', color:'#515a6e'}"
      >
        <el-table-column label="序号" type="index" width="55" align="center" />

        <!-- 新增科目列 -->
        <el-table-column label="科目" align="center" width="100">
           <template slot-scope="scope">
              <el-tag effect="plain" :type="getSubjectType(getSubject(scope.row.taskTitle))">
                {{ getSubject(scope.row.taskTitle) }}
              </el-tag>
           </template>
        </el-table-column>

        <el-table-column label="作业标题" align="center" prop="taskTitle" min-width="150" show-overflow-tooltip>
          <template slot-scope="scope">
             <span class="task-title-link" @click="handleView(scope.row)">
                {{ scope.row.taskTitle }}
             </span>
          </template>
        </el-table-column>

        <!-- 新增教师列 -->
        <el-table-column label="发布教师" align="center" width="120" prop="teacherName">
           <template slot-scope="scope">
             <i class="el-icon-user"></i> {{ scope.row.teacherName || '未知' }}
           </template>
        </el-table-column>

        <el-table-column label="状态" align="center" width="180">
          <template slot-scope="scope">
            <template v-if="scope.row.submissionId">
               <el-tag type="success" size="small"><i class="el-icon-check"></i> 已提交</el-tag>
               <div class="deadline-text">{{ parseTime(scope.row.submitTime) }} 提交</div>
            </template>
            <template v-else>
               <div v-if="checkDeadlineStatus(scope.row.deadlineTime).isExpired">
                  <el-tag type="danger" size="small">已截止</el-tag>
                  <span class="deadline-text expired">{{ parseTime(scope.row.deadlineTime) }}</span>
               </div>
               <div v-else>
                  <el-tag type="primary" size="small">待提交</el-tag>
                  <span class="deadline-text">{{ parseTime(scope.row.deadlineTime) }} 截止</span>
               </div>
            </template>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="220">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-view"
              @click="handleView(scope.row)"
            >详情</el-button>
            <el-divider direction="vertical"></el-divider>

            <!-- 已提交：查看提交 -->
            <template v-if="scope.row.submissionId">
               <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-document-checked"
                  @click="handleViewSubmission(scope.row)"
                >查看提交</el-button>
            </template>

            <!-- 未提交：去提交（如果没过期） -->
            <template v-else>
               <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-edit-outline"
                  :disabled="checkDeadlineStatus(scope.row.deadlineTime).isExpired"
                  @click="handleSubmit(scope.row)"
                >
                  {{ checkDeadlineStatus(scope.row.deadlineTime).isExpired ? '已截止' : '去提交' }}
                </el-button>
            </template>

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

    <el-dialog
      title="作业详情"
      :visible.sync="viewOpen"
      width="600px"
      append-to-body
      custom-class="view-dialog"
    >
      <el-descriptions :column="1" border v-loading="detailLoading">
        <el-descriptions-item label="作业标题">
          <span style="font-weight: bold">{{ viewForm.taskTitle }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="科目">
          {{ getSubject(viewForm.taskTitle) }}
        </el-descriptions-item>
        <el-descriptions-item label="发布教师">
          {{ viewForm.teacherName || viewForm.createBy || '-' }}
        </el-descriptions-item>
        <el-descriptions-item label="截止时间">
          <i class="el-icon-time"></i> {{ parseTime(viewForm.deadlineTime) }}
        </el-descriptions-item>
        <el-descriptions-item label="作业要求">
          <div class="html-content" v-html="viewForm.taskContent || '暂无内容'"></div>
        </el-descriptions-item>
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button @click="viewOpen = false">关 闭</el-button>
        <!-- 如果未提交且未过期，显示去提交 -->
        <el-button
          type="primary"
          @click="switchToSubmit"
          v-if="!viewForm.submissionId && !checkDeadlineStatus(viewForm.deadlineTime).isExpired"
        >
          去提交
        </el-button>
      </div>
    </el-dialog>

    <!-- 提交作业弹窗 -->
    <el-dialog
      :visible.sync="open"
      width="600px"
      append-to-body
      :close-on-click-modal="false"
      custom-class="submit-dialog"
    >
      <div slot="title" class="dialog-title">
        <i class="el-icon-edit-outline"></i> {{ title }}
      </div>

      <div class="task-requirement-box" v-loading="detailLoading">
        <div class="box-title"><i class="el-icon-reading"></i> 作业要求：</div>
        <div class="box-content" v-html="form.taskRequirement || '加载中...'"></div>
      </div>

      <el-form ref="form" :model="form" :rules="rules" label-width="80px" style="margin-top: 15px;">
        <el-form-item label="我的答案" prop="submitContent">
          <el-input
            v-model="form.submitContent"
            type="textarea"
            placeholder="请输入你的答案、解题思路或代码..."
            :rows="6"
            show-word-limit
            maxlength="2000"
          />
        </el-form-item>

        <el-form-item label="附件上传" prop="submitFiles">
          <file-upload
            v-model="form.submitFiles"
            :limit="5"
            :fileSize="20"
            :fileType="['png', 'jpg', 'jpeg', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'pdf', 'zip', 'rar', 'txt']"
          />
          <div style="font-size: 12px; color: #999; line-height: 1.5; margin-top: 5px;">
            支持 Word、Excel、PPT、PDF、压缩包及图片格式，单个文件不超过 20MB
          </div>
        </el-form-item>

      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" :loading="submitLoading" @click="submitForm">确 定 提 交</el-button>
      </div>
    </el-dialog>

    <!-- 查看提交记录弹窗 -->
    <el-dialog title="我的提交" :visible.sync="submissionOpen" width="600px" append-to-body>
       <el-descriptions :column="1" border>
          <el-descriptions-item label="提交时间">{{ parseTime(submissionForm.submitTime) }}</el-descriptions-item>
          <el-descriptions-item label="提交状态">
             <el-tag type="success">已提交</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="我的答案">
             <div v-html="submissionForm.submitContent || '无文本内容'"></div>
          </el-descriptions-item>
          <el-descriptions-item label="附件">
             <div v-if="submissionForm.submitFiles">
                <!-- 这里简单展示，实际可以使用 file-upload 的回显功能或链接 -->
                <el-link type="primary" :href="submissionForm.submitFiles" target="_blank">点击查看附件</el-link>
             </div>
             <span v-else>无附件</span>
          </el-descriptions-item>
          <el-descriptions-item label="老师评语" v-if="submissionForm.status === '2'">
             {{ submissionForm.teacherComment || '暂无评语' }}
          </el-descriptions-item>
          <el-descriptions-item label="得分" v-if="submissionForm.status === '2'">
             <span style="color: #F56C6C; font-weight: bold; font-size: 16px;">{{ submissionForm.score }} 分</span>
          </el-descriptions-item>
       </el-descriptions>
       <div slot="footer" class="dialog-footer">
         <el-button @click="submissionOpen = false">关 闭</el-button>
       </div>
    </el-dialog>

  </div>
</template>

<script>
import { listMyHomework, submitHomework } from "@/api/school/submission";
import { getTask } from "@/api/school/task"; // 引入获取详情API
import { getUserProfile } from "@/api/system/user";

export default {
  name: "MyHomeworkList",
  data() {
    return {
      loading: true,
      submitLoading: false,
      detailLoading: false,
      showSearch: true,
      total: 0,
      homeworkList: [],

      open: false,
      title: "",

      viewOpen: false,
      viewForm: {},

      submissionOpen: false,
      submissionForm: {},

      filterSubject: null,
      subjectOptions: ['语文', '数学', '英语', '物理', '化学', '生物', '历史', '地理', '政治', '其他'],

      filterStatus: null,
      statusOptions: [
        { label: '已提交', value: 'submitted' },
        { label: '待提交', value: 'unsubmitted' },
        { label: '已截止', value: 'expired' }
      ],

      currentUserId: null,
      currentClassId: null, // 🔥 新增：当前用户班级ID

      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskTitle: null,
        studentId: null,
        params: {}
      },
      form: {},
      rules: {
        submitContent: [
          { required: true, message: "作业内容不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    this.getUserInfo();
  },
  methods: {
    getUserInfo() {
      getUserProfile().then(res => {
        this.currentUserId = res.data.userId;
        // 获取用户所在班级ID (deptId)
        this.currentClassId = res.data.deptId;

        this.queryParams.studentId = this.currentUserId;
        this.getList();
      });
    },

    getList() {
      this.loading = true;
      this.queryParams.params = {
        studentView: true,
        // 🔥 增加班级ID过滤，确保只看本班作业
        classId: this.currentClassId || undefined,
        subject: this.filterSubject,
        filterStatus: this.filterStatus
      };

      listMyHomework(this.queryParams).then(response => {
        this.homeworkList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    getSubject(title) {
      if (!title) return "其他";
      if (title.includes("语文")) return "语文";
      if (title.includes("数学")) return "数学";
      if (title.includes("英语")) return "英语";
      if (title.includes("物理")) return "物理";
      if (title.includes("化学")) return "化学";
      if (title.includes("生物")) return "生物";
      if (title.includes("历史")) return "历史";
      if (title.includes("地理")) return "地理";
      if (title.includes("政治")) return "政治";
      return "其他";
    },

    getSubjectType(subject) {
      const map = {
        '语文': 'danger', '数学': 'primary', '英语': 'success',
        '物理': 'warning', '化学': 'info', '生物': 'success'
      };
      return map[subject] || '';
    },

    // 查看作业详情
    handleView(row) {
      this.viewForm = { ...row }; // 先展示列表已有的信息
      this.viewOpen = true;
      this.detailLoading = true;
      // 必须请求详情以获取 content
      getTask(row.taskId).then(res => {
         // 合并详情，保留 row 中的 submissionId 等状态
         this.viewForm = { ...this.viewForm, ...res.data };
         this.detailLoading = false;
      });
    },

    // 查看我的提交
    handleViewSubmission(row) {
       this.submissionForm = { ...row };
       this.submissionOpen = true;
    },

    // 准备提交
    handleSubmit(row) {
      this.reset();
      this.form = {
        taskId: row.taskId,
        taskTitle: row.taskTitle,
        taskRequirement: null, // 先置空
        submitContent: '',
        submitFiles: null
      };
      this.open = true;
      this.title = "提交作业：" + row.taskTitle;
      this.detailLoading = true;

      // 获取作业要求内容
      getTask(row.taskId).then(res => {
         this.form.taskRequirement = res.data.taskContent;
         this.detailLoading = false;
      });
    },

    switchToSubmit() {
      this.viewOpen = false;
      // viewForm 中已经有 taskId 等信息
      this.handleSubmit(this.viewForm);
    },

    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          // 补充学生信息
          this.form.studentId = this.currentUserId;

          this.submitLoading = true;
          submitHomework(this.form).then(response => {
            this.$modal.msgSuccess("恭喜，作业提交成功！");
            this.open = false;
            this.submitLoading = false;
            this.getList(); // 刷新列表状态
          }).catch(() => {
            this.submitLoading = false;
          });
        }
      });
    },

    cancel() {
      this.open = false;
      this.reset();
    },

    reset() {
      this.form = {
        taskId: undefined,
        taskTitle: undefined,
        taskRequirement: undefined,
        submitContent: undefined,
        submitFiles: undefined
      };
      this.resetForm("form");
    },

    checkDeadlineStatus(time) {
        if (!time) return { isExpired: false, isUrgent: false };
        const now = new Date().getTime();
        const deadline = new Date(time).getTime();
        const diff = deadline - now;
        if (diff < 0) return { isExpired: true, isUrgent: false };
        if (diff < 86400000) return { isExpired: false, isUrgent: true };
        return { isExpired: false, isUrgent: false };
    },

    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.filterSubject = null;
      this.filterStatus = null;
      this.resetForm("queryForm");
      this.handleQuery();
    }
  }
};
</script>

<style lang="scss" scoped>
/* 保持你的原样式不变 */
.page-header-wrapper {
  background: #fff;
  padding: 15px 20px;
  border-bottom: 1px solid #e6ebf5;
  margin: -20px -20px 20px;
}
.box-card {
  border-radius: 8px;
  border: none;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.05);
}

.task-title-link {
  font-weight: 600;
  color: #409EFF;
  cursor: pointer;
  &:hover {
    text-decoration: underline;
  }
}

.deadline-text {
  display: block;
  font-size: 12px;
  color: #909399;
  margin-top: 5px;
  &.expired {
    color: #F56C6C;
    text-decoration: line-through;
  }
}

.dialog-title {
  font-size: 16px;
  font-weight: bold;
  color: #303133;
}

.task-requirement-box {
  background-color: #f4f4f5;
  border-left: 5px solid #909399;
  padding: 10px 15px;
  border-radius: 4px;
  margin-bottom: 15px;

  .box-title {
    font-weight: bold;
    color: #606266;
    margin-bottom: 5px;
  }
  .box-content {
    color: #606266;
    font-size: 14px;
    line-height: 1.6;
    max-height: 200px;
    overflow-y: auto;
  }
}

.html-content {
  line-height: 1.6;
  img {
    max-width: 100%;
  }
}
</style>
