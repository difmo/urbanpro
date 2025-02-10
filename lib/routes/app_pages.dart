import 'package:URBANPRO/views/dashboard/admin_dashboard.dart';
import 'package:URBANPRO/views/dashboard/student_dashboard.dart';
import 'package:URBANPRO/views/dashboard/teacher_dashboard.dart';
import 'package:URBANPRO/views/student/student_home_screen.dart';
import 'package:get/get.dart';
import '../views/Onboarding/onboarding_screen.dart';
import '../views/Splash/splash_screen.dart';
import '../views/auth/login_page.dart';
import '../views/auth/signup_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASHSCREEN, page: () => SplashScreen()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignupPage()),
    GetPage(name: AppRoutes.STUDENTHOME, page: () => StudentHomeScreen()),
    GetPage(name: AppRoutes.ONBOARDING, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.STUDENTDASHBOARD, page: () => StudentDashBoard()),
    GetPage(name: AppRoutes.TEACHERDASHBOARD, page: () => TeacherDashBoard()),
    GetPage(name: AppRoutes.ADMINDASHBOARD, page: () => AdminDashBoard()),
  ];
}
