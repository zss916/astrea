part of 'index.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isSave = false;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.payrollAccount.tr,
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
                  //Get.back<String>(result: realName);
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
          ],
        ),
        backgroundColor: AppColor.pageBackground,
        body: SingleChildScrollView(
          child: Column(
            spacing: 24.h,
            children: [
              EditItem(
                title: LanKey.accountNameTitle.tr,
                hint: LanKey.realNameHint.tr,
                margin:
                    EdgeInsetsDirectional.only(start: 16, end: 16, top: 24.h),
                onChange: (value) {
                  //todo
                },
              ),
              EditItem(
                title: LanKey.routingCode.tr,
                hint: LanKey.routingCodeHint.tr,
                onChange: (value) {
                  //todo
                },
              ),
              EditItem(
                title: LanKey.account.tr,
                hint: LanKey.accountHint.tr,
                onChange: (value) {
                  //todo
                },
              ),
              //todo

              AccountType(
                onChecked: (value) {
                  //todo
                },
              ),

              SelectCountryItem(),
              EditItem(
                title: LanKey.payeeCity.tr,
                hint: LanKey.payeeCityHint.tr,
                onChange: (value) {
                  //todo
                },
              ),
              EditExpandItem(
                title: LanKey.payAddress.tr,
                hint: LanKey.payAddressHint.tr,
                hintFontSize: 16,
                onChange: (value) {
                  //todo
                },
              ),
              EditItem(
                title: LanKey.postalCode.tr,
                hint: LanKey.postalCodeHint.tr,
                hintFontSize: 14,
                margin: EdgeInsetsDirectional.only(
                    start: 16, end: 16, bottom: 32.h),
                onChange: (value) {
                  //todo
                },
              ),
            ],
          ),
        ));
  }
}
