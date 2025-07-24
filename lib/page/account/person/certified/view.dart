part of 'index.dart';

class CertifiedDivinerPage extends StatelessWidget {
  const CertifiedDivinerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.certifiedDiviner.tr,
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
                buildPersonalInformation(),
                buildPersonalQualifications(),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        ));
  }

  Widget buildPersonalInformation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
              start: 16, top: 24, end: 16, bottom: 16),
          width: double.maxFinite,
          child: Text(
            LanKey.personalInformation.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
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
                title: LanKey.accountName.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'CC',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  PageTools.toCertifiedName();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.avatar.tr,
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16, vertical: 8),
                textColor: Color(0xFF6A676C),
                subWidget: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadiusDirectional.circular(100)),
                ),
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.gender.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'Female',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  PageTools.toCertifiedGender();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.age.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'October 5,1998.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.selfIntroduction.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Container(
                  constraints: BoxConstraints(maxWidth: 130.w),
                  child: Text(
                    'Personal Astrofdsfdsfsdfsd',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                onTap: () {
                  PageTools.toCertifiedIntroduction();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.preferredAstrologyMethod.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'Video',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  PageTools.toCertifiedPreference();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPersonalQualifications() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
              start: 16, top: 24, end: 16, bottom: 16),
          width: double.maxFinite,
          child: Text(
            LanKey.personalQualifications.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16),
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
                title: LanKey.astrologicalYears.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  '12',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.numberOfConsultations.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  '122',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.personalAstrologyChannelLink.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'Uploaded',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  PageTools.toCertifiedLink();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.astrologicalDirection.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'Female',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  PageTools.toAstrologicalDirection();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.stockAnalysisVideo.tr,
                textColor: Color(0xFF6A676C),
                subWidget: Text(
                  'Uploaded',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  PageTools.toUploadVideo();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
