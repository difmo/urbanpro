import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Map<String, dynamic>> tabs;
  final String title; 
  

  // Make the title parameter required and icon optional in the tabs list
  CustomTabBar({
    required this.controller,
    required this.tabs,
    this.title = "Title", // Default title is "Test Series"
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConstants.primaryColor, // You can customize the color
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title, // Dynamically display the title
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
              controller: controller,
              padding: EdgeInsets.symmetric(horizontal: 0),
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              tabs: tabs.map((tab) {
                return _buildTab(tab['label'], tab['icon']);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, IconData? icon) {
    return Tab(
      height: 30,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, color: Colors.white), // Only display icon if not null
            SizedBox(
                width:
                    icon != null ? 8 : 0), // Only add space if icon is present
            Text(label),
          ],
        ),
      ),
    );
  }
}
