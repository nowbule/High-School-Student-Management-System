<template>
  <div class="app-container">
    <el-card class="box-card search-card" shadow="hover">
      <div slot="header" class="clearfix">
        <span><i class="el-icon-search"></i> 筛选查询</span>
      </div>
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-form-item label="公告标题" prop="noticeTitle">
          <el-input
            v-model="queryParams.noticeTitle"
            placeholder="请输入公告标题"
            clearable
            prefix-icon="el-icon-document"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="操作人员" prop="createBy">
          <el-input
            v-model="queryParams.createBy"
            placeholder="请输入操作人员"
            clearable
            prefix-icon="el-icon-user"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="类型" prop="noticeType">
          <el-select v-model="queryParams.noticeType" placeholder="公告类型" clearable>
            <el-option
              v-for="dict in dict.type.sys_notice_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item style="float: right;">
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card class="box-card table-card" shadow="hover">
      <el-row :gutter="10" class="mb8">
        <el-col :span="1.5">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
            v-hasPermi="['system:notice:add']"
          >新增公告</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="success"
            plain
            icon="el-icon-edit"
            size="mini"
            :disabled="single"
            @click="handleUpdate"
            v-hasPermi="['system:notice:edit']"
          >修改</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            :disabled="multiple"
            @click="handleDelete"
            v-hasPermi="['system:notice:remove']"
          >批量删除</el-button>
        </el-col>
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
      </el-row>

      <el-table
        v-loading="loading"
        :data="noticeList"
        @selection-change="handleSelectionChange"
        border
        stripe
        :header-cell-style="{background:'#f8f8f9', color:'#515a6e'}"
      >
        <el-table-column type="selection" width="55" align="center" />
        <el-table-column label="序号" align="center" prop="noticeId" width="80" />

        <el-table-column
          label="公告标题"
          align="left"
          prop="noticeTitle"
          :show-overflow-tooltip="true"
          min-width="200"
        >
          <template slot-scope="scope">
             <span class="link-type" @click="handleView(scope.row)">
                {{ scope.row.noticeTitle }}
             </span>
          </template>
        </el-table-column>

        <el-table-column label="公告类型" align="center" prop="noticeType" width="120">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_notice_type" :value="scope.row.noticeType"/>
          </template>
        </el-table-column>
        <el-table-column label="状态" align="center" prop="status" width="100">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_notice_status" :value="scope.row.status"/>
          </template>
        </el-table-column>
        <el-table-column label="创建者" align="center" prop="createBy" width="120">
           <template slot-scope="scope">
             <el-tag size="mini" type="info" effect="plain"><i class="el-icon-user"></i> {{ scope.row.createBy }}</el-tag>
           </template>
        </el-table-column>
        <el-table-column label="创建时间" align="center" prop="createTime" width="160">
          <template slot-scope="scope">
            <span><i class="el-icon-time" style="margin-right: 5px"></i>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
          </template>
        </el-table-column>

        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" fixed="right" width="200">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-view"
              @click="handleView(scope.row)"
            >查看</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="handleUpdate(scope.row)"
              v-hasPermi="['system:notice:edit']"
            >修改</el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              class="text-danger"
              @click="handleDelete(scope.row)"
              v-hasPermi="['system:notice:remove']"
              style="color: #F56C6C;"
            >删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination-container">
        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </div>
    </el-card>

    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body :close-on-click-modal="false" custom-class="notice-dialog">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="公告标题" prop="noticeTitle">
              <el-input v-model="form.noticeTitle" placeholder="请输入公告标题" prefix-icon="el-icon-edit-outline" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="公告类型" prop="noticeType">
              <el-select v-model="form.noticeType" placeholder="请选择公告类型" style="width: 100%">
                <el-option
                  v-for="dict in dict.type.sys_notice_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="目标班级" prop="classId">
              <treeselect v-model="form.classId" :options="deptOptions" :normalizer="normalizer" placeholder="请选择班级（空则全员可见）" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in dict.type.sys_notice_status"
                  :key="dict.value"
                  :label="dict.value"
                  border
                  size="small"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="内容">
              <div class="editor-wrapper">
                 <editor v-model="form.noticeContent" :min-height="192"/>
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
        <el-button type="primary" @click="submitForm" icon="el-icon-check">确 定</el-button>
      </div>
    </el-dialog>

    <el-dialog title="公告详情" :visible.sync="openView" width="800px" append-to-body custom-class="view-dialog">
        <div class="view-content">
            <h2 class="view-title">{{ viewForm.noticeTitle }}</h2>
            <div class="view-meta">
                <span><i class="el-icon-user"></i> {{ viewForm.createBy }}</span>
                <span><i class="el-icon-time"></i> {{ parseTime(viewForm.createTime) }}</span>
                <span><i class="el-icon-collection-tag"></i> <dict-tag :options="dict.type.sys_notice_type" :value="viewForm.noticeType" style="display:inline-block"/></span>
            </div>
            <el-divider></el-divider>
            <div class="view-body ql-editor" v-html="viewForm.noticeContent"></div>
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="openView = false">关 闭</el-button>
        </div>
    </el-dialog>
  </div>
</template>

<script>
import { listNotice, getNotice, delNotice, addNotice, updateNotice } from "@/api/system/notice"
import { listDept } from "@/api/system/dept"
import Treeselect from "@riophae/vue-treeselect"
import "@riophae/vue-treeselect/dist/vue-treeselect.css"
import { handleTree } from "@/utils/ruoyi"

export default {
  name: "Notice",
  components: { Treeselect },
  dicts: ['sys_notice_status', 'sys_notice_type'],
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      noticeList: [],
      title: "",
      open: false,
      deptOptions: [], // 部门树选项

      // 🔥 新增：控制查看弹窗的变量
      openView: false,
      viewForm: {}, // 专门存放查看详情的数据

      queryParams: {
        pageNum: 1,
        pageSize: 10,
        noticeTitle: undefined,
        createBy: undefined,
        status: undefined
      },
      form: {},
      rules: {
        noticeTitle: [
          { required: true, message: "公告标题不能为空", trigger: "blur" }
        ],
        noticeType: [
          { required: true, message: "公告类型不能为空", trigger: "change" }
        ]
      }
    }
  },
  created() {
    this.getList()
    this.getDeptTree()
  },
  methods: {
    /** 查询部门树结构 */
    getDeptTree() {
      listDept().then(response => {
        this.deptOptions = handleTree(response.data, "deptId");
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
      this.loading = true
      listNotice(this.queryParams).then(response => {
        this.noticeList = response.rows
        this.total = response.total
        this.loading = false
      })
    },

    // 🔥 新增：查看按钮操作
    handleView(row) {
        // 为了确保看到的是最新内容，建议这里也可以调一下 getNotice(row.noticeId)
        // 但通常列表里已经包含了内容，直接用 row 显示速度最快
        this.viewForm = row;
        this.openView = true;
    },

    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = {
        noticeId: undefined,
        noticeTitle: undefined,
        noticeType: undefined,
        noticeContent: undefined,
        status: "0",
        classId: undefined
      }
      this.resetForm("form")
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.noticeId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加公告"
    },
    handleUpdate(row) {
      this.reset()
      const noticeId = row.noticeId || this.ids
      getNotice(noticeId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改公告"
      })
    },
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.noticeId != undefined) {
            updateNotice(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addNotice(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    handleDelete(row) {
      const noticeIds = row.noticeId || this.ids
      this.$modal.confirm('是否确认删除公告编号为"' + noticeIds + '"的数据项？').then(function() {
        return delNotice(noticeIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    }
  }
}
</script>

<style scoped lang="scss">
.app-container {
  padding: 20px;
  background-color: #f0f2f5;
  min-height: 100vh;
}

.search-card {
  margin-bottom: 20px;
  ::v-deep .el-card__header {
    padding: 10px 20px;
    border-bottom: 1px solid #EBEEF5;
    font-size: 16px;
    font-weight: bold;
    color: #303133;
  }
}

.table-card {
  ::v-deep .el-card__body {
    padding: 20px;
  }
}

.mb8 {
  margin-bottom: 15px;
}

.pagination-container {
  margin-top: 20px;
  text-align: right;
}

.editor-wrapper {
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  overflow: hidden;
}

.el-table {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.05);
}

/* 标题链接样式 */
.link-type {
  color: #409EFF;
  cursor: pointer;
  font-weight: 500;
  &:hover {
    text-decoration: underline;
  }
}

/* 🔥 查看详情弹窗样式 */
.view-content {
  padding: 0 10px;
}
.view-title {
  text-align: center;
  color: #303133;
  margin-bottom: 15px;
  font-size: 24px;
}
.view-meta {
  text-align: center;
  color: #909399;
  font-size: 13px;
  margin-bottom: 10px;
  span {
    margin: 0 10px;
  }
}
.view-body {
  line-height: 1.8;
  color: #606266;
  min-height: 200px;
  /* 处理富文本中的图片溢出 */
  ::v-deep img {
    max-width: 100%;
    height: auto;
  }
}
</style>
