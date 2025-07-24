part of 'index.dart';

class AstrologicalDirectionPage extends StatefulWidget {
  const AstrologicalDirectionPage({super.key});

  @override
  State<AstrologicalDirectionPage> createState() => _CertifiedGenderPageState();
}

class _CertifiedGenderPageState extends State<AstrologicalDirectionPage> {
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
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: LanKey.directionTip.tr,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: LanKey.multipleOptions.tr,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.all(16),
              width: double.maxFinite,
              child: Wrap(
                spacing: 16.w,
                runSpacing: 16.w,
                children: [
                  ...[
                    "Astro-Accuracy",
                    "Transit-Mastery",
                    "Client-Centric",
                    "Symbolic-Translation"
                  ].map((e) => Container(
                        clipBehavior: Clip.hardEdge,
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 25.w, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadiusDirectional.circular(50)),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
