import 'package:flutter/material.dart';
import 'package:litigation_management_system/repositories/claims_repository.dart';
import 'package:litigation_management_system/screens/claim_view.dart';

final GlobalKey<_TableViewScreenState> tableViewKey = GlobalKey<_TableViewScreenState>();

class TableViewScreen extends StatefulWidget {
   TableViewScreen({Key? key}) : super(key: key);

  @override
  State<TableViewScreen> createState() => _TableViewScreenState();

}

class _TableViewScreenState extends State<TableViewScreen> {
  // Define a list of colors to cycle through
  final List<Color> cardColors = [
    Color(0xFF4FC3F7), // Light teal (Hex: #4FC3F7)
    Color(0xFFFFB74D), // Light orange (Hex: #FFB74D)
    Color(0xFFFF77A9), // Light pink (Hex: #FF77A9)
  ];

    int colorIndex = 0;

      // Function to update the data and trigger a rebuild
  void updateData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns in the grid
      ),
      itemCount: ClaimsRepository.claims.length,
      itemBuilder: (BuildContext context, int index) {
        // Create a card for each claim
        var claim = ClaimsRepository.claims[index];
        final currentColor = cardColors[colorIndex % cardColors.length]; // Get the current color
        colorIndex++; // Move to the next color
        return GestureDetector(
            onTap: () {
              //TODO:  Navigate to the "View Claim" screen when tapped

            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Rounded corners
              ),
              shadowColor: Colors.grey,
              color: currentColor, // Use the current color
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Division: ${claim.division}"),
                    Text("Country: ${claim.country}"),
                    // Add more Text widgets for other claim properties
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
