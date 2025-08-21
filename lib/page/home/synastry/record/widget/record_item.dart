import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/page/home/synastry/record/widget/radio_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class RecordItem extends StatefulWidget {
  //late bool isSelected;
  final int index;
  final Function onDelete;
  final Function onTap;
  final FriendEntity item;
  const RecordItem({
    super.key,
    required this.index,
    required this.item,
    required this.onDelete,
    required this.onTap,
  });

  @override
  _RecordItemState createState() => _RecordItemState();
}

class _RecordItemState extends State<RecordItem> {
  // bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // isSelected = !isSelected;
          widget.item.isSelected = !(widget.item.isSelected ?? false);
          widget.onTap.call();
          // widget.isSelected = !widget.isSelected;
        });
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16.r),
        ),
        width: double.maxFinite,
        constraints: BoxConstraints(minHeight: 84.h),
        child: Slidable(
          key: ValueKey("fileTag\$index"),
          groupTag: "fileTags",
          enabled: (!widget.item.isMe),
          useTextDirection: true,
          endActionPane: ActionPane(
            extentRatio: 0.28,
            motion: const DrawerMotion(),
            children: [
              CustomSlidableAction(
                onPressed: (context) {
                  widget.onDelete.call();
                },
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                autoClose: true,
                backgroundColor: const Color(0xFFF74E57),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [Icon(Icons.delete_forever_rounded, size: 30)],
                ),
              ),
            ],
          ),
          child: Container(
            height: 90,
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(0),
            ),
            child: Row(
              children: [
                RadioItem(isSelected: (widget.item.isSelected == true)),
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 12.w, end: 5.w),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Wrap(
                            spacing: 8.h,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                widget.item.nickName ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: const Color(0xFF323133),
                                  fontSize: 22.sp,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              if (widget.item.isMe)
                                Container(
                                  margin: EdgeInsetsDirectional.only(start: 0),
                                  padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: 12.w,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(50),
                                    color: Color(0xFFEDEDFE),
                                  ),
                                  child: Text(
                                    LanKey.me.tr,
                                    style: TextStyle(
                                      color: const Color(0xFF585FC4),
                                      fontSize: 14.sp,
                                      fontFamily: AppFonts.textFontFamily,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            widget.item.showBirthDay,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF91929D),
                              fontSize: 16.sp,
                              fontFamily: AppFonts.textFontFamily,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      if (widget.item.isMe) {
                        PageTools.toPersonalData();
                      } else {
                        // debugPrint("item ==> ${widget.item}");
                        PageTools.toAddFile(
                          isEditFile: true,
                          data: widget.item,
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.all(15),
                      child: Image.asset(
                        Assets.imageEditIcon,
                        matchTextDirection: true,
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
