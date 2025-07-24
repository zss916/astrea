part of 'index.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
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
          title: LanKey.report.tr,
        ),
        backgroundColor: AppColor.pageBackground,
        body: Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 16.h),
              width: double.maxFinite,
              child: Text(
                'How was the chat with \nteacher [Name]?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 22,
                ),
              ),
            ),
            /*RatingBar(
                allowHalfRating: true,
                ratingWidget:
                    RatingWidget(full: full, half: half, empty: empty),
                onRatingUpdate: onRatingUpdate)*/
          ],
        ));
  }
}
