import 'package:flutter/material.dart';
import 'package:URBANPRO/utils/theme_constants.dart';

class StudentBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const StudentBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.065;
    double baseFontSize = screenWidth * 0.035; // 3.5% of screen width
    double fontSize = baseFontSize.clamp(10, 14); // Min: 10px, Max: 14px

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: ThemeConstants.secondaryColor,
      unselectedItemColor: ThemeConstants.lightGrey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books, size: iconSize),
          label: 'Test Series',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_lesson, size: iconSize),
          label: 'Courses',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book, size: iconSize),
          label: 'Study Material',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: iconSize),
          label: 'Find Tutor',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent, size: iconSize),
          label: 'Support',
        ),
      ],
      selectedLabelStyle:
          TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(
          fontSize: fontSize * 0.9), // Slightly smaller for unselected
    );
  }
}
