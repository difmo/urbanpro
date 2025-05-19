import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    double iconSize = screenWidth * 0.065; // Better visual balance
    double baseFontSize = screenWidth * 0.034;
    double fontSize = baseFontSize.clamp(12, 16); // Improved readability

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Glassmorphic effect
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          backgroundColor: Colors.transparent,
          selectedItemColor: ThemeConstants.primaryColor,
          unselectedItemColor: ThemeConstants.lightGrey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0, // Removed default elevation
          items: [
            _buildNavItem(FontAwesomeIcons.solidBookmark, "Test Series", 0),
            _buildNavItem(FontAwesomeIcons.play, "Courses", 1),
            _buildNavItem(FontAwesomeIcons.solidFileAlt, "Material", 2),
            _buildNavItem(FontAwesomeIcons.userGraduate, "Find Tutor", 3),
            _buildNavItem(FontAwesomeIcons.headset, "Support", 4),
          ],
          selectedLabelStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(fontSize: fontSize * 0.9),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4),
        child: FaIcon(icon, size: 22),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
          color: ThemeConstants.primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(icon, size: 24, color: ThemeConstants.primaryColor),
      ),
      label: label,
    );
  }
}
