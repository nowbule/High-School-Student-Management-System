import request from '@/utils/request'

// 查询班级视频列表
export function listVideo(query) {
  return request({
    url: '/school/video/list',
    method: 'get',
    params: query
  })
}

// 查询班级视频详细
export function getVideo(id) {
  return request({
    url: '/school/video/' + id,
    method: 'get'
  })
}

// 新增班级视频
export function addVideo(data) {
  return request({
    url: '/school/video',
    method: 'post',
    data: data
  })
}

// 修改班级视频
export function updateVideo(data) {
  return request({
    url: '/school/video',
    method: 'put',
    data: data
  })
}

// 删除班级视频
export function delVideo(id) {
  return request({
    url: '/school/video/' + id,
    method: 'delete'
  })
}
