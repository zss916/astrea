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
}
