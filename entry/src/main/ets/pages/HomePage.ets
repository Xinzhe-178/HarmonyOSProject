import { clearStackPage } from '../utils/JumpUtil';
import HomeTabContent from '../view/tab_content/HomeTabContent';
import MineTabContent from '../view/tab_content/MineTabContent';

@Entry
@Component
struct HomePage {
  @State progress: number = 1;

  /**
   * 生命周期 https://juejin.cn/post/7306023841209335834
   * onPageShow onPageHide 页面显示和隐藏时调用相当于onResume 和 onPause
   * aboutToAppear 相当于onCreate aboutToDisappear 相当于onDestory
   * onBackPress 触发返回键时调用
   */
  onPageShow() {
    console.log("HomePage-> onPageShow")
  }

  onPageHide() {
    console.log("HomePage-> onPageHide")
  }

  onBackPress() {
    console.log("HomePage-> onBackPress")
  }

  aboutToAppear() {
    console.log("HomePage-> aboutToAppear")
  }

  aboutToDisappear() {
    console.log("HomePage-> aboutToDisappear")
  }

  /**
   * 默人选中位置
   */
  @State index: number = 0;
  /**
   * tab控制启
   */
  private tabsController: TabsController = new TabsController()
  /**
   * tab选中颜色
   */
  @State tabSelColor: Color = Color.Red;
  /**
   * tab默认颜色
   */
  @State tabDefColor: Color = Color.Black;
  /**
   * tab首页Icon
   */
  private homeTabIconList: Array<Resource> = [
  $r("app.media.icon_home_sel_sel"),
  $r("app.media.icon_home_sel_def")
  ]
  /**
   * tab我的Icon
   */
  private mineTabIconList: Array<Resource> = [
  $r("app.media.icon_mine_sel_sel"),
  $r("app.media.icon_mine_sel_def")
  ]

  build() {
    Column() {
      Tabs({ index: this.index,
        controller: this.tabsController,
        barPosition: BarPosition.End }) {
        TabContent() {
          HomeTabContent()
        }
        .tabBar(this.HomePage_Tab(0, "首页", this.homeTabIconList))

        TabContent() {
          MineTabContent()
        }
        .tabBar(this.HomePage_Tab(1, "我的", this.mineTabIconList))
      }
      // 设置为不可通过左右滑动切换
      .scrollable(false)
      .onChange((index) => {
        this.index = index
      })
    }
    .width("100%")
    .height("100%")
    .opacity(this.progress)
  }

  @Builder HomePage_Tab(index: number, tabName: string, icons: Array<Resource>) {
    Column() {
      // 这里套一层是为了使其垂直居中
      Column() {
        Image(index == this.index ? icons[0] : icons[1])
          .width(30)
          .height(30)

        Text(tabName)
          .fontSize(13)
          .fontColor(index == this.index ? this.tabSelColor : this.tabDefColor)
          .margin({ top: 3 })
      }
    }
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height("100%")
    .backgroundColor(Color.Pink)
    .borderRadius({ topLeft: index == 0 ? 15 : 0, topRight: index == 1 ? 15 : 0 })
  }

  /**
   * 进场与退场动画
   */
  pageTransition() {
    // 进场动画
    PageTransitionEnter({}).onEnter((type: RouteType, progress: number) => {
      console.log("HomePage-> PageTransitionEnter progress = " + progress)

      this.progress = progress
      if (progress == 1) {
        clearStackPage()
      }
    })
  }
}