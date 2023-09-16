import 'package:flutter/material.dart';

class SummaryOverview extends StatelessWidget {
  const SummaryOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.lightGreenAccent,
          ),
          child: Text("Placeholder for SummaryOverview"),
        ),
      ),
    );
  }
}
