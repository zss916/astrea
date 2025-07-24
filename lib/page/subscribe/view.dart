part of 'index.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 0,
          leading: const SizedBox.shrink(),
          systemOverlayStyle: barStyle,
        ),
        backgroundColor: Colors.white,
        body: SubscribeTbaView());
  }
}
