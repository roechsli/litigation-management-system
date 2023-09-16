import 'package:flutter/material.dart';
import 'package:litigation_management_system/components/category_overview.dart';
import 'package:litigation_management_system/components/location_charts.dart';
import 'package:litigation_management_system/components/top_navigation_header.dart';
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

          // charts
          Row(
            children: [
              // locations, active/passive, divisions
              SizedBox(
                width: 800,
                child: LocationCharts(),
              ),
              // categories and summary
              SizedBox(
                width: 300,
                child: SummaryOverview(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dashboardWebView() {
    return WebsiteViewer(
        url:
            'https://public.tableau.com/app/profile/wwael/viz/Implenia/Implenia?publish=yes');
  }
}
