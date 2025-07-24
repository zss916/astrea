part of 'index.dart';

class CertifiedLinkPage extends StatefulWidget {
  const CertifiedLinkPage({super.key});

  @override
  State<CertifiedLinkPage> createState() => _CertifiedGenderPageState();
}

class _CertifiedGenderPageState extends State<CertifiedLinkPage> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.link.tr,
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
        body: Container(
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 24.h),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 54,
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(16)),
                child: TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(100)],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: LanKey.linkHint.tr,
                    hintStyle:
                        TextStyle(color: Color(0xFF91929D), fontSize: 16),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      num = value.trim().length;
                      // introduction = value.trim();
                    });
                  },
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsetsDirectional.only(start: 16, top: 8, end: 16),
                child: Text(
                  LanKey.linkTip.tr,
                  style: TextStyle(
                    color: const Color(0xFF91929D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
