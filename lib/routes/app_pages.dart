import 'package:URBANPRO/views/auth/otp_screen.dart';
import 'package:URBANPRO/views/dashboard/admin_dashboard.dart';
import 'package:URBANPRO/views/dashboard/student_dashboard.dart';
import 'package:URBANPRO/views/dashboard/teacher_dashboard.dart';
import 'package:URBANPRO/views/student/student_home_screen.dart';
import 'package:URBANPRO/views/student/study_meterial_screen.dart';
import 'package:get/get.dart';
import '../views/onboarding/onboarding_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/auth/login_page.dart';
import '../views/auth/signup_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASHSCREEN, page: () => SplashScreen()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignupPage()),
    GetPage(name: AppRoutes.STUDENTHOME, page: () => StudyMaterialScreen()),
    GetPage(name: AppRoutes.ONBOARDING, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.STUDENTDASHBOARD, page: () => StudentDashBoard()),
    GetPage(name: AppRoutes.TEACHERDASHBOARD, page: () => TeacherDashBoard()),
    GetPage(name: AppRoutes.ADMINDASHBOARD, page: () => AdminDashBoard()),
   GetPage(
  name: AppRoutes.OTPSCREEN,
  page: () {
    final arguments = Get.arguments;  
    return OTPScreen(
      phone: arguments['mobile'],
      otp: arguments['otp'],
      email: arguments['email'],
      name: arguments['name'],
      role: arguments['role'],
    );
  },
),

  ];
}
