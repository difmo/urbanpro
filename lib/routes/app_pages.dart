import 'package:get/get.dart';
import '../views/auth/login_page.dart';
import '../views/auth/signup_page.dart';
import '../views/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.SIGNUP, page: () => SignupPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
  ];
}
