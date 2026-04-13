<template>
    <div class="app-container">
      <el-page-header @back="$router.go(-1)" content="作业提交" style="margin-bottom: 20px;"></el-page-header>
      
      <el-row :gutter="20">
        <el-col :span="24" :lg="16">
          <el-card v-loading="loading" shadow="never" style="min-height: 500px;">
            <div slot="header" class="clearfix">
              <span style="font-size: 18px; font-weight: bold;">
                <i class="el-icon-reading"></i> {{ form.taskName }}
              </span>
              <el-tag size="medium" effect="dark" style="margin-left: 10px; vertical-align: middle;">
                {{ form.subject }}
              </el-tag>
              
              <div style="float: right;">
                <el-tag type="danger" v-if="isOverdue" effect="plain"><i class="el-icon-warning"></i> 已截止</el-tag>
                <el-tag type="success" v-else effect="plain"><i class="el-icon-time"></i> 进行中</el-tag>
              </div>
            </div>
  
            <el-form ref="form" :model="form" :rules="rules" label-width="90px" label-position="top">
              <el-alert
                v-if="form.deadlineTime"
                :title="'截止时间：' + parseTime(form.deadlineTime)"
                type="warning"
                :closable="false"
                show-icon
                style="margin-bottom: 20px;">
              </el-alert>
  
              <el-form-item label="作业要求">
                <div class="homework-desc">
                   {{ form.remark || '（老师未填写具体描述，请根据标题要求完成）' }}
                </div>
              </el-form-item>
  
              <el-divider></el-divider>
  
              <el-form-item label="我的答案" prop="content">
                <el-input 
                  type="textarea" 
                  v-model="form.content" 
                  :rows="10" 
                  placeholder="在此处输入您的答案..." 
                  maxlength="2000"
                  show-word-limit
                />
              </el-form-item>
  
              <el-form-item style="text-align: right; margin-top: 30px;">
                <el-button @click="$router.go(-1)">取 消</el-button>
                <el-button type="primary" icon="el-icon-upload" @click="handleSubmit" :disabled="isOverdue">
                  {{ isOverdue ? '已截止' : '确认提交' }}
                </el-button>
              </el-form-item>
            </el-form>
          </el-card>
        </el-col>
  
        <el-col :span="24" :lg="8" class="hidden-md-and-down">
          <el-card shadow="hover">
            <div slot="header"><span><i class="el-icon-info"></i> 提交状态</span></div>
            <div style="line-height: 2; color: #666; font-size: 14px;">
              <p>当前状态：
                 <el-tag v-if="form.status=='0'" type="info">未提交</el-tag>
                 <el-tag v-else type="success">已提交</el-tag>
              </p>
              <p v-if="form.submitTime">提交时间：{{ parseTime(form.submitTime) }}</p>
              <el-divider></el-divider>
              <p style="color: #909399"><i class="el-icon-info"></i> 提示：请在截止日期前提交，提交后老师将进行批改。</p>
            </div>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </template>
  
  <script>
  // 🔥 引入刚才定义好的新接口
  import { getSubmission, submitHomework } from "@/api/school/submission";
  
  export default {
    name: "HomeworkSubmit",
    data() {
      return {
        loading: true,
        form: {
          submissionId: null,
          taskName: '',
          subject: '',
          content: '',
          deadlineTime: null,
          status: '0',
          remark: ''
        },
        rules: {
          content: [{ required: true, message: "答案不能为空", trigger: "blur" }]
        }
      };
    },
    computed: {
      isOverdue() {
        if (!this.form.deadlineTime) return false;
        return new Date() > new Date(this.form.deadlineTime);
      }
    },
    created() {
      const id = this.$route.params.id;
      if(id) {
        this.getDetail(id);
      }
    },
    methods: {
      // 获取详情
      getDetail(id) {
        this.loading = true;
        getSubmission(id).then(response => {
          this.form = response.data;
          this.loading = false;
        }).catch(() => {
          this.loading = false;
        });
      },
      // 提交作业
      handleSubmit() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            this.$confirm('确认提交这份作业吗？', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                const data = {
                  submissionId: this.form.submissionId,
                  content: this.form.content,
                  status: '1', // 标记为已提交
                  submitTime: new Date()
                };
                submitHomework(data).then(() => {
                  this.$modal.msgSuccess("提交成功！");
                  this.$router.push('/index'); // 返回首页
                });
            });
          }
        });
      }
    }
  };
  </script>
  
  <style scoped>
  .homework-desc {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 4px;
    color: #606266;
    min-height: 60px;
    line-height: 1.6;
    border: 1px dashed #dcdfe6;
  }
  </style>