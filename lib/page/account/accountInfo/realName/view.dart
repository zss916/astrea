part of 'index.dart';

class RealNamePage extends StatefulWidget {
  const RealNamePage({super.key});

  @override
  State<RealNamePage> createState() => _RealNamePageState();
}

class _RealNamePageState extends State<RealNamePage> {
  String? realName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.realName.tr,
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
                  Get.back<String>(result: realName);
                },
                child: Container(
                    padding: EdgeInsetsDirectional.all(6),
                    child: Text(
                      LanKey.save.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: (realName ?? "").isNotEmpty
                            ? Color(0xFF585FC4)
                            : Color(0x99585FC4),
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
                realName = value.trim();
              });
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: LanKey.realNameHint.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
          ),
        ));
  }
}
