import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _homeController.logout,
          ),
        ],
      ),
      body: Obx(() {
        final user = _homeController.user.value;
        if (user == null) {
          return Center(child: Text('No user information found.'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text('Welcome, ${user.name}', style: TextStyle(fontSize: 20)),
              // SizedBox(height: 10),
              // Text('Email: ${user.email}', style: TextStyle(fontSize: 16)),
            ],
          ),
        );
      }),
    );
  }
}
