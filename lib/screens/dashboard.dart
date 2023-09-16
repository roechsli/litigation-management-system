import 'package:flutter/material.dart';
import 'package:litigation_management_system/components/category_overview.dart';
import 'package:litigation_management_system/components/location_charts.dart';
import 'package:litigation_management_system/components/top_navigation_header.dart';
import 'package:litigation_management_system/widgets/local_video_player.dart';
import 'package:litigation_management_system/widgets/web_view_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // topnavigationbar
          TopNavigationHeader(),
          dashboardWebView()
        ],
      ),
    );
  }

  Widget dashboardWebView() {
    return ButterFlyAssetVideo();
  }
}
