part of 'index.dart';

class CertifiedNamePage extends StatefulWidget {
  const CertifiedNamePage({super.key});

  @override
  State<CertifiedNamePage> createState() => _CertifiedNamePageState();
}

class _CertifiedNamePageState extends State<CertifiedNamePage> {
  int num = 0;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.name.tr,
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
                  Get.back<String>(result: name);
                },
                child: Container(
                    padding: EdgeInsetsDirectional.all(6),
                    child: Text(
                      LanKey.save.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: num > 0 ? Color(0xFF585FC4) : Color(0x99585FC4),
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
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(16)),
          width: double.maxFinite,
          child: TextField(
            autofocus: true,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 16,
            ),
            onChanged: (value) {
              setState(() {
                num = value.trim().length;
                name = value.trim();
              });
            },
            inputFormatters: [LengthLimitingTextInputFormatter(24)],
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: LanKey.name.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                suffixText: "$num/24"),
          ),
        ));
  }
}
