import 'package:flutter/material.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/spiritual/widget/spiritual_item.dart';

class HorizontalListview extends StatelessWidget {
  final String title;
  final String subTitle;
  late bool isLoading = false;

  HorizontalListview({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(start: 15, end: 5),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  //todo
                  PageTools.toSpiritualList();
                },
                child: Container(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 2),
                  child: Text(
                    'All>>',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: const Color(0xFF585FC4),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 15, end: 7),
          width: double.maxFinite,
          child: Text(
            subTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: const Color(0xFF91929D),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 15, top: 7, bottom: 22),
          width: double.maxFinite,
          height: 150,
          child: isLoading
              ? ListView.separated(
                  shrinkWrap: false,
                  cacheExtent: 500,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  padding: EdgeInsetsDirectional.only(end: 10),
                  separatorBuilder: (_, i) {
                    return VerticalDivider(
                      width: 10,
                      color: Colors.transparent,
                    );
                  },
                  itemBuilder: (_, i) {
                    return Container(
                      width: 112,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        color: Colors.grey,
                      ),
                    );
                  },
                )
              : ListView.separated(
                  shrinkWrap: false,
                  cacheExtent: 500,
                  //itemExtent: 112,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3 + 1,
                  padding: EdgeInsetsDirectional.only(end: 10),
                  separatorBuilder: (_, i) =>
                      VerticalDivider(width: 10, color: Colors.transparent),
                  itemBuilder: (_, i) {
                    return i == 3
                        ? buildMore()
                        : SpiritualItem(width: 112, height: 150);
                  },
                ),
        ),
      ],
    );
  }

  Widget buildMore() {
    return Container(
      width: 65,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFFFCFCFD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imageMoreArrow,
            matchTextDirection: true,
            width: 26,
            height: 26,
          ),
          Text(
            'More',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF585FC4),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
