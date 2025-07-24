part of 'index.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({super.key});

  @override
  State<UploadVideoPage> createState() => _CertifiedGenderPageState();
}

class _CertifiedGenderPageState extends State<UploadVideoPage> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.selfIntroduction.tr,
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
              margin: EdgeInsetsDirectional.only(end: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  //todo save
                  // Get.back(result: "${introduction}");
                },
                child: Container(
                    padding: EdgeInsetsDirectional.all(6),
                    child: Text(
                      LanKey.save.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: num > 0
                            ? const Color(0xFF585FC4)
                            : const Color(0x99585FC4),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            )
          ],
        ),
        backgroundColor: AppColor.pageBackground,
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 20.h),
              child: Text(
                LanKey.uploadVideoTip.tr,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: 3 + 1,
                    padding: EdgeInsetsDirectional.only(
                        start: 16, end: 16, bottom: 16, top: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 116 / 154,
                    ),
                    itemBuilder: (context, index) {
                      return index == 3 ? buildUpload() : buildItem();
                    }))
          ],
        ));
  }

  Widget buildItem() => Container(
        width: double.maxFinite,
        height: 154,
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadiusDirectional.circular(16)),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(
              Assets.imagePlayIcon,
              width: 30,
              height: 30,
              matchTextDirection: true,
            ),
            PositionedDirectional(
                top: 0,
                end: 0,
                child: InkWell(
                  onTap: () {
                    //todo
                  },
                  child: Container(
                    margin: EdgeInsetsDirectional.all(4),
                    child: Image.asset(
                      Assets.imageCloseVideo,
                      matchTextDirection: true,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ))
          ],
        ),
      );

  Widget buildUpload() => Image.asset(
        Assets.imageUpload,
        matchTextDirection: true,
        width: 116,
        height: 154,
      );
}
