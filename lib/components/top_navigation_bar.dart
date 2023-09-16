import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.cyanAccent,
            ),
            child: Text("Placeholder for TopNavigationBar"),
        ),
         // Placeholder(),
      ),
    );
  }

}
