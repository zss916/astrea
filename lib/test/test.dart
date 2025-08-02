import 'package:astrea/net/api/account.dart';

class Test {
  static testGetAccount() async {
    await AccountAPI.getAccount();
  }
}
