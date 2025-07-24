part of 'index.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

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
          title: LanKey.myCollection.tr,
        ),
        backgroundColor: AppColor.pageBackground,
        resizeToAvoidBottomInset: false,
        body: buildEmpty());
  }

  Widget buildList() {
    return ListView.separated(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
      itemCount: 50,
      itemBuilder: (_, i) {
        return Container(
          margin: EdgeInsetsDirectional.symmetric(vertical: 20),
          width: double.maxFinite,
          constraints: BoxConstraints(minHeight: 70),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/70x70"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsetsDirectional.only(start: 15, end: 5),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.transparent,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsetsDirectional.only(end: 6),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF51C75B),
                              shape: OvalBorder(),
                            ),
                          ),
                          Expanded(
                              child: Text(
                            'MysticHaze‌hggkgkggg',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.06,
                            ),
                          ))
                        ],
                      ),
                    ),
                    Text(
                      '12 years exp',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF585FC4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.06,
                      ),
                    ),
                    Rating(
                      rating: 2,
                      size: Size(16, 16),
                      fontSize: 16,
                    )
                  ],
                ),
              )),
              ChatBtn(
                fontSize: 14,
                title: "\$2/mine",
                iconSize: Size(20, 18),
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 17, vertical: 10),
                isBusy: false,
              )

              ///
            ],
          ),
        );
      },
      separatorBuilder: (_, i) {
        return Divider(
          height: 0,
          color: Color(0xFFE6E6E6),
        );
      },
    );
  }

  Widget buildEmpty() {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imageCollectionEmpty,
            width: 60,
            height: 76,
            matchTextDirection: true,
          ),
          Text(
            'No collection yet, go find an \nastrologer',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
