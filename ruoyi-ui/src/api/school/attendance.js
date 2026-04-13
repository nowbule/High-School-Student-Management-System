import request from '@/utils/request'

// 查询学生考勤列表
export function listAttendance(query) {
  return request({
    url: '/school/attendance/list',
    method: 'get',
    params: query
  })
}

// 查询学生考勤详细
export function getAttendance(attendanceId) {
  return request({
    url: '/school/attendance/' + attendanceId,
    method: 'get'
  })
}

// 新增学生考勤
export function addAttendance(data) {
  return request({
    url: '/school/attendance',
    method: 'post',
    data: data
  })
}

// 修改学生考勤
export function updateAttendance(data) {
  return request({
    url: '/school/attendance',
    method: 'put',
    data: data
  })
}

// 删除学生考勤
export function delAttendance(attendanceId) {
  return request({
    url: '/school/attendance/' + attendanceId,
    method: 'delete'
  })
}

// 初始化班级考勤
export function initAttendance(data) {
  return request({
    url: '/school/attendance/init',
    method: 'post',
    data: data
  })
}

// 统计考勤状态
export function getAttendanceStats(query) {
  return request({
    url: '/school/attendance/stats',
    method: 'get',
    params: query
  })
}
