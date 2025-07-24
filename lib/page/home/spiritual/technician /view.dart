part of 'index.dart';

class TechnicianPage extends StatelessWidget {
  const TechnicianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          toolbarHeight: 0,
          leading: const SizedBox.shrink(),
          systemOverlayStyle: barStyle,
        ),
        backgroundColor: AppColor.pageBackground,
        extendBodyBehindAppBar: true,
        body: Body());
  }
}
