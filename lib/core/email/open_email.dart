import 'package:astrea/core/toast/app_loading.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchEmail({String? emailContent}) async {
  Uri uri = Uri(
    scheme: 'mailto',
    path: GetPlatform.isIOS
        ? "contactus@theappastro.com"
        : 'contactus@socialhaventl.com',
    query: 'subject=Astrea feedback&body=$emailContent',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    AppLoading.toast("Unable to open email");
    throw 'Unable to open email';
  }
}
