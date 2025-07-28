part of 'index.dart';

class FileManagementPage extends StatelessWidget {
  const FileManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
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
        title: LanKey.record.tr,
      ),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<FileManagementLogic>(
        init: FileManagementLogic(),
        builder: (logic) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  AddFriends(logic: logic),
                  Expanded(
                    child: ListView.separated(
                      itemCount: logic.list.length,
                      padding: EdgeInsetsDirectional.only(
                        top: 16,
                        bottom: 160,
                        start: 16,
                        end: 16,
                      ),
                      itemBuilder: (_, i) => RecordItem(
                        index: i,
                        item: logic.list[i],
                        onDelete: () {
                          showCommonDialog(
                            content: LanKey.deletePeopleTip.tr,
                            leftButtonText: LanKey.ok.tr,
                            rightButtonText: LanKey.cancel.tr,
                            onLeftButtonCall: () {
                              String uid = logic.list[i].id.toString();
                              logic.removeFriend(
                                id: uid,
                                index: i,
                                onFinish: () {
                                  Get.back();
                                },
                              );
                            },
                            onRightButtonCall: () {
                              Get.back();
                            },
                            routeName: APages.deletePeopleFileDialog,
                          );
                        },
                      ),
                      separatorBuilder: (_, i) =>
                          Divider(color: Colors.transparent, height: 16),
                    ),
                  ),
                ],
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: BottomStackBtn(
                  title: LanKey.determine.tr,
                  isClickable: false,
                  margin: EdgeInsetsDirectional.only(bottom: 0.h),
                  padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 0.h),
                  onTap: () {
                    showRelationshipSheet((value) {
                      PageTools.toStarReport();
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
