part of 'index.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<ResultLogic>(
        init: ResultLogic(),
        builder: (logic) => PlayerView(),
      ),
    );
  }
}
