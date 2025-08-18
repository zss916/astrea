part of 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with DelayedInitMixin {
  int index = 0;
  late final PageController pageCtrl = PageController(initialPage: 0);

  late StreamSubscription<TabEvent> tabEvent;

  @override
  void initState() {
    super.initState();
    tabEvent = AppEventBus.eventBus.on<TabEvent>().listen((event) {
      setState(() {
        index = event.index;
        pageCtrl.jumpToPage(index);
      });
    });
  }

  @override
  void afterFirstLayout() {
    ///afterFirstLayout
  }

  @override
  void dispose() {
    tabEvent.cancel();
    pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.pageBackground,
        extendBody: true,
        body: PageView(
          pageSnapping: false,
          scrollBehavior: null,
          physics: const NeverScrollableScrollPhysics(),
          controller: pageCtrl,
          children: [
            HoroscopeView(),
            // SpiritualView(),
            SynastryView(),
            // ChatroomView(),
            AccountView(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color(0xF2F7F7F8),
            border: Border(
              top: BorderSide(
                color: Colors.grey.withValues(alpha: 0.5),
                width: 0.5,
              ),
            ),
          ),
          alignment: AlignmentDirectional.topCenter,
          height: 82,
          padding: EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
          child: CustomNavigationBar(
            currentIndex: index,
            elevation: 0,
            backgroundColor: Colors.transparent,
            //backgroundColor: Color(0x80F7F7F8),
            strokeColor: Colors.transparent,
            scaleFactor: 0.01,
            iconSize: 30,
            items: [
              CustomNavigationBarItem(
                icon: Image.asset(
                  Assets.imageHoroscope,
                  width: 26,
                  height: 26,
                  matchTextDirection: true,
                ),
                selectedIcon: Image.asset(
                  Assets.imageHoroscopeS,
                  width: 26,
                  height: 26,
                  matchTextDirection: true,
                ),
                title: Text(
                  LanKey.horoscope.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.textFontFamily,
                    color: AppColor.textHintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selectedTitle: Text(
                  LanKey.horoscope.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.textFontFamily,
                    color: AppColor.textHintSelectColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              /* CustomNavigationBarItem(
                  icon: Image.asset(
                    Assets.imageSpiritual,
                    width: 29,
                    height: 18,
                    matchTextDirection: true,
                  ),
                  selectedIcon: Image.asset(
                    Assets.imageSpiritualS,
                    width: 29,
                    height: 18,
                    matchTextDirection: true,
                  ),
                  title: Text(
                    LanKey.spiritual.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textHintColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selectedTitle: Text(
                    LanKey.spiritual.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textHintSelectColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),*/
              CustomNavigationBarItem(
                icon: Image.asset(
                  Assets.imageSynastry,
                  width: 26,
                  height: 26,
                  matchTextDirection: true,
                ),
                selectedIcon: Image.asset(
                  Assets.imageSynastryS,
                  width: 26,
                  height: 26,
                  matchTextDirection: true,
                ),
                title: Text(
                  LanKey.synastry.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.textFontFamily,
                    color: AppColor.textHintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selectedTitle: Text(
                  LanKey.synastry.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.textFontFamily,
                    color: AppColor.textHintSelectColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              /*CustomNavigationBarItem(
                  icon: Image.asset(
                    Assets.imageChatroom,
                    width: 23,
                    height: 23,
                    matchTextDirection: true,
                  ),
                  selectedIcon: Image.asset(
                    Assets.imageChatroomS,
                    width: 23,
                    height: 23,
                    matchTextDirection: true,
                  ),
                  title: Text(
                    LanKey.chatroom.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textHintColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  selectedTitle: Text(
                    LanKey.chatroom.tr,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.textHintSelectColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),*/
              CustomNavigationBarItem(
                icon: Image.asset(
                  Assets.imageAccount,
                  width: 26,
                  height: 26,
                  matchTextDirection: true,
                ),
                selectedIcon: Image.asset(
                  Assets.imageAccountS,
                  width: 26,
                  height: 26,
                  matchTextDirection: true,
                ),
                title: Text(
                  LanKey.account.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.textFontFamily,
                    color: AppColor.textHintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selectedTitle: Text(
                  LanKey.account.tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.textFontFamily,
                    color: AppColor.textHintSelectColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            onTap: (i) {
              setState(() {
                index = i;
                pageCtrl.jumpToPage(i);
              });
            },
          ),
        ),
      ),
    );
  }
}
