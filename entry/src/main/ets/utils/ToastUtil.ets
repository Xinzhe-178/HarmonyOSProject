import promptAction from '@ohos.promptAction'
import display from '@ohos.display';

export enum Gravity {
  TOP = 10000,
  CENTER = 10001,
  BOTTOM = 10002,
}

function bottomF(bottom?: number) {
  let height = px2vp(display.getDefaultDisplaySync().height);
  let mBottom = undefined
  switch (bottom) {
    case Gravity.TOP:
      mBottom = height - 200;
      break;
    case Gravity.CENTER:
      mBottom = height / 2;
      break;
    case Gravity.BOTTOM:
      mBottom = undefined
      break;
    default:
      mBottom = bottom
      break;
  }
  return mBottom;
}

/**
 * 弹出1500ms
 * @param message
 * @param bottom 居顶、居中、居底、自定义高度弹出
 */
export function toast(message: string, bottom?: number) {
  promptAction.showToast({
    message: message,
    duration: 1500,
    bottom: bottom === undefined ? undefined : bottomF(bottom)
  })
}

/**
 * 自定义弹出时长
 * @param message
 * @param duration
 * @param bottom  居顶、居中、居底、自定义高度弹出
 */
export function toastDuration(message: string, duration: number, bottom?: number) {
  promptAction.showToast({
    message: message,
    duration: duration,
    bottom: bottom === undefined ? undefined : bottomF(bottom)
  })
}

/**
 * 弹出3000ms
 * @param message
 * @param bottom  居顶、居中、居底、自定义高度弹出
 */
export function toastLong(message: string, bottom?: number) {
  promptAction.showToast({
    message: message,
    duration: 3000,
    bottom: bottom === undefined ? undefined : bottomF(bottom)
  })
}