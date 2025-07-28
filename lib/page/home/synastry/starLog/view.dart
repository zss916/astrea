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
          return buildList(logic);
        },
      ),
    );
  }

  Widget buildList(LogsLogic logic) => ListView.separated(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20),
    itemCount: logic.list.length,
    separatorBuilder: (_, i) => Divider(color: Colors.transparent, height: 16),
    itemBuilder: (_, i) => GestureDetector(
      onTap: () {
        PageTools.toStarReport();
      },
      child: LogItem(),
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
