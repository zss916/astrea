import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/generated/assets.dart';

class InputPassword extends StatefulWidget {
  final String title;
  final Function(String) onChange;
  const InputPassword({super.key, required this.title, required this.onChange});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 24.h, start: 16, end: 16),
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Text(
              widget.title,
              textAlign: TextAlign.start,
              style: TextStyle(color: const Color(0xFF6A676C), fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 16.h),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            width: double.maxFinite,
            child: TextField(
              //autofocus: true,
              obscureText: obscureText,
              obscuringCharacter: '*',
              style: TextStyle(color: const Color(0xFF323133), fontSize: 16),
              onChanged: (value) {
                widget.onChange.call(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "xxxxxxxxxxxxxxx",
                hintStyle: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        obscureText
                            ? Assets.imageEyeClose
                            : Assets.imageEyeOpen,
                        width: 24,
                        height: 24,
                        matchTextDirection: true,
                      ),
                    ],
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
