import { DefaultUserList, UserInfo } from '../models/users'

@Entry
@Component
struct Connect {
  @State filterList: UserInfo[] = []
  //当searchName值发生变化，就会执行filterName回调函数
  // @State @Watch('filterName') searchName: string = ''
  @State @Watch('filterName') searchName: string = ''

  //组件在开始加载的时候就触发
  aboutToAppear(): void {
    //组件一开始加载的时候，将自定义的数据赋值给filterList
    //也就是说现在filterList现在的数据就是DefaultUserList的数据，后续forEach遍历的时候遍历filterList即可
    this.filterList = DefaultUserList
  }

  //////filter和include的用法模板
  /*// 1. 定义数据源和过滤条件
@State data: 数据类型[] = [...]; // 原始数据
@State filterCondition: any = ...; // 过滤条件（如关键词、状态等）
// 2. 在build()中使用filter过滤数据
ForEach(
  this.data.filter((item: 数据类型) => {
    // 返回true保留该条目，false过滤掉
    return item.属性.includes(this.filterCondition); // 示例：关键词过滤
  }),
  (item: 数据类型) => {
    // 渲染每个过滤后的条目
    YourComponent({ /* 组件属性 *})
}
)*/

  filterName() {
    this.filterList = DefaultUserList.filter((user: UserInfo) => {
      //如果联系人列表中，存在输入的联系人名称，则将搜索到的联系人数据返回给到filterList
      //下面代码的意思是输入(searchName)的名称如果在列表(user)中找到了需要查询的userName，那么就把查询到的数据返回给filterList
      return user.userName.includes(this.searchName)
    })
  }

  build() {
    Column() {
      Row() {
        /*value: $$this.searchName
        $$ 是鸿蒙双向绑定的前缀符号。
        $$this.searchName 是一种双向数据绑定的语法，主要用于实现UI组件与数据变量的自动同步
        ①双向绑定：当用户在输入框等组件中修改内容时，$$this.searchName 会自动更新对应的变量 searchName；反之，当代码中修改
        searchName 的值时，UI 也会同步更新。②简化代码：无需手动监听输入事件或调用更新方法，鸿蒙框架会自动处理数据与UI的同步。
        ③使用 $$this.searchName 后，无需写 onChange 事件，输入框内容变化会自动更新 searchName。
                */
        Search({ placeholder: '搜索', value: $$this.searchName })
          .backgroundColor($r('app.color.white'))
          .borderRadius(4)
          .height(36)//在提交的时候也可以进行查询
          .onSubmit((value: string) => {
            //测试是否能获取到searchName的值
            // AlertDialog.show({
            //   message: this.searchName
            // })
            this.searchName = value
          })
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