part of 'index.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        leading: const SizedBox.shrink(),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: Color(0xFF573F89),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() => Stack(
    alignment: AlignmentDirectional.center,
    children: [
      PositionedDirectional(
        start: 0,
        end: 0,
        top: 0,
        bottom: 0,
        child: Image.asset(Assets.imageSplashBg, matchTextDirection: true),
      ),
      Stack(
        alignment: AlignmentDirectional.center,
        children: [
          RotateWidget(
            child: Image.asset(
              Assets.imageSplashIcon,
              width: 315,
              height: 315,
              matchTextDirection: true,
            ),
          ),
          Container(
            width: 180,
            height: 140,
            alignment: AlignmentDirectional.center,
            color: Colors.transparent,
            child: AutoSizeText(
              LanKey.splashTitle.tr,
              textAlign: TextAlign.center,
              maxFontSize: 24,
              minFontSize: 20,
              style: TextStyle(
                color: const Color(0xFFD6CDFF),
                fontSize: 22,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
