// screens/followup_screen.dart
import 'package:URBANPRO/services/teacher/follow_up_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/teacher/FollowUpDetailsScreen.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:URBANPRO/views/widgets/teacher/FolloupCard.dart';
import 'package:flutter/material.dart';
import 'package:URBANPRO/models/teacher/follow_up_model.dart';
import 'package:flutter/services.dart';

class FollowUpScreen extends StatefulWidget {
  const FollowUpScreen({super.key});

  @override
  State<FollowUpScreen> createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _activeTabIndex = 0;
  final List<String> tabs = ['Contacted', 'Demos', 'Payments', 'Starred'];
  List<FollowUpModel> followups = FollowUpService.getStudents();
  List<FollowUpModel> filteredFollowups = [];

  @override
  void initState() {
    super.initState();
    _applyFilter(); // Apply default filter on load
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4A90E2), // Your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons (for dark backgrounds)
      statusBarBrightness: Brightness.dark, // For iOS
    ));
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeConstants.white,
        appBar: CustomAppBar(
          title: "Follow-Up",
          scaffoldKey: _scaffoldKey,
          backgroundColor: ThemeConstants.white,
        ),
        body: Column(
          children: [
            // Horizontal tabs
            Container(
              padding: EdgeInsets.all(8),
              color: ThemeConstants.lightGrey,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    tabs.length,
                    (index) => GestureDetector(
                      onTap: () => _onTabTapped(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        margin: EdgeInsets.only(
                          left: index == 0 ? 10 : 5,
                          right: index == tabs.length - 1 ? 10 : 5,
                        ),
                        decoration: BoxDecoration(
                          color: index == _activeTabIndex
                              ? ThemeConstants.primaryColor // Active tab green
                              : ThemeConstants.white, // Inactive tab background
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: index == _activeTabIndex
                                ? ThemeConstants.white
                                : ThemeConstants.primaryColor,
                          ),
                        ),
                        child: Text(
                          tabs[index],
                          style: TextStyle(
                            color: index == _activeTabIndex
                                ? ThemeConstants.white
                                : ThemeConstants.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
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
                  ? Container(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: ListView.builder(
                        itemCount: filteredFollowups.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FollowUpDetailsScreen(
                                    followUp: filteredFollowups[index]),
                              ),
                            ),
                            child: FollowUpCard(
                                followUp: filteredFollowups[index]),
                          );
                        },
                      ),
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
      ),
    );
  }
}
