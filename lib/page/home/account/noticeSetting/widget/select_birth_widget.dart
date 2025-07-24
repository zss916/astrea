import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';

class SelectTimeWidget extends StatelessWidget {
  const SelectTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 0),
      decoration: BoxDecoration(),
      width: double.maxFinite,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
              height: 35,
              width: 180,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Color(0xFFEDEDFD),
                  borderRadius: BorderRadiusDirectional.circular(100))),
          AwesomeTimePicker(
            timeFormat: AwesomeTimeFormat.Hm,
            backgroundColor: Colors.transparent,
            itemWidth: 100,
            fadeEffect: false,
            selectorColor: Colors.transparent,
            onChanged: (AwesomeTime time) {
              debugPrint("----Time changed : ${time.hour}:${time.minute}\n");
            },
          )
        ],
      ),
    );
  }
}
