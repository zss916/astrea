import 'package:astrea/net/api/account.dart';

class Test {
  static testGetAccount() async {
    await AccountAPI.getAccount();
  }

  static testNickName() async {
    isMatchName("Macj dsfad ");
  }

  static bool isMatchName(String? value) {
    if (value == null || value.isEmpty) return false;
    //final regex = RegExp(r'^[a-zA-Z0-9_]{1,16}$');
    final regex = RegExp(r'^.{0,16}$');
    // final regex = RegExp(r'\w\W]{0,16}$');
    if (regex.hasMatch(value)) return true;
    return false;
  }
}
