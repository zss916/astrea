part of 'index.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.noticeSetting.tr,
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
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.pageBackground,
      body: Column(
        children: [
          NoticeItem(),
          PushItem(
            onTap: () {
              showSelectTimeDialog(
                leftButtonText: LanKey.cancel.tr,
                rightButtonText: LanKey.ok.tr,
                selectIndex: AccountService.to.getNoticeSelectIndex(),
                routeName: APages.noticeSelectTimeDialog,
              );
            },
          ),
        ],
      ),
    );
  }
}
