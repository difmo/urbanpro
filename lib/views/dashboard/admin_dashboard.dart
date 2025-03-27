import 'package:URBANPRO/views/admin/admin_enquiries_screen.dart';
import 'package:URBANPRO/views/widgets/drawer.dart';
import 'package:URBANPRO/views/widgets/menu_app_bar.dart';
import 'package:flutter/material.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoard();
}

class _AdminDashBoard extends State<AdminDashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(
        scaffoldKey: _scaffoldKey,
        notificationCount: 5,
      ),
      key: _scaffoldKey,
      drawer: CustomDrawer(
        userName: 'Dinesh Kumar',
        userImage:
            'https://i.ibb.co/LD68ZwXH/360-F-227450952-KQCMSh-HPOPeb-UXkl-ULs-Ks-ROk5-Av-N6-H1-H.jpg',
      ),
      backgroundColor: Colors.white,
      body: AdminEnquiriesScreen(),
    );
  }
}
