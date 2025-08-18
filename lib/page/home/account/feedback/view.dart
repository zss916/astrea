part of 'index.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int num = 0;
  String feedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘影响布局
      appBar: ComAppBar(
        title: LanKey.feedback.tr,
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
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.only(start: 16, end: 16, top: 16.h),
            child: Container(
              width: double.maxFinite,
              height: 310,
              padding: EdgeInsetsDirectional.all(10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
              child: Container(
                color: Colors.transparent,
                width: double.maxFinite,
                height: double.maxFinite,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  style: TextStyle(
                    color: const Color(0xFF6A676C),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.textFontFamily,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: LanKey.feedbackHint.tr,
                    hintStyle: TextStyle(
                      color: Color(0xFF91929D),
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      num = value.trim().length;
                      feedback = value.trim();
                    });
                  },
                ),
              ),
            ),
          ),
          Spacer(),
          CommonBtn(
            margin: EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              bottom: bottomPadding,
            ),
            isClickable: num > 0,
            title: LanKey.send.tr,
            onTap: () {
              if (num > 0 && feedback.isNotEmpty) {
                launchEmail(emailContent: feedback);
              }
            },
          ),
        ],
      ),
    );
  }
}
