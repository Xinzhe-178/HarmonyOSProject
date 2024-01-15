import { toast } from '../../utils/ToastUtil'
import HomeTabChildContent from './HomeTabChildContent'

@Component
export default struct MineTabContent {
  build() {
    Column() {
      Column() {
        Stack({
          alignContent: Alignment.Bottom
        }) {
          Row() {

          }
          .width("100%")
          .height(30)
          .backgroundColor(Color.White)
          .borderRadius({ topLeft: 25, topRight: 25 })

          Image($r("app.media.app_icon"))
            .width(60)
            .height(60)
            .borderRadius(30)
            .onClick(() => {
              toast("点击设置图片")
            })
        }
      }
      .width("100%")
      .height("40%")
      .backgroundColor(Color.Pink)
      .justifyContent(FlexAlign.End)

      Column() {
        HomeTabChildContent({ content: "卡通头像" })
      }
      .width("100%")
      .height("60%")
      .backgroundColor(Color.White)
    }
    .width("100%")
    .height("100%")
  }
}