<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="视频标题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入视频标题"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item label="所属班级" prop="classId">
        <treeselect
          v-model="queryParams.classId"
          :options="classOptions"
          :normalizer="normalizer"
          placeholder="请选择班级"
          style="width: 240px"
        />
      </el-form-item>

      <el-form-item label="科目" prop="subject">
        <el-select v-model="queryParams.subject" placeholder="请选择科目" clearable size="small">
          <el-option
            v-for="item in subjectOptions"
            :key="item"
            :label="item"
            :value="item"
          />
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd" v-hasPermi="['school:video:add']">新增视频</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate" v-hasPermi="['school:video:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete" v-hasPermi="['school:video:remove']">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="videoList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" width="50" />

      <el-table-column label="视频封面" align="center" prop="coverUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.coverUrl" :width="50" :height="50"/>
        </template>
      </el-table-column>

      <el-table-column label="视频标题" align="center" prop="title" show-overflow-tooltip />

      <el-table-column label="科目" align="center" prop="subject" width="100">
         <template slot-scope="scope">
           <el-tag v-if="scope.row.subject">{{ scope.row.subject }}</el-tag>
           <span v-else>-</span>
         </template>
      </el-table-column>

      <el-table-column label="视频预览" align="center" width="120">
        <template slot-scope="scope">
          <el-button
            v-if="scope.row.videoUrl"
            size="mini"
            type="primary"
            plain
            icon="el-icon-video-play"
            @click.stop="handlePlay(scope.row)"
          >点击播放</el-button>
          <span v-else style="color: #999;">无资源</span>
        </template>
      </el-table-column>

      <el-table-column label="所属班级" align="center" prop="classId">
          <template slot-scope="scope">
             {{ classNameFormat(scope.row.classId) }}
          </template>
      </el-table-column>

      <el-table-column label="简介" align="center" prop="description" show-overflow-tooltip />
      <el-table-column label="创建时间" align="center" prop="createTime" width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>

      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)" v-hasPermi="['school:video:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)" v-hasPermi="['school:video:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList"/>

    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="视频标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入视频标题" />
        </el-form-item>
        <el-form-item label="科目" prop="subject">
          <el-select v-model="form.subject" placeholder="请选择科目" style="width: 100%">
             <el-option
                v-for="item in subjectOptions"
                :key="item"
                :label="item"
                :value="item"
              />
          </el-select>
        </el-form-item>
        <el-form-item label="所属班级" prop="classId">
          <treeselect v-model="form.classId" :options="classOptions" :normalizer="normalizer" :show-count="true" placeholder="请选择归属班级" />
        </el-form-item>
        <el-form-item label="视频封面" prop="coverUrl">
          <image-upload v-model="form.coverUrl" :limit="1"/>
        </el-form-item>
        <el-form-item label="上传视频" prop="videoUrl">
          <file-upload v-model="form.videoUrl" :limit="1" :fileType="['mp4', 'mov', 'avi', 'mkv']" :fileSize="500" tip="只能上传mp4/mov等视频文件，且不超过500M"/>
        </el-form-item>
        <el-form-item label="视频简介" prop="description">
          <el-input v-model="form.description" type="textarea" :rows="3" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog
      :title="playerTitle"
      :visible.sync="playerOpen"
      width="800px"
      append-to-body
      @close="closePlayer"
      destroy-on-close
      center
    >
      <div v-if="playerOpen" style="text-align: center; background: #000; min-height: 400px; display: flex; align-items: center; justify-content: center;">
        <video
          :key="playerUrl"
          :src="playerUrl"
          controls
          autoplay
          style="width: 100%; max-height: 500px; outline: none;"
          @error="handleVideoError"
        >
          您的浏览器不支持 Video 标签，或者视频无法加载。
        </video>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listVideo, getVideo, delVideo, addVideo, updateVideo } from "@/api/school/video"
import { listDept } from "@/api/system/dept";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Video",
  components: { Treeselect },
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      videoList: [],
      classOptions: [],
      flatClassOptions: [],
      subjectOptions: ['语文', '数学', '英语', '物理', '化学', '生物', '历史', '地理', '政治', '其他'],
      title: "",
      open: false,

      // 播放器相关
      playerOpen: false,
      playerUrl: "",
      playerTitle: "",

      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        classId: null,
        subject: null
      },
      form: {},
      rules: {
        title: [{ required: true, message: "视频标题不能为空", trigger: "blur" }],
        videoUrl: [{ required: true, message: "请上传视频文件", trigger: "change" }],
        classId: [{ required: true, message: "所属班级不能为空", trigger: "change" }]
      }
    }
  },
  created() {
    this.getList();
    this.getDeptList();
  },
  methods: {
    getList() {
      this.loading = true
      listVideo(this.queryParams).then(response => {
        this.videoList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    getDeptList() {
      listDept().then(response => {
        this.flatClassOptions = response.data;
        this.classOptions = this.handleTree(response.data, "deptId");
      });
    },
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return { id: node.deptId, label: node.deptName, children: node.children };
    },
    classNameFormat(classId) {
        if (!classId) return "";
        const found = this.flatClassOptions.find(item => item.deptId === classId);
        return found ? found.deptName : classId;
    },
    cancel() {
      this.open = false
      this.reset()
    },
    reset() {
      this.form = { id: null, title: null, videoUrl: null, coverUrl: null, description: null, classId: null, subject: null }
      this.resetForm("form")
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.resetForm("queryForm")
      this.queryParams.classId = null;
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加班级视频"
    },
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getVideo(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改班级视频"
      })
    },

    // 🔥 修复视频链接的方法
    handlePlay(row) {
      let url = row.videoUrl;
      // 如果不是http开头，说明是相对路径，需要加上 VUE_APP_BASE_API
      if (url && !url.startsWith("http") && !url.startsWith("//")) {
         // 这里会自动把 /profile/... 补全为 http://localhost:8080/dev-api/profile/...
         // 让浏览器能够正确请求到后端
         url = process.env.VUE_APP_BASE_API + url;
      }
      console.log("播放地址:", url); // 在控制台打印出来检查

      this.playerUrl = url;
      this.playerTitle = "正在播放：" + row.title;
      this.playerOpen = true;
    },

    closePlayer() {
      this.playerOpen = false;
      this.playerUrl = "";
    },
    handleVideoError() {
      this.$message.error("视频加载失败，请检查网络或后端权限配置");
    },

    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateVideo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功"); this.open = false; this.getList();
            })
          } else {
            addVideo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功"); this.open = false; this.getList();
            })
          }
        }
      })
    },
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除？').then(() => { return delVideo(ids) }).then(() => {
        this.getList(); this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    handleExport() {
      this.download('school/video/export', { ...this.queryParams }, `video_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
