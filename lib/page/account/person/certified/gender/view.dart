part of 'index.dart';

class CertifiedGenderPage extends StatefulWidget {
  const CertifiedGenderPage({super.key});

  @override
  State<CertifiedGenderPage> createState() => _CertifiedGenderPageState();
}

class _CertifiedGenderPageState extends State<CertifiedGenderPage> {
  int radioIndex = 0;
  bool isSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.gender.tr,
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
                  Get.back(result: "male");
                },
                child: Container(
                    padding: EdgeInsetsDirectional.all(6),
                    child: Text(
                      LanKey.save.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: isSave
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
        body: Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 24.h),
          child: Container(
            constraints: BoxConstraints(minHeight: 106),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16)),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        radioIndex = 1;
                        isSave = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.all(16),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Text(
                            LanKey.male.tr,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          if (radioIndex == 1)
                            Image.asset(
                              Assets.imageRadioS,
                              width: 21,
                              height: 21,
                              matchTextDirection: true,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 0.5,
                  indent: 16,
                  endIndent: 16,
                  color: Color(0xFFF0F1F5),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        radioIndex = 2;
                        isSave = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.all(16),
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Text(
                            LanKey.female.tr,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          if (radioIndex == 2)
                            Image.asset(
                              Assets.imageRadioS,
                              width: 21,
                              height: 21,
                              matchTextDirection: true,
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
