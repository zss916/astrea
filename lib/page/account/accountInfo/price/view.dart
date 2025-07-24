part of 'index.dart';

class IndividualPricePage extends StatelessWidget {
  const IndividualPricePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.individualPrice.tr,
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
        body: Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 24.h),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(16)),
          width: double.maxFinite,
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 16,
            ),
            onChanged: (value) {},
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixText: "\$",
                prefixStyle: TextStyle(fontSize: 16, color: Color(0xFF323133)),
                hintText: "0",
                hintStyle: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                suffixText: "Mine",
                suffixStyle: TextStyle(fontSize: 16, color: Color(0xFF91929D)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
          ),
        ));
  }
}
