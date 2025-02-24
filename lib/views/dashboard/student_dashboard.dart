import 'package:URBANPRO/views/student/courses_screen.dart';
import 'package:URBANPRO/views/student/find_tutors_screen.dart';
import 'package:URBANPRO/views/student/study_meterial_screen.dart';
import 'package:URBANPRO/views/student/support_screen.dart';
import 'package:URBANPRO/views/student/test_series_screen.dart';
import 'package:URBANPRO/views/widgets/student_bottom_bar.dart';
import 'package:flutter/material.dart';
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
    TestSeriesScreen(),
    // StudentHomeScreen(),
    CoursesScreen(),
    // LearnScreen(),
    // ScheduleScreen(),
    StudyMaterialScreen(),
    FindTutorsScreen(),
    // ChatScreen(),
    // AccountScreen()
    SupportScreen()
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
      bottomNavigationBar: StudentBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
