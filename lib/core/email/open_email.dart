import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchEmail({String? emailContent}) async {
  String uid = AccountService.to.userID;
  String device = GetPlatform.isIOS ? "iOS" : "Android";
  Uri uri = Uri(
    scheme: 'mailto',
    path: "contactus@theappastro.com",
    query: 'subject=[$uid] $device Feedback&body=$emailContent',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    AppLoading.toast("Unable to open email");
    throw 'Unable to open email';
  }
}
