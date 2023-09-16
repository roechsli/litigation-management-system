import 'package:flutter/material.dart';
import 'package:litigation_management_system/components/category_overview.dart';
import 'package:litigation_management_system/components/location_charts.dart';
import 'package:litigation_management_system/components/top_navigation_header.dart';

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
            children: const [
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
}
