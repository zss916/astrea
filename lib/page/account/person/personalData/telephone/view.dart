part of 'index.dart';

class TelephonePage extends StatelessWidget {
  const TelephonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.telephoneNumber.tr,
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
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.pageBackground,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    Assets.imageTelephoneIcon,
                    width: 124,
                    height: 120,
                    matchTextDirection: true,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 8.h),
              width: double.maxFinite,
              child: Text(
                LanKey.addYourNumber.tr,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 14,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(bottom: 10.h),
              child: Row(
                children: [
                  TelephoneCode(),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^[a-zA-Z0-9_]{1,16}$'),
                        ),
                      ],
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'telephone',
                        hintStyle: TextStyle(
                          color: const Color(0xFFA4A4A4),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          letterSpacing: 0.06,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Color(0xFFE1DFE3)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: Color(0xFFE1DFE3)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0), // 启用时的边框圆角
                          borderSide: BorderSide(
                            color: Color(0xFFE1DFE3),
                          ), // 启用时的下划线颜色设置为透明
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0), // 聚焦时的边框圆角
                          borderSide: BorderSide(
                            color: Color(0xFFE1DFE3),
                          ), // 聚焦时的下划线颜色设置为透明
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            TelephoneTerm(),
            SizedBox(height: 64.h),
            CommonBtn(
              title: LanKey.save.tr,
              isClickable: false,
              margin: EdgeInsetsDirectional.zero,
              onTap: () {},
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
