part of 'index.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool isSave = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.setPassword.tr,
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
          /*actions: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  // Get.back<String>(result: name);
                },
                child: Container(
                    padding: EdgeInsetsDirectional.all(6),
                    child: Text(
                      LanKey.save.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: isSave ? Color(0xFF585FC4) : Color(0x99585FC4),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            )
          ],*/
        ),
        backgroundColor: AppColor.pageBackground,
        body: Column(
          children: [
            InputUserId(
              onChange: (value) {
                //todo
              },
            ),
            InputPassword(
              title: LanKey.redeemPasswordTitle.tr,
              onChange: (value) {
                //todo
              },
            ),
            InputPassword(
              title: LanKey.confirmTheRedeemPassword.tr,
              onChange: (value) {
                //todo
              },
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(top: 16.h, start: 16, end: 16),
              child: Text(
                LanKey.invalidPasswordHint.tr,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(),
            CommonBtn(
                margin: EdgeInsetsDirectional.only(
                    start: 20, end: 20, bottom: 32.h),
                title: LanKey.save.tr,
                onTap: () {})
          ],
        ));
  }
}
