import 'package:flutter/material.dart';

class TopNavigationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Background color
      elevation: 2, // Shadow elevation
      title: Text(
        'Your Company',
        style: TextStyle(
          fontSize: 24, // Adjust the font size as needed
          fontWeight: FontWeight.bold,
          color: Colors.black, // Text color
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.mail_outline, // Messages icon
            color: Colors.black,
          ),
          onPressed: () {
            // Handle messages action
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_none, // Notifications bell icon
            color: Colors.black,
          ),
          onPressed: () {
            // Handle notifications action
          },
        ),
        CircleAvatar(
          backgroundImage: AssetImage(
              'assets/profile_avatar.jpg'), // Replace with your avatar image
          radius: 20, // Adjust the size of the avatar as needed
        ),
        SizedBox(width: 16), // Add spacing between avatar and other icons
      ],
    );
  }
}
