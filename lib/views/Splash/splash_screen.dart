import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';


import '../../routes/app_pages.dart';
import '../../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to the home screen
    Timer(Duration(seconds: 3), () {
     Get.toNamed('/onboarding');
      // getPages: AppPages.pages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 250,
              width: 250,
              child: Image.asset(
                'assets/images/Logo.png'  // You can use a custom icon here if needed
              ),
            ),
            Text(
              'Welcome to Urban Pro',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: "poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}