// import request from '@/utils/request'
//
// // ================== 核心 CRUD 接口 (您提供的代码) ==================
//
// // 查询作业提交列表
// export function listSubmission(query) {
//   return request({
//     url: '/school/submission/list',
//     method: 'get',
//     params: query
//   })
// }
//
// // 查询作业提交详细
// export function getSubmission(submissionId) {
//   return request({
//     url: '/school/submission/' + submissionId,
//     method: 'get'
//   })
// }
//
// // 新增作业提交
// export function addSubmission(data) {
//   return request({
//     url: '/school/submission',
//     method: 'post',
//     data: data
//   })
// }
//
// // 修改作业提交
// export function updateSubmission(data) {
//   return request({
//     url: '/school/submission',
//     method: 'put',
//     data: data
//   })
// }
//
// // 删除作业提交
// export function delSubmission(submissionId) {
//   return request({
//     url: '/school/submission/' + submissionId,
//     method: 'delete'
//   })
// }
//
// // ================= 自定义业务接口 =================
//
// // 【学生】提交作业 (POST)
// export function submitHomework(data) {
//   return request({
//     url: '/school/submission',
//     method: 'post',
//     data: data
//   })
// }
//
// // 【老师】批改作业
// export function gradeSubmission(data) {
//   return request({
//     url: '/school/submission',
//     method: 'put',
//     data: data
//   })
// }
//
// // ================== 🔥 兼容性补丁 (为了不改其他文件) ==================
//
// /**
//  * 补丁1：门户首页 (index.vue) 需要这个接口来获取待办列表
//  * 如果没有它，首页的作业列表会报错消失
//  */
// export function getMyRecentHomework() {
//   return request({
//     url: '/school/portal/homework',
//     method: 'get'
//   })
// }
//
// /**
//  * 补丁2：提交页面 (submit.vue) 使用的是旧名称 getHomeworkSubmission
//  * 这里做一个“转发”，让旧名字自动调用新接口 getSubmission
//  */
// export function getHomeworkSubmission(submissionId) {
//   return getSubmission(submissionId)
// }
//
// /**
//  * 补丁3：提交页面 (submit.vue) 提交时使用的是 PUT 更新状态
//  * 这里做一个“转发”，让旧名字自动调用 updateSubmission
//  */
// export function updateHomeworkSubmission(data) {
//   return updateSubmission(data)
// }   第一版！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！


import request from '@/utils/request'

// ================== 核心 CRUD 接口 ==================

// 查询作业提交列表
export function listSubmission(query) {
  return request({
    url: '/school/submission/list',
    method: 'get',
    params: query
  })
}

// 查询作业提交详细
export function getSubmission(submissionId) {
  return request({
    url: '/school/submission/' + submissionId,
    method: 'get'
  })
}

// 新增作业提交 (管理员用)
export function addSubmission(data) {
  return request({
    url: '/school/submission',
    method: 'post',
    data: data
  })
}

// 修改作业提交 (管理员用)
export function updateSubmission(data) {
  return request({
    url: '/school/submission',
    method: 'put',
    data: data
  })
}

// 删除作业提交
export function delSubmission(submissionId) {
  return request({
    url: '/school/submission/' + submissionId,
    method: 'delete'
  })
}

// ================= 你的业务接口 (已修复路径) =================

// 【学生】提交作业 (修复：对应后端 /studentSubmit 接口)
export function submitHomework(data) {
  return request({
    url: '/school/submission/studentSubmit', // <--- 这里帮你修正为后端写的专用接口
    method: 'post',
    data: data
  })
}

// 【老师】批改作业
export function gradeSubmission(data) {
  return request({
    url: '/school/submission',
    method: 'put',
    data: data
  })
}

// ================== 🔥 兼容性补丁 (防止Vue页面报错) ==================

/**
 * 补丁1：你的 Vue 页面 import 了 listMyHomework
 * 这里做一个转发，让它直接去调用 listSubmission
 */
export function listMyHomework(query) {
  return request({
    url: '/school/submission/student/list',
    method: 'get',
    params: query
  })
}
/**
 * 补丁2：提交页面如果用了 getHomeworkSubmission
 */
export function getHomeworkSubmission(submissionId) {
  return getSubmission(submissionId)
}

/**
 * 补丁3：门户首页可能用到的接口
 */
export function getMyRecentHomework() {
  return request({
    url: '/school/portal/homework', // 确保后端有这个接口，否则会404，但不影响提交功能
    method: 'get'
  })
}

// ==================================================
// 🔥 核心修复：获取所有课表 (对应刚才第一步写的后端接口)
// ==================================================
export function getAllSchedules() {
  return request({
    url: '/school/portal/schedule/all',
    method: 'get'
  })
}

// 获取门户首页的成绩分析
// 获取成绩分析数据
export function getPortalScoreAnalysis() {
  return request({
    url: '/school/portal/score/analysis',
    method: 'get'
  })
}

// ... 其他代码 ...

// 🔥🔥🔥 必须补上这个方法，否则页面找不到接口会一直转圈 🔥🔥🔥
// 查询学生成绩趋势图表（最终修复版）
export function listStudentScoreAnalysis(query) {
  return request({
    // 🔥 这里的地址必须和第二步里的注解一模一样
    url: '/school/submission/weekly/analysis',
    method: 'get',
    params: query
  })
}
