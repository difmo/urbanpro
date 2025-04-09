// import 'package:URBANPRO/utils/theme_constants.dart';
// import 'package:flutter/material.dart';

// class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final Color? backgroundColor;

//   const BackAppBar({
//     Key? key,
//     required this.title,
//     this.backgroundColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title),
//       backgroundColor: backgroundColor ?? ThemeConstants.primaryColor,
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar height
// }
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

const double kTabBarHeight = 48.0; // Define TabBar height

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final List<Tab>? tabs; // Make tabs nullable
  final TabController? tabController; // Make tabController nullable

  const BackAppBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.tabs, // Nullable tabs
    this.tabController, // Nullable TabController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor ?? ThemeConstants.primaryColor,
      bottom: tabs != null && tabs!.isNotEmpty // Only show TabBar if tabs are provided
          ? TabBar(
              controller: tabController,
              tabs: tabs!,
              indicatorColor: Colors.white, // Custom tab indicator color
            )
          : null,
    );
  }

  @override
  Size get preferredSize {
    // If tabs are provided, adjust height for TabBar as well
    if (tabs != null && tabs!.isNotEmpty) {
      return Size.fromHeight(kToolbarHeight + kTabBarHeight); // AppBar + TabBar height
    } else {
      return Size.fromHeight(kToolbarHeight); // Only AppBar height
    }
  }
}
