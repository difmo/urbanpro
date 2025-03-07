import 'package:URBANPRO/views/teacher/account_screen.dart';
import 'package:URBANPRO/views/teacher/enquiries_screen.dart';
import 'package:URBANPRO/views/teacher/teacher_chat_support_screen.dart';
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
  final List<Widget> screens = [
    EnquiriesScreen(),
    EnquiriesScreen(),
    EnquiriesScreen(),
    TeacherChatSupportScreen(),
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
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: TeacherBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
