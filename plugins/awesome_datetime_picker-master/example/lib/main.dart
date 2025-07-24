import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ///日期
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                  height: 35,
                  width: double.maxFinite,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(7))),
              AwesomeDatePicker(
                space: 70,
                dateFormat: AwesomeDateFormat.mMdy,
                backgroundColor: Colors.transparent,
                fadeEffect: false,
                selectorColor: Colors.transparent,
                //visibleItemCount: ,
                // dateFormat: AwesomeDateFormat.dMMy,
                //minDate: AwesomeDate(year: 2025, month: 2, day: 15),
                //maxDate: AwesomeDate(year: 2026, month: 10, day: 10),
                onChanged: (AwesomeDate date) {
                  print(
                      "----Date changed : ${date.day}/${date.month}/${date.year}\n");
                },
              )
            ],
          ),

          ///时间
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                  height: 35,
                  width: 215,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(7))),
              AwesomeTimePicker(
                timeFormat: AwesomeTimeFormat.Hm,
                backgroundColor: Colors.transparent,
                itemWidth: 100,
                fadeEffect: false,
                selectorColor: Colors.transparent,
                onChanged: (AwesomeTime time) {
                  print("----Time changed : ${time.hour}:${time.minute}\n");
                },
              )
            ],
          ),

          ///日期时间
          /*Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                  height: 35,
                  width: 215,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(7))),
              AwesomeTimePicker(
                timeFormat: AwesomeTimeFormat.notify,
                backgroundColor: Colors.transparent,
                fadeEffect: false,
                selectorColor: Colors.transparent,
              )
            ],
          ),*/

          AwesomeDateTimePicker(
            isYmd: true,
            dateFormat: AwesomeDateFormat.yMMd,
            timeFormat: AwesomeTimeFormat.hm,
            backgroundColor: Colors.white,
            fadeEffect: false,
            selectorColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
