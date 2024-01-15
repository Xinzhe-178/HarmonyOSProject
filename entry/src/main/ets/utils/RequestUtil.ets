import http from '@ohos.net.http'
/**
 * 网络请求封装
 * 1，导入http模块
 * 2，常见http请求对象
 * 3，发起请求
 * 4，处理结果
 */
export function requestGet(url: string, call: RequestListener) {
  let httpReq = http.createHttp()
  httpReq.request(url, {
    method: http.RequestMethod.GET
  }, (error, data) => {
    if (data == null) {
      call.onError(error.message)
    } else {
      call.onSuccess(data.result)
    }
  })
}

export function requestPost() {

}

interface RequestListener {
  onError(errorMessage: string)

  onSuccess(data: Object)
}