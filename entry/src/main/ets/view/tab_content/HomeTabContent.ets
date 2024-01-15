import HomeTabChildContent from './HomeTabChildContent';

@Component
export default struct HomeTabContent {

  /**
   * 默人选中位置
   */
  @State index: number = 0;
  /**
   * tab控制启
   */
  private tabsController: TabsController = new TabsController()
  /**
   * tab选中大小
   */
  @State tabSelSize: number = 14;
  /**
   * tab默认大小
   */
  @State tabDefSize: number = 12;

  build() {
    Row() {
      Column() {
        Tabs({ index: this.index,
          controller: this.tabsController,
          barPosition: BarPosition.Start }) {
          TabContent() {
            HomeTabChildContent({ content: "蔬菜" })
          }.tabBar(this.HomeTabContent_Tab(0, "蔬菜"))

          TabContent() {
            HomeTabChildContent({ content: "水果" })
          }.tabBar(this.HomeTabContent_Tab(1, "水果"))

          TabContent() {
            HomeTabChildContent({ content: "面条" })
          }.tabBar(this.HomeTabContent_Tab(2, "面条"))
        }
        // .barMode(BarMode.Scrollable)
        // .barWidth("90%")
        .onChange((index) => {
          this.index = index
        })
      }
      // HomeTabContent_Top()
    }
    .width("100%")
    .height("100%")
  }

  @Builder HomeTabContent_Tab(index: number, tabName: string) {
    Text(tabName)
      .fontSize(index == this.index ? this.tabSelSize : this.tabDefSize)
      .fontColor(Color.Black)
      .fontWeight(index == this.index ? FontWeight.Bold : FontWeight.Normal)
  }
}

@Component
struct HomeTabContent_Top {
  build() {
    Row() {
      Image($r("app.media.ic_scan"))
        .width(20)
        .height(20)
    }
    .width("100%")
  }
}