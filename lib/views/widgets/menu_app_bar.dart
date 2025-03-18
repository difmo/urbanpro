import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/admin/create_newlead_screen.dart';
import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int notificationCount; // Notification count passed from dashboard
  final Color? backgroundColor; // New optional background color field

  const MenuAppBar({
    super.key,
    required this.scaffoldKey,
    this.notificationCount = 1,
    this.backgroundColor, // Allow custom color
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
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: const [
                      Color(0xFF4A90E2), // A smooth blue gradient
                      Color(0xFF50E3C2)
                    ],
                  )
                : null,
            color: backgroundColor ?? Colors.white, // Solid color fallback
          ),
        ),
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(4),
            child: Image.asset(
              "assets/images/menus.png",
              height: 48,
              color: backgroundColor ?? Colors.white,
            ),
          ),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text(
          'Urban Tutors',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          /// **Notification Icon with Badge**
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: ThemeConstants.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Opening Notifications...")),
                  );
                },
              ),

              /// **Badge Indicator (Only show if count > 0)**
              if (notificationCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: ThemeConstants.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 16,
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 8),

          /// **Add Button**
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateNewLeadScreen()),
              );
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: ThemeConstants.backgroundColor),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                "+ Add",
                style: TextStyle(color: ThemeConstants.white),
              ),
            ),
          ),

          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
