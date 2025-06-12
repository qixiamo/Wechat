//页面之间的跳转是创建page页面。而不是创建ets文件，pege页面创建好后，会在resources/base/profile/
import { UserInfo } from '../../models/users';
import { router } from '@kit.ArkUI';
import BottomInput from './BottomInput';

// main_pages.json文件中显示其路径，若没有自动创建则无法跳转，且添加的可能不是pege页面
@Entry
@Component
struct ChatDatell {
  //as UserInfo 是TypeScript的类型断言，强制将空对象 {} 断言为 UserInfo 类型（避免类型检查报错）。
  //定义一个接收Connect的params传过来的变量talker
  @State talker: UserInfo = {} as UserInfo

  aboutToAppear(): void {
    //接收从Connect文件中传过来的params值
    this.talker = router.getParams() as UserInfo
  }

  build() {
    Column() {
      //顶部
      Row() {
        //此处用层叠布局的作用是：若不用层叠布局的话，this.talker.userName无法居中，只有用层叠布局，先将text设置居中后，
        // 将image叠加在text上，然后设置其对齐方式.alignContent(Alignment.Start)
        Stack() {
          Text(this.talker.userName)
            .width('100%')
            .textAlign(TextAlign.Center)
          Image($r('app.media.xiangzuo'))
            .width(18)
            .onClick(() => {
              router.back()
            })
        }
        .alignContent(Alignment.Start)
      }
      .width('100%')
      .padding(10)

      //中间聊天区域
      Blank()
      //底部输入栏
      BottomInput()
    }
    .width('100%')
    .height('100%')
  }
}