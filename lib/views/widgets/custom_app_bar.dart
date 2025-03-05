import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/applogo.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: Colors.transparent,
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
          icon: Container(
              padding: EdgeInsets.only(left: 16), child: Applogo(width: 48)),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Urban Tutors',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Border radius
                ),
                // padding: EdgeInsets.symmetric(horizontal: 20, vertical:0), // Optional padding
              ),
              child: Text(
                'Coins | Pro',
                style: TextStyle(
                  color: ThemeConstants.secondaryColor, // Text color
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Adjust text size
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
