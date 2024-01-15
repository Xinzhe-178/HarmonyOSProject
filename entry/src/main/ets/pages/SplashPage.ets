import { jump } from '../utils/JumpUtil'

@Entry
@Component
struct SplashPage {
  @State progress: number = 1;

  onPageShow() {
    setTimeout(() => {
      jump("pages/HomePage")
    }, 1000)
  }

  build() {
    Column() {
      SplashPage_Logo()
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
    .opacity(this.progress)
    .scale({
      x: this.progress,
      y: this.progress
    })
  }

  /**
   * 进场与退场动画
   */
  pageTransition() {
    // 退场动画
    PageTransitionExit({
      duration: 600
    })
      .onExit((type: RouteType, progress: number) => {
        console.log("SplashPage-> PageTransitionExit progress = " + progress)
        this.progress = 1 - progress
      })
  }
}

@Component
struct SplashPage_Logo {
  build() {
    Column() {
      Image($r("app.media.icon"))
        .width(100)
        .width(100)
      Text("Welcome")
        .fontColor(Color.Black)
        .fontSize(18)
        .margin({ top: 10 })
    }
  }
}