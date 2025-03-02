import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:URBANPRO/views/widgets/drawer.dart';
import 'package:URBANPRO/views/widgets/teacher_bottom_bar.dart';
import 'package:flutter/material.dart';

class TeacherDashBoard extends StatefulWidget {
  const TeacherDashBoard({super.key});

  @override
  State<TeacherDashBoard> createState() => _TeacherDashBoard();
}

class _TeacherDashBoard extends State<TeacherDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Home - Stay on current screen
        break;
      case 1:
        // Navigator.pushNamed(context, AppRoutes.HOME);
        break;
      case 2:
        // Navigate to Add Property Form
        // Navigator.pushNamed(context, AppRoutes.HOME);
        break;
      case 3:
        // Navigate to Notifications Page
        // Navigator.pushNamed(context, AppRoutes.HOME);
        break;
      case 4:
        // Navigate to Profile Page
        // Navigator.pushNamed(context, AppRoutes.HOME);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: screenHeight * 0.28, child: const Carousel()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 9),
                    child: Text(
                      'Properties',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, AppRoutes.HOME);
                    },
                    child: Text(
                      'View More',
                      style: TextStyle(
                          color: ThemeConstants.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: TeacherBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
