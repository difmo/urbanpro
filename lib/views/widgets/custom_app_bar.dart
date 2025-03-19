import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/applogo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int notificationCount;
  final Color? backgroundColor;
  final Color? actionBarColor; // New: Color for action bar only
  final String? title;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    this.notificationCount = 1,
    this.backgroundColor,
    this.actionBarColor,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: backgroundColor == null
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF4A90E2), // Smooth blue gradient
                      Color(0xFF50E3C2),
                    ],
                  )
                : null,
            color: backgroundColor ?? Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.only(left: 16),
            child: Applogo(width: 48),
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          title!,
          style: TextStyle(
            color: ThemeConstants.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          // Coins button with icon
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: actionBarColor ?? Colors.transparent, // Action bar color
            child: OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                backgroundColor: Colors.black.withOpacity(0.1), // Slight tint
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              icon: const Icon(
                FontAwesomeIcons.coins,
                color: ThemeConstants.black,
                size: 18,
              ),
              label: const Text(
                '120 coins | Pro',
                style: TextStyle(
                  color: ThemeConstants.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          // Optional notification button
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
