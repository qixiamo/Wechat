@Entry
@Component
struct BottomInput {
  @State showVoice: boolean = false

  build() {
    Column() {
      Row({ space: 6 }) {
        Image(this.showVoice ? $r('app.media.jianpan') : $r('app.media.laba'))
          .width(20)
          .onClick(() => {
            this.showVoice = !this.showVoice
          })
        if (this.showVoice) {
          Button('按住说话', {
            type: ButtonType.Normal
          })
            .backgroundColor(Color.White)
            .fontColor($r('app.color.text_primary'))
            .layoutWeight(1)
            .borderRadius(2)
            .height(40)
        } else {
          TextInput()
            .layoutWeight(1)
            .backgroundColor($r('app.color.white'))
            .borderRadius(4)
            .height(40)
            .padding({
              left: 10,
              right: 10
            })
        }
        Image($r('app.media.tianjia'))
          .width(20)
      }
      .width('100%')
      .padding({
        top: 10,
        bottom: 10,
        left: 6,
        right: 6
      })
    }
    .width('100%')
    .backgroundColor($r('app.color.second_back_color'))
    .justifyContent(FlexAlign.End)
  }
}

export default BottomInput