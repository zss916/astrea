part of 'index.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  final bool isUser = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatLogic>(
        init: ChatLogic(),
        builder: (logic) {
          return Scaffold(
              appBar: ComAppBar(
                centerTitle: true,
                titleWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 8.w),
                      child: LineState(state: 1),
                    ),
                    Text(
                      LanKey.chat.tr,
                      style: TextStyle(fontSize: 22, color: Color(0xFF323133)),
                    ),
                  ],
                ),
                leading: Container(
                  margin: EdgeInsetsDirectional.only(start: 16),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => Get.back(),
                        child: Image.asset(
                          Assets.imageBackIcon,
                          matchTextDirection: true,
                          width: 40,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                ),
                actions: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(end: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        showChatBackgroundSheet();

                        // showFreeTipDialog();
                        // showChatMoreSheet(isFollow: false, isAddBlack: false);
                      },
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset(
                              Assets.imageMore,
                              matchTextDirection: true,
                              width: 24,
                              height: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColor.pageBackground,
              extendBodyBehindAppBar: (!isUser),
              // resizeToAvoidBottomInset: false,
              body: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  if (!isUser)
                    PositionedDirectional(
                        top: 0,
                        start: 0,
                        end: 0,
                        bottom: 0,
                        child: Image.asset(
                          Assets.backgroundChatBg,
                          fit: BoxFit.cover,
                        )),
                  PositionedDirectional(
                      top: (!isUser) ? 80 : 0,
                      start: 0,
                      end: 0,
                      bottom: 0,
                      child: Chat(
                        logic: logic,
                        isUser: isUser,
                        historyMsg: logic.historyMsg,
                        currentMsg: logic.currentMsg,
                      )),
                  // if (logic.isOpenVip)
                  PositionedDirectional(
                      start: 0, end: 0, bottom: 0, child: OpenVipView())
                ],
              ));
        });
  }
}
