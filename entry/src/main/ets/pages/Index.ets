import { tabClass } from '../models/tabs'
import Connect from './Connect'
import Discover from './Discover'
import My from './My'
import Wechat from './Wechat'

@Entry
@Component
struct Index {
  @State tabList: tabClass[] = [
    { icon: $r('app.media.wechat'), text: '微信', iconsec: $r('app.media.wechat_sec') },
    { icon: $r('app.media.tongxunlu'), text: '通讯录', iconsec: $r('app.media.tongxunlu_sec') },
    { icon: $r('app.media.faxian'), text: '发现', iconsec: $r('app.media.faxian_sec') },
    { icon: $r('app.media.wo'), text: '我', iconsec: $r('app.media.wo_sec') }
  ]
  @State currentIndex: number = 0

  @Builder
  tabBuilder(item: tabClass, index: number) {
    Column() {
      Image(this.currentIndex === index ? item.iconsec : item.icon)
        .width(24)
      Text(item.text)
        .fontSize(14)
        .fontColor(this.currentIndex === index ? $r('app.color.primary') : $r('app.color.text_primary'))

    }
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(this.tabList, (item: tabClass, index: number) => {
          TabContent() {
            if (this.currentIndex === 0) {
              Wechat()
            } else if (this.currentIndex === 1) {
              Connect()
            } else if (this.currentIndex === 2) {
              Discover()
            } else if (this.currentIndex === 3) {
              My()
            }
          }
          .tabBar(this.tabBuilder(item, index))
        })
      }
      .animationDuration(0)
      .barBackgroundColor('#f7f7f7')
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
  }
}