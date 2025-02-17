import 'package:URBANPRO/views/student/LearnScreen%20.dart';
import 'package:URBANPRO/views/student/AccountScreen.dart';
import 'package:URBANPRO/views/student/ChatScreen.dart';
import 'package:URBANPRO/views/student/ScheduleScreen.dart';
import 'package:URBANPRO/views/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:URBANPRO/views/student/student_home_screen.dart';
import 'package:URBANPRO/views/widgets/drawer.dart';

class StudentDashBoard extends StatefulWidget {
  const StudentDashBoard({super.key});

  @override
  State<StudentDashBoard> createState() => _StudentDashBoardState();
}

class _StudentDashBoardState extends State<StudentDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  // Define screens as a List of Widgets
  final List<Widget> screens = [
    StudentHomeScreen(),
    LearnScreen(),
    ScheduleScreen(),
    ChatScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
