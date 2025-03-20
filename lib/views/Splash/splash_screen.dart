import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/storage_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String roleIdd = "";
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    var data = await StorageService().read("login_details");
    if (data != null) {
      var isLoggedIn = data['isLoggedIn'];
      var roleData = List<Map<String, dynamic>>.from(data['roleData'] ?? []);

      if (roleData.isNotEmpty) {
        roleData.forEach((role) {
          print("Role ID: ${role['roleId']}");
          setState(() {
            roleIdd = role['roleId'];
          });
          print("Role Name: ${role['roleName']}");
        });

        print("roleidd");
        print(roleIdd);

        if (isLoggedIn) {
          if (roleIdd == '1') {
            Timer(Duration(seconds: 3), () {
              Get.toNamed(AppRoutes.ADMINDASHBOARD);
            });
          } else if (roleIdd == '2') {
            Timer(Duration(seconds: 3), () {
              Get.toNamed(AppRoutes.TEACHERDASHBOARD);
            });
          } else if (roleIdd == '3') {
            Timer(Duration(seconds: 3), () {
              Get.toNamed(AppRoutes.STUDENTDASHBOARD);
            });
          } else {
            Timer(Duration(seconds: 3), () {
              Get.toNamed(AppRoutes.ONBOARDING);
            });
          }
        }
      } else {
        Timer(Duration(seconds: 3), () {
          Get.toNamed(AppRoutes.ONBOARDING);
        });
        print('No role data available');
      }
    } else {
      Timer(Duration(seconds: 3), () {
        Get.toNamed(AppRoutes.ONBOARDING);
      });
      print('No login data found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250,
                  child: SvgPicture.asset('assets/icons/applogo.svg'),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome', style: AppTextStyle.Text28600),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('to ', style: AppTextStyle.Text28600),
                        Text('Urban Tutors',
                            style: AppTextStyle.Text28600.copyWith(
                                color: ThemeConstants.secondaryColor)),
                      ],
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
