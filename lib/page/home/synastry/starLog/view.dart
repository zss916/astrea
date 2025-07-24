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
                )
              ],
            ),
          ),
          title: LanKey.starLog.tr,
        ),
        backgroundColor: AppColor.pageBackground,
        body: buildList());
  }

  Widget buildList() => ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20),
      itemCount: 20,
      separatorBuilder: (_, i) => Divider(
            color: Colors.transparent,
            height: 16,
          ),
      itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              PageTools.toStarReport();
            },
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsetsDirectional.all(5),
              constraints: BoxConstraints(minHeight: 120),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(100),
                        ),
                        width: 58,
                        height: 58,
                      ),
                      Text(
                        'ThornLullaby‌',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.imageSynastryAvatarSpace,
                        width: 30,
                        height: 30,
                        matchTextDirection: true,
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 12),
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFEDEDFE)),
                        child: Text(
                          'Lover',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF585FC4),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(100),
                        ),
                        width: 58,
                        height: 58,
                      ),
                      Text(
                        'ThornLullaby‌',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ));

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
            )
          ],
        ),
      );
}
