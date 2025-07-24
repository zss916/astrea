import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/components/snackbar/snackbar.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class FollowBtn extends StatefulWidget {
  late bool isFollowed;
  final Function(bool)? onChange;
  FollowBtn({super.key, required this.isFollowed, this.onChange});

  @override
  _FollowBtnState createState() => _FollowBtnState();
}

class _FollowBtnState extends State<FollowBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isFollowed = !widget.isFollowed;
          widget.onChange?.call(widget.isFollowed);
        });

        showFocusSnackBar(title: LanKey.focusTip.tr);
      },
      child: Container(
        height: 58,
        padding: EdgeInsetsDirectional.only(end: 2, start: 2),
        decoration: BoxDecoration(
          color: Color(widget.isFollowed ? 0xFF91929D : 0xFFBE62FE),
          borderRadius: BorderRadiusDirectional.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 1),
              child: Image.asset(
                widget.isFollowed
                    ? Assets.imageFollowed
                    : Assets.imageFollowAdd,
                matchTextDirection: true,
                width: 23,
                height: 23,
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(end: 6),
              child: Text(
                'Follow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
