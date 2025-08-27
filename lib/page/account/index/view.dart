part of 'index.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  final bool isUser = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.myFile.tr,
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
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColor.pageBackground,
      body: Column(
        children: [
          AccountTop(isUser: true),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildPersonalData(),
                  if (!isUser) buildAccountInformation(),
                  buildLawAndPrivacy(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPersonalData() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            top: 16,
            end: 16,
            bottom: 16,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.personalDataTitle.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16),
          constraints: BoxConstraints(minHeight: 336),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(
                title: LanKey.accountInformation.tr,
                onTap: () {
                  // PageTools.toAccountInformation(account: );
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.personalData.tr,
                onTap: () {
                  //  PageTools.toPersonalData(account: );
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.certifiedDiviner.tr,
                subWidget: CertifiedLabel(state: 2),
                onTap: () {
                  PageTools.toCertifiedDiviner();
                },
              ),
              CommonDivider(),
              CommonItem(title: LanKey.contactUs.tr),
              CommonDivider(),
              CommonItem(title: LanKey.scoring.tr),
              CommonDivider(),
              NoticeItem(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAccountInformation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            top: 24,
            end: 16,
            bottom: 16,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.accountInformation.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16),
          constraints: BoxConstraints(minHeight: 224),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(
                title: LanKey.realName.tr,
                onTap: () {
                  PageTools.toRealName();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.paymentInformation.tr,
                onTap: () {
                  PageTools.toPayment();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.accountBalance.tr,
                onTap: () {
                  PageTools.toBalance();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.individualPrice.tr,
                onTap: () {
                  PageTools.toIndividualPrice();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLawAndPrivacy() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            top: 24,
            end: 16,
            bottom: 16,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.lawAndPrivacy.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 60.h),
          constraints: BoxConstraints(minHeight: 224),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(title: LanKey.agreement.tr),
              CommonDivider(),
              CommonItem(
                title: LanKey.subscriptionTerms.tr,
                onTap: () {
                  PageTools.toWeb(
                    title: LanKey.startTermsOfService.tr,
                    url: AppSetting.term,
                  );
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.privacyPolicy.tr,
                onTap: () {
                  PageTools.toWeb(
                    title: LanKey.startPrivacyPolicy.tr,
                    url: AppSetting.policy,
                  );
                },
              ),
              CommonDivider(),
              CommonItem(title: LanKey.contentRules.tr),
            ],
          ),
        ),
      ],
    );
  }
}
