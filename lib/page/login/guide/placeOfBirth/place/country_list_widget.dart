import 'package:astrea/net/bean/country_entity.dart';
import 'package:astrea/page/login/guide/placeOfBirth/index.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/place_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CountryWidget extends StatefulWidget {
  final PlaceOfBirthLogic logic;
  final List<String> az;
  final Function(String place, String latitude, String longitude)? onSelect;
  const CountryWidget({
    super.key,
    required this.logic,
    required this.az,
    this.onSelect,
  });

  @override
  State<CountryWidget> createState() => _CountryWidgetState();
}

class _CountryWidgetState extends State<CountryWidget> {
  //List<String> _az = [];

  int currentIndex = -1;
  final ItemScrollController _scrollController = ItemScrollController();
  // late ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        ScrollablePositionedList.builder(
          physics: BouncingScrollPhysics(),
          itemScrollController: _scrollController,
          itemBuilder: (context, index) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.logic.valueCountryCount(index),
              itemBuilder: (_, i) {
                CountryEntity country =
                    (widget.logic.countryData[widget.logic.countryData.keys
                        .toList()[index]] ??
                    [])[i];
                return InkWell(
                  onTap: () {
                    widget.logic.selectCountry(
                      country,
                      onSelect:
                          (String place, String latitude, String longitude) {
                            widget.onSelect?.call(place, latitude, longitude);
                          },
                    );
                  },
                  child: PlaceItem(
                    index: i,
                    isSelected: country.isSelected ?? false,
                    firstLetter: country.firstLetter ?? "",
                    name: country.name ?? "",
                  ),
                );
              },
            );
          },
          itemCount: widget.logic.keyCountryCount,
        ),

        /*ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          controller: controller,
          padding: EdgeInsets.only(bottom: 80.h, top: 20.h),
          itemCount: widget.logic.keyCountryCount,
          itemBuilder: (_, index) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.logic.valueCountryCount(index),
            itemBuilder: (_, i) {
              CountryEntity country =
                  (widget.logic.countryData[widget.logic.countryData.keys
                      .toList()[index]] ??
                  [])[i];
              return InkWell(
                onTap: () {
                  widget.logic.selectCountry(
                    country,
                    onSelect:
                        (String place, String latitude, String longitude) {
                          widget.onSelect?.call(place, latitude, longitude);
                        },
                  );
                },
                child: PlaceItem(
                  index: i,
                  isSelected: country.isSelected ?? false,
                  firstLetter: country.firstLetter ?? "",
                  name: country.name ?? "",
                ),
              );
            },
          ),
        ),*/
        PositionedDirectional(
          end: 0,
          child: GestureDetector(
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 0),
              width: 40,
              // 导航条
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                    // 这里做了一个按压或移动滑动的触发效果
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: currentIndex == index ? Colors.redAccent : null,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        widget.az[index],
                        style: TextStyle(
                          fontSize: 12,
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: widget.az.length,
              ),
            ),
            //手指按下触发 竖着划就用onVertica XXX回调
            onVerticalDragDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              int i = e.localPosition.dy ~/ 15;
              setState(() {
                currentIndex = i;
                _scrollController.jumpTo(index: i);
              });
              print("按下 ${widget.az[i]}");
            },
            //手指滑动时会触发此回调
            onVerticalDragUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移
              int i = e.localPosition.dy ~/ 15;
              widget.az.length;
              if (i >= 0 && i <= widget.az.length - 1) {
                if (i != currentIndex) {
                  setState(() {
                    // 当前选中的index 默认-1
                    currentIndex = i;
                    _scrollController.jumpTo(index: i);
                  });
                  print("滑动 ${widget.az[i]}");
                }
              }
            },
            // 手指抬起
            onTapUp: (e) {
              // 手指抬起
              setState(() {
                currentIndex = -1;
              });
            },
            // 移动取消
            onVerticalDragEnd: (e) {
              // 移动取消
              setState(() {
                currentIndex = -1;
              });
            },
          ),
        ),
      ],
    );
  }
}

class CountryListWidget extends StatelessWidget {
  final PlaceOfBirthLogic logic;
  final Function(String place, String latitude, String longitude)? onSelect;
  const CountryListWidget({super.key, required this.logic, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 80.h, top: 20.h),
      itemCount: logic.keyCountryCount,
      itemBuilder: (_, index) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: logic.valueCountryCount(index),
        itemBuilder: (_, i) {
          CountryEntity country =
              (logic.countryData[logic.countryData.keys.toList()[index]] ??
              [])[i];
          return InkWell(
            onTap: () {
              logic.selectCountry(
                country,
                onSelect: (String place, String latitude, String longitude) {
                  onSelect?.call(place, latitude, longitude);
                },
              );
            },
            child: PlaceItem(
              index: i,
              isSelected: country.isSelected ?? false,
              firstLetter: country.firstLetter ?? "",
              name: country.name ?? "",
            ),
          );
        },
      ),
    );
  }
}
