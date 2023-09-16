import 'package:flutter/material.dart';
import 'package:litigation_management_system/widgets/local_video_player.dart';
import 'package:litigation_management_system/widgets/web_view_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class StandaloneWebViewScreen extends StatefulWidget {
  const StandaloneWebViewScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StandaloneWebViewScreenState();
}

class _StandaloneWebViewScreenState extends State<StandaloneWebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: dashboardWebView(),
    );
  }

  Widget dashboardWebView() {
    return ButterFlyAssetVideo();
  }
  // Widget dashboardWebView() {
  //   final url1 =
  //       'https://public.tableau.com/app/profile/wwael/viz/Implenia/Implenia?publish=yes';
  //   final url2 = 'https://www.google.com';

  //   return WebsiteViewer(url: url2);
  // }
}
