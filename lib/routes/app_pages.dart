import 'package:URBANPRO/views/admin/transactions_screen.dart';
import 'package:URBANPRO/views/admin/users_screen.dart';
import 'package:URBANPRO/views/auth/otp_screen.dart';
import 'package:URBANPRO/views/dashboard/admin_dashboard.dart';
import 'package:URBANPRO/views/dashboard/student_dashboard.dart';
import 'package:URBANPRO/views/dashboard/teacher_dashboard.dart';
import 'package:URBANPRO/views/student/study_meterial_screen.dart';
import 'package:get/get.dart';
import '../views/onboarding/onboarding_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/auth/login_page.dart';
import '../views/auth/signup_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASHSCREEN, 
      page: () => SplashScreen(),
      transition: Transition.circularReveal,  
      transitionDuration: Duration(milliseconds: 500), 
    ),
    GetPage(
      name: AppRoutes.LOGIN, 
      page: () => LoginPage(),
       transition: Transition.circularReveal,  
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.SIGNUP, 
      page: () => SignupPage(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.STUDENTHOME, 
      page: () => StudyMaterialScreen(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING, 
      page: () => OnboardingScreen(),
      transition: Transition.circularReveal,  
      transitionDuration: Duration(milliseconds: 2000),
    ),
    GetPage(
      name: AppRoutes.STUDENTDASHBOARD, 
      page: () => StudentDashBoard(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.TEACHERDASHBOARD, 
      page: () => TeacherDashBoard(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.ADMINDASHBOARD, 
      page: () => AdminDashBoard(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),
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
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),

    // admin
    GetPage(
      name: AppRoutes.USERSSCREEN, 
      page: () => UsersScreen(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),

        GetPage(
      name: AppRoutes.TRANSACTIONSCREEN, 
      page: () =>TransactionsScreen(),
      transition: Transition.fadeIn, 
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
