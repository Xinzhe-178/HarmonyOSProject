import http from '@ohos.net.http'
import { HomeCommonListBean } from '../../bean/HomeCommonListBean'
import { Urls } from '../../const/Urls'
import { jumpOptions } from '../../utils/JumpUtil'
import { toast } from '../../utils/ToastUtil'

@Component
@Entry
export default struct HomeTabChildContent {
  private content: string
  @State itemList: Array<HomeCommonListBean> = []

  aboutToAppear() {
    let httpReq = http.createHttp()
    httpReq.request(Urls.SeekUrl.concat(this.content), {
      method: http.RequestMethod.GET
    }, (error, data) => {
      if (data != null) {
        this.itemList = JSON.parse(data.result.toString()).list
      } else {
        toast("error is " + error)
      }
    })
  }

  build() {
    Column() {
      List() {
        ForEach(this.itemList, (item: HomeCommonListBean) => {
          ListItem() {
            this.HomeTabChildContent_Item(item, () => {
              toast(item.title)
              jumpOptions("pages/ShopDetailsPage", {
                "title": this.content
              })
            })
          }
        })
      }
    }
    .width("100%")
    .height("100%")
  }

  @Builder HomeTabChildContent_Item(item: HomeCommonListBean, click: Function) {
    Row() {
      Image(item.img)
        .width(60)
        .height(60)
        .margin(15)
        .objectFit(ImageFit.Fill)

      Text(item.title)
        .fontColor(Color.Red)
        .fontSize(13)
    }
    .width("100%")
    .onClick(() => {
      click()
    })
  }
}
