import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); 

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor:
            Colors.transparent, 
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 255, 255),
                const Color.fromARGB(255, 255, 255, 255)
              ], 
            ),
            borderRadius: BorderRadius.only(),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer(); 
          },
        ),
        title: const Text(
          'UrbanPro',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24, 
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Border radius
                ),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical:0), // Optional padding
              ),
              child: Text(
                'Go Live',
                style: TextStyle(
                  color: ThemeConstants.primaryColor, // Text color
                  fontWeight: FontWeight.bold,
                  fontSize: 11, // Adjust text size
                ),
              ),
            ),
          ),

          // Notifications Button
        ],
      ),
    );
  }
}
