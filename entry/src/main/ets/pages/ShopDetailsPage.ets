import { Urls } from '../const/Urls'
import { getParams } from '../utils/JumpUtil'

@Entry
@Component
struct ShopDetailsPage {
  private title: string

  aboutToAppear() {
    this.title = getParams()["title"]
  }

  private webViewController: WebController = new WebController()

  build() {
    Column() {
      Web({
        src: Urls.BaiduSeekUrl.concat(this.title),
        controller: this.webViewController
      })
    }
    .width("100%")
    .height("100%")
  }
}