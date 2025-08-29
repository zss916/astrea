import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';

class AwesomeDateTimePicker extends StatefulWidget {
  const AwesomeDateTimePicker(
      {super.key,
      this.minDateTime,
      this.maxDateTime,
      this.initialDateTime,
      this.locale = LocaleType.en,
      this.dateFormat = AwesomeDateFormat.dMy,
      this.timeFormat = AwesomeTimeFormat.Hm,
      this.theme,
      this.onChanged,
      this.backgroundColor,
      this.fadeEffect,
      this.selectedTextStyle,
      this.unselectedTextStyle,
      this.selectorColor,
      this.visibleItemCount,
      this.itemHeight,
      this.itemWidth,
      this.isYmd});

  /// The minimum selectable date and time for the date-time picker (default 1/1/1900 00:00).
  final AwesomeDateTime? minDateTime;

  /// The maximum selectable date and time for the date-time picker (default 31/12/2100 23:59).
  final AwesomeDateTime? maxDateTime;

  /// The initial date and time displayed when the picker is first shown (default current date and time).
  final AwesomeDateTime? initialDateTime;

  /// The locale to use for displaying the date format (default [LocaleType.en].
  final LocaleType locale;

  /// The format of the date to be displayed in the picker (default [AwesomeDateFormat.dMy]).
  final AwesomeDateFormat dateFormat;

  /// The format of the time to be displayed in the picker (default [AwesomeTimeFormat.Hm]).
  final AwesomeTimeFormat timeFormat;

  /// The theme for customizing the appearance of the date-time picker (year, month, day, hour, minute themes).
  final AwesomeDateTimePickerTheme? theme;

  /// A callback function that is triggered when the selected date or time changes.
  final ValueChanged<AwesomeDateTime>? onChanged;

  /// The background color of the date-time picker.
  /// This value is overridden by the value passed in the theme's backgroundColor property.
  final Color? backgroundColor;

  /// The color of the selector (highlight) used in the date-time picker.
  final Color? selectorColor;

  /// A flag to indicate whether to apply a fade effect on the edges of the picker (default true).
  final bool? fadeEffect;

  /// The text style for the selected date and time.
  /// This value is overridden by the value passed in the theme's selectedTextStyle property.
  final TextStyle? selectedTextStyle;

  /// The text style for the unselected date and time.
  /// This value is overridden by the value passed in the theme's unselectedTextStyle property.
  final TextStyle? unselectedTextStyle;

  /// The number of visible items in the date-time picker at once.
  final int? visibleItemCount;

  /// The height of each item in the date-time picker.
  /// This value is overridden by the value passed in the theme's height property.
  final double? itemHeight;

  /// The width of each item in the date-time picker.
  /// This value is overridden by the value passed in the theme's width property.
  final double? itemWidth;

  final bool? isYmd;

  @override
  State<AwesomeDateTimePicker> createState() => _AwesomeDateTimePickerState();
}

class _AwesomeDateTimePickerState extends State<AwesomeDateTimePicker> {
  late AwesomeDateTime minDateTime;
  late AwesomeDateTime maxDateTime;
  late AwesomeDateTime initialDateTime;
  late AwesomeDateTime selectedDateTime;

  ///判断初始化是否是今天
  bool isToday = false;

  @override
  void initState() {
    minDateTime = widget.minDateTime ??
        AwesomeDateTime(
            date: AwesomeDate(year: 1910, month: 1, day: 1),
            time: AwesomeTime(hour: 00, minute: 00));

    //AwesomeTime(hour: 23, minute: 59)
    maxDateTime = widget.maxDateTime ??
        AwesomeDateTime(
            date: AwesomeDate(
                year: DateTime.now().year,
                month: DateTime.now().month,
                day: DateTime.now().day),
            time: AwesomeTime(hour: 23, minute: 59));
    initialDateTime = widget.initialDateTime ??
        AwesomeDateTime(
            date: AwesomeDate(
                year: DateTime.now().year - 25,
                month: DateTime.now().month,
                day: 15),
            time: AwesomeTime(
                hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute));
    selectedDateTime = initialDateTime;

    isToday = (initialDateTime.date ==
        AwesomeDate(
            year: DateTime.now().year,
            month: DateTime.now().month,
            day: DateTime.now().day));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AwesomeDatePicker(
          isYmd: widget.isYmd,
          theme: widget.theme?.datePickerTheme,
          backgroundColor: widget.backgroundColor,
          dateFormat: widget.dateFormat,
          locale: widget.locale,
          maxDate: maxDateTime.date,
          minDate: minDateTime.date,
          initialDate: initialDateTime.date,
          selectorColor: widget.selectorColor,
          fadeEffect: widget.fadeEffect,
          selectedTextStyle: widget.selectedTextStyle,
          unselectedTextStyle: widget.unselectedTextStyle,
          visibleItemCount: widget.visibleItemCount,
          itemHeight: widget.itemHeight,
          itemWidth: widget.itemWidth,
          onChanged: (AwesomeDate date) {
            setState(() {
              selectedDateTime.date = date;
              //debugPrint("date====>>>${date.year}/${date.month}/${date.day}");

              /*if (date.year == DateTime.now().year &&
                  date.month == DateTime.now().month &&
                  date.day == DateTime.now().day) {
                maxDateTime.time = AwesomeTime(
                    hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);

                initialDateTime.time = AwesomeTime(
                    hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);
              }*/
            });
            widget.onChanged?.call(
                AwesomeDateTime(date: date, time: selectedDateTime.time));
          },
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 35,
              padding: const EdgeInsetsDirectional.only(bottom: 4),
              alignment: AlignmentDirectional.center,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(7),
              ),
              child: const Text(
                ':',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF323133),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            AwesomeTimePicker(
              isToday: isToday,
              theme: widget.theme?.timePickerTheme,
              backgroundColor: widget.backgroundColor,
              timeFormat: widget.timeFormat,
              maxTime: maxDateTime.time,
              minTime: minDateTime.time,
              initialTime: initialDateTime.time,
              selectorColor: widget.selectorColor,
              fadeEffect: widget.fadeEffect,
              selectedTextStyle: widget.selectedTextStyle,
              unselectedTextStyle: widget.unselectedTextStyle,
              visibleItemCount: widget.visibleItemCount,
              itemHeight: widget.itemHeight,
              itemWidth: widget.itemWidth,
              onChanged: (AwesomeTime time) {
                setState(() {
                  selectedDateTime.time = time;
                });
                widget.onChanged?.call(
                    AwesomeDateTime(date: selectedDateTime.date, time: time));
              },
            )
          ],
        ),
      ],
    );
  }
}
