import 'package:astrea/components/common_app_bar.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late WebViewController webViewController;
  String _lastUrl = "";
  String url = "";
  String title = "";
  String javaScriptChannelName = "Astrea";
  @override
  void initState() {
    super.initState();
    var arguments = Get.arguments as Map<String, dynamic>;
    title = arguments["title"];
    url = arguments["url"];
    initWebController();
  }

  @override
  void dispose() {
    super.dispose();
    webViewController.clearLocalStorage();
    webViewController.clearCache();
    webViewController.removeJavaScriptChannel(javaScriptChannelName);
  }

  void initWebController() {
    webViewController = WebViewController()
      ..addJavaScriptChannel(javaScriptChannelName, onMessageReceived: (e) {})
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColor.pageBackground)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("progress: $progress");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            if (!request.url.startsWith('http')) {
              if (await launchUrl(Uri.parse(request.url))) {
                return NavigationDecision.prevent;
              }
            }
            if (_lastUrl == request.url) {
              return NavigationDecision.navigate;
            } else {
              webViewController.loadRequest(
                Uri.parse(request.url),
                headers: {"referer": _lastUrl},
              );
              _lastUrl = request.url;
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    _lastUrl = url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: title,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 16),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => Get.back(),
                child: Image.asset(
                  Assets.imageBackIcon,
                  matchTextDirection: true,
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.pageBackground,
      body: WebViewWidget(controller: webViewController),
    );
  }
}
