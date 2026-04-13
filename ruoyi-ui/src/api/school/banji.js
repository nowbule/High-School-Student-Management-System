import request from '@/utils/request'

// 查询班级信息列表
export function listBanji(query) {
  return request({
    url: '/school/banji/list',
    method: 'get',
    params: query
  })
}

// 查询班级信息详细
export function getBanji(classId) {
  return request({
    url: '/school/banji/' + classId,
    method: 'get'
  })
}

// 新增班级信息
export function addBanji(data) {
  return request({
    url: '/school/banji',
    method: 'post',
    data: data
  })
}

// 修改班级信息
export function updateBanji(data) {
  return request({
    url: '/school/banji',
    method: 'put',
    data: data
  })
}

// 删除班级信息
export function delBanji(classId) {
  return request({
    url: '/school/banji/' + classId,
    method: 'delete'
  })
}
