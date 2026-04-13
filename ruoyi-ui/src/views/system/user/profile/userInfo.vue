<!-- <template>
  <el-form ref="form" :model="form" :rules="rules" label-width="80px">
    <el-form-item label="用户昵称" prop="nickName">
      <el-input v-model="form.nickName" maxlength="30" />
    </el-form-item>
    <el-form-item label="手机号码" prop="phonenumber">
      <el-input v-model="form.phonenumber" maxlength="11" />
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model="form.email" maxlength="50" />
    </el-form-item>
    <el-form-item label="性别">
      <el-radio-group v-model="form.sex">
        <el-radio label="0">男</el-radio>
        <el-radio label="1">女</el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" size="mini" @click="submit">保存</el-button>
      <el-button type="danger" size="mini" @click="close">关闭</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { updateUserProfile } from "@/api/system/user"

export default {
  props: {
    user: {
      type: Object
    }
  },
  data() {
    return {
      form: {},
      // 表单校验
      rules: {
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        email: [
          { required: true, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          { required: true, message: "手机号码不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      }
    }
  },
  watch: {
    user: {
      handler(user) {
        if (user) {
          this.form = { nickName: user.nickName, studentCode: user.studentCode, phonenumber: user.phonenumber, email: user.email, sex: user.sex }
        }
      },
      immediate: true
    }
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateUserProfile(this.form).then(response => {
            this.$modal.msgSuccess("修改成功")
            this.user.phonenumber = this.form.phonenumber
            this.user.email = this.form.email
          })
        }
      })
    },
    close() {
      this.$tab.closePage()
    }
  }
}
</script> -->

<template>
  <div class="profile-user-info">
    <div class="form-header">
      <i class="el-icon-edit-outline"></i> 编辑基本资料
    </div>

    <el-form ref="form" :model="form" :rules="rules" label-width="100px" class="elegant-form">

      <el-form-item label="用户昵称" prop="nickName">
        <el-input
          v-model="form.nickName"
          maxlength="30"
          placeholder="请输入您的昵称"
          prefix-icon="el-icon-user-solid"
          clearable
        />
        <div class="form-tip">将在系统中显示的名称</div>
      </el-form-item>

      <el-form-item label="学号" prop="studentCode">
        <el-input
          v-model="form.studentCode"
          maxlength="20"
          placeholder="请输入您的学号"
          prefix-icon="el-icon-collection-tag"
          clearable
        />
      </el-form-item>

      <el-form-item label="手机号码" prop="phonenumber">
        <el-input
          v-model="form.phonenumber"
          maxlength="11"
          placeholder="请输入11位手机号码"
          prefix-icon="el-icon-mobile-phone"
          clearable
        />
      </el-form-item>

      <el-form-item label="电子邮箱" prop="email">
        <el-input
          v-model="form.email"
          maxlength="50"
          placeholder="请输入您的邮箱地址"
          prefix-icon="el-icon-message"
          clearable
        />
      </el-form-item>

      <el-form-item label="性别">
        <el-radio-group v-model="form.sex">
          <el-radio border label="0">
            <i class="el-icon-male" style="color: #409EFF; margin-right: 4px;"></i>男
          </el-radio>
          <el-radio border label="1">
            <i class="el-icon-female" style="color: #F56C6C; margin-right: 4px;"></i>女
          </el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item class="form-footer">
        <el-button type="primary" size="small" icon="el-icon-check" :loading="loading" @click="submit">保存修改</el-button>
        <el-button type="info" size="small" icon="el-icon-close" plain @click="close">关闭</el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
import { updateUserProfile } from "@/api/system/user"

export default {
  props: {
    user: {
      type: Object
    }
  },
  data() {
    return {
      form: {},
      loading: false, // 增加loading状态，防止重复提交
      // 表单校验
      rules: {
        nickName: [
          { required: true, message: "用户昵称不能为空", trigger: "blur" }
        ],
        email: [
          { required: true, message: "邮箱地址不能为空", trigger: "blur" },
          {
            type: "email",
            message: "请输入正确的邮箱地址",
            trigger: ["blur", "change"]
          }
        ],
        phonenumber: [
          { required: true, message: "手机号码不能为空", trigger: "blur" },
          {
            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
            message: "请输入正确的手机号码",
            trigger: "blur"
          }
        ]
      }
    }
  },
  watch: {
    user: {
      handler(user) {
        if (user) {
          this.form = { nickName: user.nickName, phonenumber: user.phonenumber, email: user.email, sex: user.sex }
        }
      },
      immediate: true
    }
  },
  methods: {
    submit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.loading = true; // 开启加载
          updateUserProfile(this.form).then(response => {
            this.loading = false;
            this.$modal.msgSuccess("个人资料修改成功");
            this.user.phonenumber = this.form.phonenumber;
            this.user.email = this.form.email;
            this.user.studentCode = this.form.studentCode;
          }).catch(() => {
            this.loading = false;
          });
        }
      })
    },
    close() {
      this.$tab.closePage()
    }
  }
}
</script>

<style scoped lang="scss">
.profile-user-info {
  padding: 10px 20px;
}

.form-header {
  font-size: 16px;
  font-weight: 600;
  color: #303133;
  margin-bottom: 25px;
  padding-bottom: 10px;
  border-bottom: 1px solid #ebeef5;

  i {
    margin-right: 8px;
    color: #409EFF;
  }
}

.elegant-form {
  max-width: 500px; /* 黄金比例宽度，防止输入框过长 */
  margin-left: 0;   /* 左对齐或 auto 居中，这里选择左对齐更符合阅读流 */
}

/* 优化输入框高度和阴影，增加现代感 */
::v-deep .el-input__inner {
  height: 38px;
  line-height: 38px;
}

/* 辅助提示文字样式 */
.form-tip {
  font-size: 12px;
  color: #909399;
  line-height: 20px;
  margin-top: 4px;
}

/* 按钮区域样式 */
.form-footer {
  margin-top: 30px;

  .el-button {
    padding: 9px 20px;
  }

  .el-button + .el-button {
    margin-left: 15px;
  }
}
</style>
