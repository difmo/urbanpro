import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.toNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // backgroundColor: const Color(0xFF006F92),
      body: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   child: Container(
          //     child: SvgPicture.asset(
          //       'assets/bg/splashelementupper.svg',
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Container(
          //     child: SvgPicture.asset(
          //       'assets/bg/splashelement.svg',
          //     ),
          //   ),
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  child: Image.asset('assets/images/Logo.png'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: ThemeConstants.black,
                        fontFamily: "poppins",
                      ),
                    ),
                    Text(
                      ' Urban Pro',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 207, 75),
                        fontFamily: "poppins",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
