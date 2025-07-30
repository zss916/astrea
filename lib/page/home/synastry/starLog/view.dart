part of 'index.dart';

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

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
        title: LanKey.starLog.tr,
      ),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<LogsLogic>(
        init: LogsLogic(),
        builder: (logic) {
          return buildBody(logic.viewState, logic);
        },
      ),
    );
  }

  Widget buildBody(int viewState, LogsLogic logic) {
    return switch (viewState) {
      _ when viewState == Status.empty.index => buildEmpty(),
      _ when viewState == Status.data.index => buildList(logic),
      _ => LoadingWidget(),
    };
  }

  Widget buildList(LogsLogic logic) => ListView.separated(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20),
    itemCount: logic.list.length,
    separatorBuilder: (_, i) => Divider(color: Colors.transparent, height: 16),
    itemBuilder: (_, i) => GestureDetector(
      onTap: () {
        AnalysisEntity item = logic.list[i];
        if ((item.id != null) && item.relationship != null) {
          PageTools.toStarReportPage(
            id: (item.id ?? 0).toString(),
            userName: item.firstFriendInfo?.nickName ?? "",
            userAvatar: item.firstFriendInfo?.headImg ?? "",
            friendName: item.secondFriendInfo?.nickName ?? "",
            friendAvatar: item.secondFriendInfo?.headImg ?? "",
          );
          /* PageTools.toStarReport(
            firstId: item.firstFriendInfo?.id ?? 0,
            secondId: item.secondFriendInfo?.id ?? 0,
            relationship: item.relationship ?? "",
            isSave: true,
            userName: item.firstFriendInfo?.nickName ?? "",
            userAvatar: item.firstFriendInfo?.headImg ?? "",
            friendName: item.secondFriendInfo?.nickName ?? "",
            friendAvatar: item.secondFriendInfo?.headImg ?? "",
          );*/
        }
      },
      child: LogItem(item: logic.list[i]),
    ),
  );

  Widget buildEmpty() => SizedBox(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(bottom: 24.h),
          child: Image.asset(
            Assets.imageLogEmpty,
            matchTextDirection: true,
            width: 88,
            height: 76,
          ),
        ),
        Text(
          'There is no record of the game, go \nadd friends',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF6A676C),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
