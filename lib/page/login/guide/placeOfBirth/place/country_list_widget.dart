import 'dart:convert';

import 'package:astrea/generated/assets.dart';
import 'package:astrea/net/bean/country_entity.dart';
import 'package:astrea/page/login/guide/placeOfBirth/index.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/place_item.dart';
import 'package:azlistview_plus/azlistview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int currentIndex = -1;
  final ItemScrollController _scrollController = ItemScrollController();

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
          itemCount: widget.logic.keyCountryCount,
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
        ),
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
                        color: currentIndex == index ? Color(0xFF766DF8) : null,
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

///本地缓存
class LocalCacheCountryWidget extends StatefulWidget {
  final PlaceOfBirthLogic logic;

  final Function(String place, String latitude, String longitude)? onSelect;
  const LocalCacheCountryWidget({
    super.key,
    required this.logic,
    this.onSelect,
  });

  @override
  State<LocalCacheCountryWidget> createState() =>
      _LocalCacheCountryWidgetState();
}

class _LocalCacheCountryWidgetState extends State<LocalCacheCountryWidget> {
  List<CountryEntity> data = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
      data: data,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        CountryEntity country = data[index];
        return InkWell(
          onTap: () {
            widget.logic.selectCountry(
              country,
              onSelect: (String place, String latitude, String longitude) {
                widget.onSelect?.call(place, latitude, longitude);
              },
            );
          },
          child: PlaceItem(
            index: -1,
            isSelected: country.isSelected ?? false,
            firstLetter: country.firstLetter ?? "",
            name: country.name ?? "",
          ),
        );
      },
      physics: BouncingScrollPhysics(),
      susItemBuilder: (BuildContext context, int index) {
        CountryEntity country = data[index];
        return Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 16.0),
          //color: Color(0xFFF3F4F5),
          color: Color(0xFFEAE9F1),
          alignment: Alignment.centerLeft,
          child: Text(
            country.getSuspensionTag(),
            softWrap: false,
            style: TextStyle(fontSize: 18.0, color: const Color(0xFF323133)),
          ),
        );
      },
      indexBarData: [...widget.logic.countryKeys],
      indexBarOptions: IndexBarOptions(
        needRebuild: true,
        ignoreDragCancel: true,
        downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
        downItemDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF766DF8),
        ),
        indexHintWidth: 120 / 2,
        indexHintHeight: 100 / 2,
        indexHintDecoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesIcIndexBarBubbleGray),
            fit: BoxFit.contain,
          ),
        ),
        indexHintAlignment: Alignment.centerRight,
        indexHintChildAlignment: Alignment(-0.25, 0.0),
        indexHintOffset: Offset(-20, 0),
      ),
    );
  }

  void loadData() async {
    rootBundle.loadString('assets/data/country_data.json').then((value) {
      List list = json.decode(value);
      for (var v in list) {
        data.add(CountryEntity.fromJson(v));
      }
      _handleList(data);
    });
  }

  void _handleList(List<CountryEntity> list) {
    if (list.isEmpty) return;
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(data);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(data);

    setState(() {});
  }
}
