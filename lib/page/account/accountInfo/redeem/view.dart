part of 'index.dart';

class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.redeem.tr,
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
        ),
        backgroundColor: AppColor.pageBackground,
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                RedeemAccount(
                  account: "123456789987654321",
                  onTap: () {
                    //todo
                  },
                ),
                NoticeWidget(title: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"),
                Container(
                    padding: EdgeInsetsDirectional.all(16),
                    margin: EdgeInsetsDirectional.only(
                        start: 16, end: 16, top: 22.h),
                    constraints: BoxConstraints(minHeight: 340.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(16),
                    ),
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        RedeemTop(
                          balance: "9999.99",
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFFD9D9D9), width: 1))),
                          width: double.maxFinite,
                          height: 56,
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Only multiples of 10 allowed.",
                                    fillColor: Colors.transparent,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 4.w),
                                    filled: true,
                                    hintStyle: TextStyle(
                                      color: Color(0xFF91929D),
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                                onChanged: (value) {
                                  //todo
                                },
                              )),
                              VerticalDivider(
                                width: 5.w,
                                color: Colors.transparent,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(4),
                                  onTap: () {
                                    //todo
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        LanKey.coins.tr,
                                        style: TextStyle(
                                          color: const Color(0xFF323133),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 12.h,
                          color: Colors.transparent,
                        ),
                        BankTransactionFree(),
                        SizedBox(
                          height: 4.h,
                        ),
                        PlatformServiceFree(),
                        Divider(
                          height: 16.h,
                          color: Colors.transparent,
                        ),
                        ReceiveInput(onChanged: (value) {
                          //todo
                        }),
                        Divider(
                          height: 20.h,
                          color: Colors.transparent,
                        ),
                        ApplyBtn(
                          isClickable: true,
                          onTap: () {
                            //showPasswordDialog();
                            showLoginPasswordSheet();
                          },
                        ),
                      ],
                    )),
                Rules()
              ],
            ),
          ),
        ));
  }
}
