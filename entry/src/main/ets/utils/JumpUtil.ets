import router from '@ohos.router'

/**
 * 不携带参数的跳转
 * @param url
 */
export function jump(url: string) {
  router.pushUrl({
    url: url
  })
}

/**
 * 可携带参数的跳转
 * @param url
 * @param params
 */
export function jumpOptions(url: string, params: Object) {
  router.pushUrl({
    url: url,
    params: params
  })
}

/**
 * 清空页面栈中的所有历史页面，仅保留当前页面作为栈顶页面。
 */
export function clearStackPage() {
  router.clear()
}
/**
 * 清空页面栈中的所有历史页面，仅保留当前页面作为栈顶页面。
 */
export function getParams(): Object {
  return router.getParams()
}

