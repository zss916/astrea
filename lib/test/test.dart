import 'package:astrea/net/api/account.dart';

class Test {
  static testGetAccount() async {
    await AccountAPI.getAccount();
  }

  /* static testRunGoogle() async {
    GooglePlayServicesAvailability availability = await GoogleApiAvailability
        .instance
        .checkGooglePlayServicesAvailability(true);
  }*/

  /* static testMakeGoogle() async {
    try {
      await GoogleApiAvailability.instance.isUserResolvable();
      await GoogleApiAvailability.instance.makeGooglePlayServicesAvailable();
    } on PlatformException {
      return;
    }
  }*/

  /*DottedDashedLine(
  height: 0,
  dashSpace: 8.w,
  dashWidth: 12.w,
  width: double.maxFinite,
  dashColor: Color(0xFFD9D9D9),
  axis: Axis.horizontal,
  ),*/

  /* Container(
  alignment: AlignmentDirectional.center,
  margin: EdgeInsetsDirectional.only(top: 16.h, bottom: 16.h),
  decoration: DottedDecoration(
  shape: Shape.line,
  color: Color(0xFFD9D9D9),
  dash: [12, 8],
  linePosition: LinePosition.bottom,
  ),
  ),*/

  /* Container(
  width: double.maxFinite,
  height: 100,
  padding: EdgeInsetsDirectional.all(16.r),
  decoration: DottedDecoration(
  shape: Shape.box,
  color: Color(0xFFD9D9D9),
  dash: [12, 8],
  borderRadius: BorderRadius.circular(16.r),
  ),
  child: Row(children: []),
  ),*/
}
