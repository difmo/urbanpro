import 'package:URBANPRO/utils/colors.dart';
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
                AppColors.secondaryColor,
                AppColors.primaryColor
              ], 
            ),
            borderRadius: BorderRadius.only(),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer(); 
          },
        ),
        title: const Text(
          'UrbanPro',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24, 
          ),
        ),
        actions: <Widget>[
          // List Our Property Button (New)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                // Navigator.pushNamed(context,
                //     AppRoutes.HOME); // Navigate to list our property screen
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white), // White border color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Border radius
                ),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical:0), // Optional padding
              ),
              child: Text(
                'Go Live',
                style: TextStyle(
                  color: Colors.white, // Text color
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
