import request from '@/utils/request'

// 查询班级课程列表
export function listSchedule(query) {
  return request({
    url: '/school/schedule/list',
    method: 'get',
    params: query
  })
}

// 查询班级课程详细
export function getSchedule(scheduleId) {
  return request({
    url: '/school/schedule/' + scheduleId,
    method: 'get'
  })
}

// 新增班级课程
export function addSchedule(data) {
  return request({
    url: '/school/schedule',
    method: 'post',
    data: data
  })
}

// 修改班级课程
export function updateSchedule(data) {
  return request({
    url: '/school/schedule',
    method: 'put',
    data: data
  })
}

// 删除班级课程
export function delSchedule(scheduleId) {
  return request({
    url: '/school/schedule/' + scheduleId,
    method: 'delete'
  })
}
// 获取今日课表 (学生端)
export function getTodaySchedule() {
  return request({
    url: '/school/portal/schedule/today',
    method: 'get'
  })
}

// 🔥 获取我的班级课表 (学生端/老师端)
export function getMyClassSchedule(params) {
  return request({
    url: '/school/portal/schedule/all',
    method: 'get',
    params: params
  })
}

// // (保留这个防止其他地方报错，虽然暂时不用)
// export function getMyRecentHomework() {
//   return request({
//     url: '/school/portal/homework',
//     method: 'get'
//   })
// }
