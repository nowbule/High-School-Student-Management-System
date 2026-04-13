<template>
    <div class="student-media-library">
      <div class="library-header">
        <div class="brand">
          <div class="logo-icon"><i class="el-icon-video-camera-solid"></i></div>
          <div class="brand-text">
            <h1>班级视频库</h1>
            <p>Class Video Library</p>
          </div>
        </div>
        <div class="header-right">
          <div class="stat-pill">
            <i class="el-icon-film"></i> 资源总数: <span>{{ total }}</span>
          </div>
          <el-button round size="small" icon="el-icon-s-home" @click="$router.push('/index')">返回首页</el-button>
        </div>
      </div>

      <div class="filter-bar-wrapper">
        <div class="filter-bar">
          <el-input
            v-model="queryParams.title"
            placeholder="搜索感兴趣的视频..."
            prefix-icon="el-icon-search"
            class="search-input"
            clearable
            @keyup.enter.native="handleQuery"
          ></el-input>
          <el-button type="primary" circle icon="el-icon-search" @click="handleQuery"></el-button>
          <el-button circle icon="el-icon-refresh" @click="resetQuery" title="重置"></el-button>
        </div>

        <!-- 新增：科目分类标签 -->
        <div class="subject-tabs">
          <div
            class="subject-item"
            :class="{ active: !queryParams.subject }"
            @click="handleSubjectChange('')"
          >全部</div>
          <div
            class="subject-item"
            v-for="sub in subjectOptions"
            :key="sub"
            :class="{ active: queryParams.subject === sub }"
            @click="handleSubjectChange(sub)"
          >{{ sub }}</div>
        </div>
      </div>

      <div class="video-content" v-loading="loading">
        <div v-if="videoList.length > 0" class="video-grid">
          <div
            class="video-card"
            v-for="(item, index) in videoList"
            :key="index"
            @click="playVideo(item)"
          >
            <div class="cover-wrapper">
              <el-image :src="item.coverUrl || defaultCover" fit="cover" class="cover-img" lazy>
                <div slot="error" class="image-slot"><i class="el-icon-picture-outline"></i></div>
              </el-image>

              <div class="badges-container">
                <div class="class-badge" v-if="item.classId">
                  {{ formatClassName(item.classId) }}
                </div>
                <div class="subject-badge" v-if="item.subject">
                  {{ item.subject }}
                </div>
              </div>

              <div class="play-overlay">
                <div class="play-btn-circle"><i class="el-icon-caret-right"></i></div>
              </div>
            </div>

            <div class="card-info">
              <h3 class="title" :title="item.title">{{ item.title }}</h3>
              <div class="meta-row">
                <span class="time"><i class="el-icon-date"></i> {{ parseTime(item.createTime, '{y}-{m}-{d}') }}</span>
              </div>
              <p class="desc">{{ item.description || '暂无简介...' }}</p>
            </div>
          </div>
        </div>

        <div v-else class="empty-state">
          <img src="https://gw.alipayobjects.com/zos/antfincdn/ZHrcdLPrvN/empty.svg" alt="empty" />
          <p>暂无视频资源，请联系老师上传</p>
        </div>

        <div class="pagination-center" v-show="total > 0">
          <el-pagination
            background
            layout="prev, pager, next"
            :total="total"
            :page-size="queryParams.pageSize"
            @current-change="handlePageChange"
          ></el-pagination>
        </div>
      </div>

      <el-dialog
        :visible.sync="playerOpen"
        width="900px"
        append-to-body
        destroy-on-close
        custom-class="cinema-dialog"
        :show-close="false"
        top="5vh"
      >
        <div class="cinema-container">
          <div class="cinema-header">
             <span class="video-name">{{ playerTitle }}</span>
             <div class="close-btn" @click="closePlayer"><i class="el-icon-close"></i></div>
          </div>
          <div class="video-stage">
            <video
              v-if="playerUrl"
              :key="playerUrl"
              :src="playerUrl"
              controls
              autoplay
              class="main-player"
              @error="handleVideoError"
              controlsList="nodownload"
            ></video>
          </div>
          <div class="cinema-info" v-if="currentDesc">
             <h4>视频简介</h4>
             <p>{{ currentDesc }}</p>
          </div>
        </div>
      </el-dialog>
    </div>
  </template>

  <script>
  import { listVideo } from "@/api/school/video";
  // 🔥 引入部门接口
  import { listDept } from "@/api/system/dept";

  export default {
    name: "StudentDrive",
    data() {
      return {
        loading: false,
        defaultCover: "https://cube.elemecdn.com/e/fd/0fc7d20532fdaf769a25683617711png.png",
        videoList: [],
        total: 0,

        // 存储班级ID和名称的映射 { 100: "石油中学", 101: "清北班" }
        classMap: {},

        subjectOptions: ['语文', '数学', '英语', '物理', '化学', '生物', '历史', '地理', '政治', '其他'],

        queryParams: {
          pageNum: 1,
          pageSize: 12,
          title: '',
          subject: ''
        },

        playerOpen: false,
        playerUrl: "",
        playerTitle: "",
        currentDesc: ""
      };
    },
    created() {
      this.getList();
      this.getClassList(); // 🔥 加载班级列表
    },
    methods: {
      getList() {
        this.loading = true;
        listVideo(this.queryParams).then(res => {
          this.videoList = res.rows.map(item => {
              if (item.coverUrl && !item.coverUrl.startsWith("http") && !item.coverUrl.startsWith("//")) {
                  item.coverUrl = process.env.VUE_APP_BASE_API + item.coverUrl;
              }
              if (item.videoUrl && !item.videoUrl.startsWith("http") && !item.videoUrl.startsWith("//")) {
                  item.videoUrl = process.env.VUE_APP_BASE_API + item.videoUrl;
              }
              return item;
          });
          this.total = res.total;
          this.loading = false;
        }).catch(() => {
          this.loading = false;
        });
      },

      // 🔥 获取所有部门/班级，并生成映射表
    getClassList() {
      listDept().then(response => {
        const map = {};
        if (response.data) {
          response.data.forEach(dept => {
             map[dept.deptId] = dept.deptName;
          });
        }
        this.classMap = map;
      }).catch(err => {
        console.error("获取班级列表失败，将显示原始ID:", err);
      });
    },

      // 🔥 翻译方法：把ID转成中文名
      formatClassName(classId) {
        // 如果 map 里有这个ID，就返回名字；否则返回 ID 本身
        return this.classMap[classId] || classId;
      },

      handleQuery() { this.queryParams.pageNum = 1; this.getList(); },
      resetQuery() {
        this.queryParams.title = '';
        this.queryParams.subject = '';
        this.handleQuery();
      },
      handleSubjectChange(sub) {
        this.queryParams.subject = sub;
        this.handleQuery();
      },
      handlePageChange(val) { this.queryParams.pageNum = val; this.getList(); },

      playVideo(item) {
        this.playerUrl = item.videoUrl;
        this.playerTitle = item.title;
        this.currentDesc = item.description;
        this.playerOpen = true;
      },

      closePlayer() {
        this.playerOpen = false;
        this.playerUrl = "";
      },
      handleVideoError(e) {
        console.warn("视频加载出现瞬间异常（通常可忽略）:", e);
      }
    }
  };
  </script>

  <style scoped lang="scss">
   /* ----- 核心布局与背景 ----- */
   .student-media-library {
     min-height: 100vh;
     background: #f5f7fa;
     padding-bottom: 40px;
     font-family: 'PingFang SC', 'Helvetica Neue', Helvetica, 'microsoft yahei', arial, STHeiTi, sans-serif;
   }

   /* ----- 1. 顶部 Header ----- */
   .library-header {
     height: 200px;
     background: linear-gradient(135deg, #2b32b2 0%, #1488cc 100%);
     display: flex;
     justify-content: space-between;
     align-items: flex-start;
     padding: 40px 10% 0;
     color: #fff;
     margin-bottom: -40px;

     .brand {
       display: flex;
       align-items: center;
       .logo-icon {
         font-size: 48px;
         margin-right: 15px;
         opacity: 0.9;
       }
       .brand-text {
         h1 { margin: 0; font-size: 28px; font-weight: 700; letter-spacing: 1px; }
         p { margin: 5px 0 0; font-size: 14px; opacity: 0.7; font-weight: 300; }
       }
     }

     .header-right {
       display: flex;
       align-items: center;
       gap: 15px;

       .stat-pill {
         background: rgba(255,255,255,0.2);
         padding: 6px 15px;
         border-radius: 20px;
         font-size: 13px;
         backdrop-filter: blur(5px);
         span { font-weight: bold; margin-left: 5px; font-size: 15px; }
       }
     }
   }

   /* ----- 2. 搜索条 ----- */
   .filter-bar-wrapper {
     padding: 0 10%;
     margin-bottom: 30px;
     position: relative;
     z-index: 10;
   }

   .filter-bar {
     background: #fff;
     padding: 15px 20px;
     border-radius: 12px;
     box-shadow: 0 10px 30px rgba(0,0,0,0.08);
     display: flex;
     align-items: center;
     gap: 10px;

     .search-input {
       flex: 1;
       ::v-deep .el-input__inner {
         border: none;
         background: #f7f8fa;
         border-radius: 8px;
         height: 44px;
         font-size: 15px;
         &:focus { background: #fff; box-shadow: 0 0 0 2px rgba(20, 136, 204, 0.2); }
       }
    }
  }

  .subject-tabs {
    margin-top: 20px;
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    justify-content: center;

    .subject-item {
      padding: 6px 16px;
      border-radius: 20px;
      background: #fff;
      color: #666;
      font-size: 14px;
      cursor: pointer;
      transition: all 0.3s;
      box-shadow: 0 2px 6px rgba(0,0,0,0.05);
      border: 1px solid #e8e8e8; /* 增加边框，防止背景色过浅导致不可见 */

      &:hover {
        color: #409EFF;
        transform: translateY(-2px);
      }

      &.active {
        background: #409EFF;
        color: #fff;
        font-weight: bold;
        box-shadow: 0 4px 10px rgba(64, 158, 255, 0.3);
      }
    }
  }

  /* ----- 3. 视频网格 ----- */
   .video-content {
     padding: 0 10%;
   }

   .video-grid {
     display: grid;
     grid-template-columns: repeat(4, 1fr);
     gap: 24px;

     @media (max-width: 1400px) { grid-template-columns: repeat(3, 1fr); }
     @media (max-width: 900px) { grid-template-columns: repeat(2, 1fr); }
     @media (max-width: 600px) { grid-template-columns: repeat(1, 1fr); }
   }

   .video-card {
     background: #fff;
     border-radius: 12px;
     overflow: hidden;
     transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
     box-shadow: 0 2px 8px rgba(0,0,0,0.04);
     cursor: pointer;
     position: relative;
     top: 0;

     &:hover {
       transform: translateY(-8px);
       box-shadow: 0 15px 30px rgba(0,0,0,0.1);

       .cover-img { transform: scale(1.08); }
       .play-overlay { opacity: 1; }
       .title { color: #1488cc; }
     }
   }

   .cover-wrapper {
     height: 180px;
     position: relative;
     overflow: hidden;
     background: #000;

     .cover-img {
      width: 100%;
      height: 100%;
      transition: transform 0.5s ease;
      opacity: 0.9;
    }

    .badges-container {
      position: absolute;
      top: 10px; left: 10px;
      display: flex;
      gap: 5px;
      z-index: 2;
    }

    .class-badge {
      background: rgba(0,0,0,0.6);
      color: #fff;
      font-size: 11px;
      padding: 3px 8px;
      border-radius: 4px;
      backdrop-filter: blur(4px);
    }

    .subject-badge {
      background: rgba(64, 158, 255, 0.8);
      color: #fff;
      font-size: 11px;
      padding: 3px 8px;
      border-radius: 4px;
      backdrop-filter: blur(4px);
    }

    .play-overlay {
       position: absolute;
       inset: 0;
       background: rgba(0,0,0,0.3);
       display: flex;
       justify-content: center;
       align-items: center;
       opacity: 0;
       transition: opacity 0.3s ease;
       z-index: 3;

       .play-btn-circle {
         width: 56px; height: 56px;
         border-radius: 50%;
         background: rgba(255,255,255,0.25);
         border: 1px solid rgba(255,255,255,0.5);
         backdrop-filter: blur(4px);
         display: flex; align-items: center; justify-content: center;
         i { color: #fff; font-size: 30px; margin-left: 4px; }
       }
     }
   }

   .card-info {
     padding: 16px;

     .title {
       font-size: 16px;
       font-weight: 600;
       color: #333;
       margin: 0 0 8px;
       white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
     }

     .meta-row {
       font-size: 12px;
       color: #999;
       margin-bottom: 10px;
       i { margin-right: 4px; }
     }

     .desc {
       font-size: 13px;
       color: #666;
       line-height: 1.5;
       display: -webkit-box;
       -webkit-line-clamp: 2;
       line-clamp: 2;
       -webkit-box-orient: vertical;
       overflow: hidden;
       height: 40px;
     }
   }

   .empty-state {
     text-align: center;
     padding: 80px 0;
     img { width: 240px; opacity: 0.8; margin-bottom: 20px; }
     p { color: #999; font-size: 15px; }
   }

   .pagination-center {
     margin-top: 40px;
     text-align: center;
   }

   /* ----- 4. 播放器样式 ----- */
   ::v-deep .cinema-dialog {
     background: transparent;
     box-shadow: none;
     .el-dialog__header { display: none; }
     .el-dialog__body { padding: 0; background: transparent; }
   }

   .cinema-container {
     background: #1a1a1a;
     border-radius: 12px;
     overflow: hidden;
     box-shadow: 0 20px 60px rgba(0,0,0,0.5);
     display: flex;
     flex-direction: column;
   }

   .cinema-header {
     height: 50px;
     background: #000;
     display: flex;
     justify-content: space-between;
     align-items: center;
     padding: 0 20px;
     color: #fff;
     border-bottom: 1px solid #333;

     .video-name { font-weight: 600; font-size: 16px; }
     .close-btn {
       cursor: pointer; opacity: 0.7; font-size: 20px;
       &:hover { opacity: 1; color: #f56c6c; }
     }
   }

   .video-stage {
     background: #000;
     width: 100%;
     display: flex;
     justify-content: center;

     .main-player {
       width: 100%;
       max-height: 70vh;
       outline: none;
     }
   }

   .cinema-info {
     padding: 20px;
     background: #252525;
     color: #ccc;
     h4 { color: #fff; margin: 0 0 8px; font-size: 15px; }
     p { font-size: 13px; line-height: 1.6; margin: 0; }
   }
   </style>
