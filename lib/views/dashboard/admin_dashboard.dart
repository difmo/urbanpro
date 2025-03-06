import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/admin/admin_enquiries_screen.dart';
import 'package:URBANPRO/views/widgets/admin_bottom_bar.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:URBANPRO/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoard();
}

class _AdminDashBoard extends State<AdminDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> screens = [
  AdminEnquiriesScreen(),
  AdminEnquiriesScreen(),
    AdminEnquiriesScreen(),
      AdminEnquiriesScreen(),
        AdminEnquiriesScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(scaffoldKey: _scaffoldKey) ,
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: AdminBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
