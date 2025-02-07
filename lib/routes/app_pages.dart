import 'package:get/get.dart';
import '../views/Onboarding/onboarding_screen.dart';
import '../views/Splash/splash_screen.dart';
import '../views/auth/login_page.dart';
import '../views/auth/login_signup.dart';
import '../views/auth/signup_page.dart';
import '../views/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASHSCREEN, page:() => SplashScreen()),
    GetPage(name: AppRoutes.LOGINSIGNUP, page: () => UrbanProLogin()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignupPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(name: AppRoutes.ONBOARDING, page: () => OnboardingScreen()),
  ];
}
