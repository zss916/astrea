import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/generated/assets.dart';

///focus
void showFocusSnackBar({required String title}) => baseSnackBar(title: title);

///black
void showBlackSnackBar({required String title}) => baseSnackBar(title: title);

///base snackBar
void baseSnackBar({required String title}) {
  Get.showSnackbar(
    GetSnackBar(
      borderRadius: 16,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      snackPosition: SnackPosition.TOP,
      messageText: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 5),
            child: Image.asset(Assets.imageRadioS, width: 21, height: 21),
          ),
        ],
      ),
      //message: widget.isFollowed ? 'Followed' : 'Unfollowed',
      duration: Duration(seconds: 1),
      backgroundColor: Colors.white,
    ),
  );
}
