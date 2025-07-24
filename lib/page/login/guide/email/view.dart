part of 'index.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(),
        backgroundColor: AppColor.pageBackground,
        resizeToAvoidBottomInset: false,
        body: GetBuilder<EmailLogic>(
            init: EmailLogic(),
            builder: (logic) => InputLogin(
                  logic: logic,
                )));
  }
}
