@Entry
@Component
struct Message {
  // @State MessageAva: UserInfo = {} as UserInfo

  build() {
    Row({ space: 8 }) {
      Image('https://p5.ssl.qhimgs1.com/sdr/400__/t01afd659fd808105bf.jpg')
        .width(40).aspectRatio(1)
        .borderRadius(4)
        .margin({ top: 10 })
      Text('问问饿德剧说过无穷积分，你电话秋如没写，呢送礼物文瑞我也范，围与野王如唯超，级富豪山东科技粉红色，对法华为发' +
        '洒打卡手机发哈苏卡达合法刷卡，机代发哈师，大飞机上开发和，盛大后南城街道还是贷款就苏卡达')
        .backgroundColor(Color.White)
        .borderRadius(4)
        .textAlign(TextAlign.Start)
        .width('74%')
        .margin({ top: 10 })
        .padding(10)
    }
    .backgroundColor($r('app.color.back_color'))
    .alignItems(VerticalAlign.Top)
    .width('100%')
    .padding({
      left: 16,
      right: 16
    })
    //左边聊天头像和信息，聊天界面的左边
    // .direction(Direction.Ltr)
    //右边聊天头像和信息，聊天界面的右边
    .direction(Direction.Rtl)
  }
}

export default Message