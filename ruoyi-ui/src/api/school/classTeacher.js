import request from '@/utils/request'

// 查询班级科任老师列表
export function listClassTeacher(query) {
  return request({
    url: '/school/classTeacher/list',
    method: 'get',
    params: query
  })
}

// 新增班级科任老师
export function addClassTeacher(data) {
  return request({
    url: '/school/classTeacher',
    method: 'post',
    data: data
  })
}

// 删除班级科任老师
export function delClassTeacher(id) {
  return request({
    url: '/school/classTeacher/' + id,
    method: 'delete'
  })
}
