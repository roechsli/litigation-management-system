import 'package:flutter/material.dart';

class TableViewScreen extends StatefulWidget {
  const TableViewScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
      _TableViewScreenState();
}

class _TableViewScreenState extends State<TableViewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("new screen for table view"),
    );
  }
}