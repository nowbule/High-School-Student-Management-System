import request from '@/utils/request'

// 1. 获取我的待办作业
// 对应后端 StudentPortalController.java 的 @GetMapping("/homework")
export function getMyRecentHomework() {
  return request({
    url: '/school/portal/homework',  // 🔥 重点：这里改成了 /portal/ 防止撞车
    method: 'get'
  })
}

// 2. 获取我的考勤统计
// 对应后端 StudentPortalController.java 的 @GetMapping("/attendance")
export function getMyAttendanceStats() {
  return request({
    url: '/school/portal/attendance', // 🔥 重点：这里改成了 /portal/ 防止撞车
    method: 'get'
  })
}

// 3. 获取个人详细信息 (使用系统自带接口)
export function getUserProfile() {
  return request({
    url: '/system/user/profile',
    method: 'get'
  })
}

// 4. 获取我的考勤列表 (新加的)
export function getMyAttendanceList(query) {
  return request({
    url: '/school/portal/attendance/list',
    method: 'get',
    params: query
  })
}

// 5. 获取今日课表
export function getTodaySchedule() {
  return request({
    url: '/school/portal/schedule/today',
    method: 'get'
  })
}

// 6. 获取我的班级所有课表
export function getAllSchedule() {
  return request({
    url: '/school/portal/schedule/all',
    method: 'get'
  })
}

// 7. 学情成绩分析
export function getScoreAnalysis() {
  return request({
    url: '/school/portal/score/analysis',
    method: 'get'
  })
}
