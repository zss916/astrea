import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class SaveAction extends StatefulWidget {
  final bool isSave;
  final Function(bool)? onTap;

  const SaveAction({super.key, required this.isSave, this.onTap});

  @override
  _SaveActionState createState() => _SaveActionState();
}

class _SaveActionState extends State<SaveAction> {
  bool isSaved = false;
  @override
  void initState() {
    super.initState();
    isSaved = widget.isSave;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          setState(() {
            isSaved = !isSaved;
            widget.onTap?.call(isSaved);
          });
        },
        child: Image.asset(
          isSaved ? Assets.imageSaveS : Assets.imageSave,
          matchTextDirection: true,
          width: 40,
          height: 40,
        ),
      ),
    );
  }
}
