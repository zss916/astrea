import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioItem extends StatefulWidget {
  final bool isSelected;
  const RadioItem({super.key, required this.isSelected});

  @override
  _RadioItemState createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.isSelected ? Assets.imageRadioS : Assets.imageRadioU,
      matchTextDirection: true,
      width: 30.r,
      height: 30.r,
    );
  }
}
