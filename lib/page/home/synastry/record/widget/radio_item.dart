import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

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
      width: 30,
      height: 30,
    );
  }
}
