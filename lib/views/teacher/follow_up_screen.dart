// screens/followup_screen.dart
import 'package:URBANPRO/services/teacher/follow_up_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:URBANPRO/views/widgets/teacher/FolloupCard.dart';
import 'package:flutter/material.dart';
import 'package:URBANPRO/models/teacher/follow_up_model.dart';
import 'package:flutter/services.dart';

class FollowUpScreen extends StatefulWidget {
  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 1;
  int _activeTabIndex = 0;
  final List<String> tabs = ['Contacted', 'Demos', 'Payments', 'Starred'];
  List<FollowUpModel> followups = FollowUpService.getStudents();
  List<FollowUpModel> filteredFollowups = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4A90E2), // Your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons (for dark backgrounds)
      statusBarBrightness: Brightness.dark, // For iOS
    ));
    _applyFilter(); // Apply default filter on load
  }

  void _onTabTapped(int index) {
    setState(() {
      _activeTabIndex = index;
      _applyFilter();
    });
  }

  void _applyFilter() {
    setState(() {
      String selectedTab = tabs[_activeTabIndex].toLowerCase();

      // Filter logic based on selected tab
      filteredFollowups = followups.where((fllowup) {
        switch (selectedTab) {
          case 'contacted':
            return fllowup.status.toLowerCase() == 'contacted';
          case 'demos':
            return fllowup.status.toLowerCase() == 'demo';
          case 'payments':
            return fllowup.status.toLowerCase() == 'payment';
          case 'starred':
            return fllowup.isStarred ?? false;
          default:
            return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: CustomAppBar(
        title: "Follow-Up",
        scaffoldKey: _scaffoldKey,
        backgroundColor: ThemeConstants.white,
      ),
      body: Column(
        children: [
          // Horizontal tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                tabs.length,
                (index) => GestureDetector(
                  onTap: () => _onTabTapped(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: index == _activeTabIndex
                          ? Colors.green[400]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: index == _activeTabIndex
                          ? [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.5),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              )
                            ]
                          : [],
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                        color: index == _activeTabIndex
                            ? Colors.white
                            : Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Student list
          Expanded(
            child: filteredFollowups.isNotEmpty
                ? ListView.builder(
                    itemCount: filteredFollowups.length,
                    itemBuilder: (context, index) {
                      return FollowUpCard(followUp: filteredFollowups[index]);
                    },
                  )
                : Center(
                    child: Text(
                      "No data found",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
