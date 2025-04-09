import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  final List<Map<String, dynamic>> tabs;
  final String title;
  final double? height; // Optional height parameter

  CustomTabBar({
    required this.controller,
    required this.tabs,
    this.title = "Title", // Default title is "Title"
    this.height, // Optional custom height
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Dynamically adjust font size based on screen size
    double titleFontSize = screenWidth * 0.05; // 5% of screen width
    double tabFontSize = screenWidth * 0.04; // 4% of screen width
    double iconSize = screenWidth * 0.08; // 8% of screen width for icon size
    double dynamicHeight = height ?? screenHeight * 0.2; // Default 20% of screen height

    return Container(
      height: dynamicHeight, // Use dynamic height based on screen height or passed value
      color: ThemeConstants.primaryColor, 
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05, // Adjust padding based on screen size
          left: 16.0,
          right: 16.0,
          bottom: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, // Dynamically display the title
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Space between title and tab bar
            Flexible( // Allow the TabBar to take the remaining space
              child: TabBar(
                controller: controller,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontSize: tabFontSize, fontWeight: FontWeight.bold),
                tabs: tabs.map((tab) {
                  return _buildTab(tab['label'], tab['icon'], iconSize, tabFontSize);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build a Tab with responsive icon size and text size
  Widget _buildTab(String label, IconData? icon, double iconSize, double tabFontSize) {
    double tabHeight = icon != null ? iconSize + 8 + 20 : 40.0; // Dynamic height based on icon presence

    return Tab(
      height: tabHeight, // Adjust height dynamically
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(icon, color: Colors.white, size: iconSize), // Only display icon if not null
          SizedBox(height: icon != null ? 8 : 0), // Only add space if icon is present
          Text(
            label,
            style: AppTextStyle.Text12700.copyWith(color: ThemeConstants.white, fontSize: tabFontSize),
          ),
        ],
      ),
    );
  }

  // Preferred size for the custom tab bar
  @override
  Size get preferredSize {
    double dynamicHeight = height ?? 160; // Use passed height or default to 160
    return Size.fromHeight(dynamicHeight); // Adjusted height for tab bar
  }
}
