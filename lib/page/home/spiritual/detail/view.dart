part of 'index.dart';

class SpiritualListPage extends StatelessWidget {
  const SpiritualListPage({super.key});

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
          title: " Today's top",
        ),
        backgroundColor: AppColor.pageBackground,
        resizeToAvoidBottomInset: false,
        body: GridView.builder(
            itemCount: 50,
            padding: EdgeInsetsDirectional.only(
                start: 16, end: 16, bottom: 20, top: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 116 / 154,
            ),
            itemBuilder: (context, index) {
              return SpiritualItem(
                width: double.maxFinite,
                height: 154,
              );
            }));
  }
}
