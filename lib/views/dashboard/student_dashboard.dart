import 'package:URBANPRO/views/student/courses_screen.dart';
import 'package:URBANPRO/views/student/find_tutors_screen.dart';
import 'package:URBANPRO/views/student/home_screen_student.dart';
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
  final List<Widget> screens = [
    // StudentNewHomeScreen(),
    TestSeriesScreen(),
    CoursesScreen(),
    StudyMaterialScreen(),
    FindTutorsScreen(),
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
      // appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      key: _scaffoldKey,
      drawer: CustomDrawer(
        userName: '',
        userImage: '',
      ),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: StudentBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
