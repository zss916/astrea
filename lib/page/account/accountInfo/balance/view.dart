part of 'index.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.balanceDetails.tr,
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
        body: Body());
  }
}
