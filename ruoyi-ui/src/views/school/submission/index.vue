<template>
  <div class="app-container">
    <el-card shadow="always" style="margin-bottom: 20px;">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px" style="margin-top: 10px;">
        <el-form-item label="科目" prop="params.subject">
          <el-select v-model="queryParams.params.subject" placeholder="请选择科目" clearable style="width: 140px">
            <el-option v-for="dict in subjectOptions" :key="dict" :label="dict" :value="dict" />
          </el-select>
        </el-form-item>
        <el-form-item label="班级" prop="params.deptId">
           <treeselect v-model="queryParams.params.deptId" :options="deptOptions" :show-count="true" :normalizer="normalizer" placeholder="请选择班级" style="width: 200px; display: inline-block; vertical-align: bottom; line-height: normal;" append-to-body />
        </el-form-item>
        <el-form-item label="学生姓名" prop="studentName">
          <el-input
            v-model="queryParams.studentName"
            placeholder="请输入学生姓名搜索"
            clearable
            prefix-icon="el-icon-user"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-row :gutter="20" style="margin-bottom: 20px;" v-if="submissionList && submissionList.length > 0">
      <el-col :span="6">
        <el-card shadow="hover" class="analysis-card">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-s-data"></i> 当前页概览</span>
          </div>
          <div class="analysis-item">
            <span class="label">已批改数：</span>
            <span class="value">{{ stats.gradedCount }} / {{ submissionList.length }}</span>
          </div>
          <div class="analysis-item">
            <span class="label">平均分：</span>
            <span class="value" :class="getScoreColor(stats.avgScore)">{{ stats.avgScore }}</span>
          </div>
          <div class="analysis-item">
            <span class="label">最高 / 最低：</span>
            <span class="value">{{ stats.maxScore }} / {{ stats.minScore }}</span>
          </div>
        </el-card>
      </el-col>

      <el-col :span="18">
        <el-card shadow="hover" class="analysis-card">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-pie-chart"></i> 分数段分布 (已批改)</span>
          </div>
          <el-row :gutter="20" type="flex" align="middle">
            <el-col :span="6">
              <div class="dist-label">优秀 (90-100)</div>
              <el-progress :percentage="stats.dist.excellent" status="success" :format="percentageFormat"></el-progress>
              <div class="count-tag">{{ stats.counts.excellent }}人</div>
            </el-col>
            <el-col :span="6">
              <div class="dist-label">良好 (80-89)</div>
              <el-progress :percentage="stats.dist.good" :color="customColors.good" :format="percentageFormat"></el-progress>
              <div class="count-tag">{{ stats.counts.good }}人</div>
            </el-col>
            <el-col :span="6">
              <div class="dist-label">及格 (60-79)</div>
              <el-progress :percentage="stats.dist.pass" :color="customColors.pass" :format="percentageFormat"></el-progress>
              <div class="count-tag">{{ stats.counts.pass }}人</div>
            </el-col>
            <el-col :span="6">
              <div class="dist-label">不及格 (&lt;60)</div>
              <el-progress :percentage="stats.dist.fail" status="exception" :format="percentageFormat"></el-progress>
              <div class="count-tag">{{ stats.counts.fail }}人</div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="submissionList" border stripe highlight-current-row>
      <el-table-column label="ID" align="center" prop="submissionId" width="80" />

      <el-table-column label="作业标题" align="center" prop="taskTitle" min-width="120">
        <template slot-scope="scope">
          <el-tag type="info" effect="plain"><i class="el-icon-collection-tag"></i> {{ scope.row.taskTitle }}</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="学生姓名" align="center" prop="studentName" min-width="120">
        <template slot-scope="scope">
          <span style="font-weight: bold;">{{ scope.row.studentName }}</span>
        </template>
      </el-table-column>

      <el-table-column label="提交时间" align="center" prop="submitTime" width="180">
        <template slot-scope="scope">
          <i class="el-icon-time"></i> {{ parseTime(scope.row.submitTime, '{y}-{m}-{d} {h}:{i}:{s}') }}
        </template>
      </el-table-column>

      <el-table-column label="分数" align="center" prop="score" width="120">
        <template slot-scope="scope">
          <span v-if="scope.row.score >= 60" style="color: #67C23A; font-weight: bold; font-size: 16px;">{{ scope.row.score }}</span>
          <span v-else-if="scope.row.score != null" style="color: #F56C6C; font-weight: bold; font-size: 16px;">{{ scope.row.score }}</span>
          <el-tag v-else type="info" size="mini">未评分</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="状态" align="center" prop="status" width="120">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status == '0'" type="info">未提交</el-tag>
          <el-tag type="warning" v-else-if="scope.row.status == '1'" effect="dark">已提交</el-tag>
          <el-tag type="success" v-else-if="scope.row.status == '2'" effect="dark">已批改</el-tag>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit-outline"
            v-if="scope.row.status != '0'"
            @click="handleGrade(scope.row)"
            v-hasPermi="['school:submission:edit']"
          >批改/详情</el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            class="text-danger"
            @click="handleDelete(scope.row)"
            v-hasPermi="['school:submission:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <el-dialog title="作业详情与批改" :visible.sync="gradeOpen" width="900px" append-to-body top="5vh" :close-on-click-modal="false">
      <el-form ref="gradeForm" :model="gradeForm" label-width="80px">

        <el-card shadow="never" class="student-work-card">
          <div slot="header" class="clearfix">
            <span><i class="el-icon-user"></i> <b>{{ gradeForm.studentName }}</b> 的作业</span>
            <el-tag size="small" style="float: right;">ID: {{ gradeForm.submissionId }}</el-tag>
          </div>

          <div class="answer-content">
            <div v-if="gradeForm.submitContent" v-html="gradeForm.submitContent"></div>
            <div v-else style="color: #909399; text-align: center; padding: 20px;">该学生未填写文字内容</div>
          </div>

          <div v-if="gradeForm.submitFiles" style="margin-top: 15px; padding-top: 10px; border-top: 1px dashed #eee;">
            <span style="font-size: 13px; color: #606266;">附件：</span>
            <el-link :href="gradeForm.submitFiles" target="_blank" type="primary" icon="el-icon-download" style="font-weight: bold;">
              点击下载附件查看
            </el-link>
          </div>
        </el-card>

        <div class="grading-divider">
          <span><i class="el-icon-edit"></i> 老师评分区</span>
        </div>

        <div class="grading-area">
          <el-row :gutter="20">
            <el-col :span="12">
              <el-form-item label="得分" style="margin-bottom: 0;">
                <el-input-number v-model="gradeForm.score" :min="0" :max="100" size="medium" style="width: 100%;"></el-input-number>
              </el-form-item>
            </el-col>
            <el-col :span="12" style="line-height: 36px; color: #909399; font-size: 13px;">
              <i class="el-icon-info"></i> 请根据作业完成情况打分 (0-100)
            </el-col>
          </el-row>

          <el-form-item label="评语" style="margin-top: 20px;">
            <el-input
              type="textarea"
              v-model="gradeForm.teacherComment"
              placeholder="请输入对作业的评语，鼓励或指出不足..."
              :rows="3"
              show-word-limit
              maxlength="200"
            ></el-input>
          </el-form-item>
        </div>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitGrade" icon="el-icon-check" :loading="submitLoading">提交评分</el-button>
        <el-button @click="gradeOpen = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
// 【重要】引入了 delSubmission 和 gradeSubmission
import { listSubmission, getSubmission, gradeSubmission, delSubmission } from "@/api/school/submission";
import { listDept } from "@/api/system/dept";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Submission",
  components: { Treeselect },
  data() {
    return {
      loading: true,
      submitLoading: false,
      showSearch: true,
      total: 0,
      submissionList: [],
      deptOptions: [],
      subjectOptions: ['语文', '数学', '英语', '物理', '化学', '生物', '政治', '历史', '地理', '体育', '音乐', '美术', '信息技术', '通用技术'],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        taskId: null, // 🔥 新增：任务ID筛选
        studentName: null,
        params: {
            subject: null,
            deptId: null
        }
      },
      // 自定义进度条颜色
      customColors: {
        good: '#409EFF',
        pass: '#E6A23C'
      },

      // === 批改相关 ===
      gradeOpen: false,
      gradeForm: {}
    };
  },
  // === 计算属性：用于实时计算统计数据 ===
  computed: {
    stats() {
      const list = this.submissionList || [];
      // 筛选出已评分的作业 (状态为'2'且分数不为空)
      const gradedList = list.filter(item => item.status === '2' && item.score != null);
      const total = gradedList.length;

      if (total === 0) {
        return {
          gradedCount: 0, avgScore: '-', maxScore: '-', minScore: '-',
          dist: { excellent: 0, good: 0, pass: 0, fail: 0 },
          counts: { excellent: 0, good: 0, pass: 0, fail: 0 }
        };
      }

      // 计算基础数据
      const scores = gradedList.map(item => Number(item.score));
      const sum = scores.reduce((a, b) => a + b, 0);
      const max = Math.max(...scores);
      const min = Math.min(...scores);
      const avg = (sum / total).toFixed(1);

      // 计算分布人数
      let counts = { excellent: 0, good: 0, pass: 0, fail: 0 };
      scores.forEach(score => {
        if (score >= 90) counts.excellent++;
        else if (score >= 80) counts.good++;
        else if (score >= 60) counts.pass++;
        else counts.fail++;
      });

      // 计算百分比 (用于进度条)
      const dist = {
        excellent: parseFloat(((counts.excellent / total) * 100).toFixed(1)),
        good: parseFloat(((counts.good / total) * 100).toFixed(1)),
        pass: parseFloat(((counts.pass / total) * 100).toFixed(1)),
        fail: parseFloat(((counts.fail / total) * 100).toFixed(1))
      };

      return {
        gradedCount: total,
        avgScore: avg,
        maxScore: max,
        minScore: min,
        counts,
        dist
      };
    }
  },
  created() {
    // 🔥 接收路由参数
    if (this.$route.query.taskId) {
      this.queryParams.taskId = this.$route.query.taskId;
    }
    if (this.$route.query['params[subject]']) {
      this.queryParams.params.subject = this.$route.query['params[subject]'];
    }

    this.getList();
    this.getDeptTree();
  },
  methods: {
    getDeptTree() {
      listDept().then(response => {
        this.deptOptions = this.handleTree(response.data, "deptId");
      });
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
    getList() {
      this.loading = true;
      listSubmission(this.queryParams).then(response => {
        this.submissionList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },

    // === 辅助方法：进度条格式化 ===
    percentageFormat(percentage) {
      return percentage > 0 ? `${percentage}%` : '';
    },
    // === 辅助方法：分数颜色 ===
    getScoreColor(score) {
      if (score === '-') return '';
      const s = Number(score);
      if (s >= 85) return 'text-success';
      if (s < 60) return 'text-danger';
      return 'text-primary';
    },

    // ================= 批改逻辑 =================
    // handleGrade(row) {
    //   this.gradeForm = {
    //     submissionId: row.submissionId,
    //     studentName: row.studentName,
    //     submitContent: row.submitContent,
    //     submitFiles: row.submitFiles,
    //     // 如果已经有分显示原分，如果没有分显示80分建议分
    //     score: row.score !== null ? row.score : 80,
    //     teacherComment: row.teacherComment
    //   };
    //   this.gradeOpen = true;
    // },
    // ================= 批改逻辑 (修复版) =================
    handleGrade(row) {
      const id = row.submissionId || row.id;
      // 1. 先重置表单，防止显示上一个人的数据
      this.gradeForm = {};

      // 2. 调用详情接口，去后台查最新的完整内容
      getSubmission(id).then(response => {
        const data = response.data;

        // 3. 将查回来的详细数据填入表单
        this.gradeForm = {
          submissionId: data.submissionId,
          studentName: data.studentName,
          submitContent: data.submitContent, // 这里现在肯定有值了！
          submitFiles: data.submitFiles,
          // 如果还没有分，默认给 80 分
          score: data.score != null ? data.score : 80,
          teacherComment: data.teacherComment
        };

        // 4. 打开弹窗
        this.gradeOpen = true;
      });
    },

    submitGrade() {
      this.submitLoading = true;
      const data = {
        submissionId: this.gradeForm.submissionId,
        score: this.gradeForm.score,
        teacherComment: this.gradeForm.teacherComment,
        status: '2' // 标记为已批改
      };
      gradeSubmission(data).then(res => {
        this.$modal.msgSuccess("批改完成！");
        this.gradeOpen = false;
        this.getList();
      }).finally(() => {
        this.submitLoading = false;
      });
    },

    // ================= 删除逻辑 (新增) =================
    handleDelete(row) {
      const submissionIds = row.submissionId;
      this.$modal.confirm('是否确认删除该条作业提交记录？').then(function() {
        return delSubmission(submissionIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    }
  }
};
</script>

<style scoped>
/* 学生作业卡片样式 */
.student-work-card {
  background-color: #fafafa;
  border: 1px solid #ebeef5;
}

/* 答案内容区域样式 */
.answer-content {
  background: #fff;
  padding: 15px;
  border-radius: 4px;
  border: 1px dashed #dcdfe6;
  min-height: 80px;
  max-height: 300px;
  overflow-y: auto;
  line-height: 1.6;
  color: #303133;
}
.answer-content img {
  max-width: 100%; /* 防止图片撑破容器 */
}

/* 自定义分割标题 */
.grading-divider {
  display: flex;
  align-items: center;
  margin: 20px 0 15px 0;
  color: #409EFF;
  font-weight: bold;
  font-size: 15px;
}
.grading-divider::before,
.grading-divider::after {
  content: '';
  flex: 1;
  height: 1px;
  background: #dcdfe6;
}
.grading-divider span {
  padding: 0 15px;
  background: #fff; /* 遮挡线条 */
}

/* 评分区域背景 */
.grading-area {
  background-color: #f0f9eb; /* 淡淡的绿色背景，代表评分区 */
  padding: 20px;
  border-radius: 4px;
  border: 1px solid #e1f3d8;
}

/* === 新增：统计面板样式 === */
.analysis-card {
  height: 140px; /* 固定高度保持对齐 */
}
.analysis-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  font-size: 14px;
  color: #606266;
}
.analysis-item .value {
  font-weight: bold;
  font-size: 16px;
}
.text-success { color: #67C23A; }
.text-danger { color: #F56C6C; }
.text-primary { color: #409EFF; }

.dist-label {
  font-size: 12px;
  color: #909399;
  margin-bottom: 5px;
  text-align: center;
}
.count-tag {
  text-align: center;
  font-size: 12px;
  margin-top: 5px;
  color: #303133;
  font-weight: bold;
}
/* 覆盖危险按钮样式 */
.text-danger {
    color: #F56C6C;
}
</style>
