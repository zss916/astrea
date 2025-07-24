part of 'index.dart';

class RewardDetailsPage extends StatelessWidget {
  const RewardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: "Withdraw Details",
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
          child: buildApply(),
        ));
  }

  Widget buildReward() {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 24.h),
          constraints: BoxConstraints(minHeight: 230),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(
                title: LanKey.chatterID.tr,
                subTitle: "123456789",
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.rewardDate.tr,
                subTitle: "09/10/2025",
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.reward.tr,
                subTitle: "\$49.2",
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.reason.tr,
                subTitle: "Interpreting the Star Chart for Customers",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildApply() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 24.h),
            constraints: BoxConstraints(minHeight: 168),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            width: double.maxFinite,
            child: Column(
              children: [
                CommonItem(
                  title: LanKey.chatterID.tr,
                  subTitle: "123456789",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.applyAmount.tr,
                  subTitle: "\$49.2",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.applyDate.tr,
                  subTitle: "09/10/2025",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 16.h),
            constraints: BoxConstraints(minHeight: 280),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            width: double.maxFinite,
            child: Column(
              children: [
                CommonItem(
                  title: LanKey.actualReceivedAmount.tr,
                  subTitle: "\$49.2",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.bankTransactionFee.tr,
                  subTitle: "\$49.2",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.platformServiceFee.tr,
                  subTitle: "\$0",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.cashName.tr,
                  subTitle: "LULI",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.cashAccount.tr,
                  subTitle: "09876542",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 16.h),
            constraints: BoxConstraints(minHeight: 168),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            width: double.maxFinite,
            child: Column(
              children: [
                CommonItem(
                    title: LanKey.state.tr,
                    subTitle: "Withdraw Successed",
                    textColor: Color(0xFF0CA919)),
                CommonDivider(),
                CommonItem(
                  title: LanKey.passedTime.tr,
                  subTitle: "09/10/2025",
                ),
                CommonDivider(),
                CommonItem(
                  title: LanKey.paymentTime.tr,
                  subTitle: "09/10/2025",
                ),
              ],
            ),
          ),
          Divider(
            height: 32.h,
            color: Colors.transparent,
          )
        ],
      ),
    );
  }
}
