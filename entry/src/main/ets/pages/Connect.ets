import { DefaultUserList, UserInfo } from '../models/users'

@Entry
@Component
struct Connect {
  @State filterList: UserInfo[] = []

  //组件在开始加载的时候就触发
  aboutToAppear(): void {
    //组件一开始加载的时候，将自定义的数据赋值给filterList
    //也就是说现在filterList现在的数据就是DefaultUserList的数据，后续forEach遍历的时候遍历filterList即可
    this.filterList = DefaultUserList
  }

  build() {
    Column() {
      Row() {
        Search({ placeholder: '搜索' })
          .backgroundColor($r('app.color.white'))
          .borderRadius(4)
          .height(36)
      }
      .width('100%')
      .padding({
        left: 10,
        right: 10
      })

      List() {
        ForEach(this.filterList, (item: UserInfo, index: number) => {
          ListItem() {
            Row({ space: 10 }) {
              Image(item.avatar)
                .width(30).aspectRatio(1)
                .borderRadius(4)
                .margin({ left: 10 })
              Column() {
                Text(item.userName)
                  .fontSize(14)
                  .fontColor($r('app.color.black'))
              }
            }
            .width('100%')
            .height(60)
            /*  .stateStyles()` 允许开发者为组件的不同状态设置不同的样式。这些状态通常包括：
                - `normal`：默认状态，即组件正常显示时的样式。
                - `pressed`：按下状态，当用户按下组件时应用的样式。
                - `focused`：获取焦点状态，当组件获得焦点时（如通过方向键导航）应用的样式。
                - `disabled`：禁用状态，当组件被禁用时应用的样式。   * */
            .stateStyles({
              pressed: {
                .backgroundColor($r('app.color.back_color'))
              },
              normal: {
                .backgroundColor($r('app.color.white'))
              }
            })
          }
        }, (item: UserInfo) => item.user_id)
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .backgroundColor($r('app.color.white'))
      .divider({
        strokeWidth: 1,
        color: $r('app.color.border_color')
      })
    }
    .width('100%')
    .height('100%')
    .padding({
      top: 20
    })
    .backgroundColor($r('app.color.back_color'))
  }
}

export default Connect