import 'package:URBANPRO/views/admin/amount_setting_screen.dart';
import 'package:URBANPRO/views/admin/feedback_screen.dart';
import 'package:URBANPRO/views/admin/promotions_screen.dart';
import 'package:URBANPRO/views/admin/send_notification_screen.dart';
import 'package:URBANPRO/views/admin/terms_conditions_screen.dart';
import 'package:URBANPRO/views/admin/transactions_screen.dart';
import 'package:URBANPRO/views/admin/users_screen.dart';
import 'package:URBANPRO/views/admin/wallete_history_screen.dart';
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

        // Check for necessary arguments
        // if (arguments == null ||
        //     !arguments.containsKey('phone') ||
        //     !arguments.containsKey('otp') ||
        //     !arguments.containsKey('email') ||
        //     !arguments.containsKey('name') ||
        //     !arguments.containsKey('role')) {
        //   // Handle error: Missing arguments
        //   // You can show a dialog or redirect to an error screen
        //   Get.snackbar('Error', 'Required arguments are missing!');
        // }

        // Safe argument extraction and passing to OTP screen
        final phone = arguments['phone'] ?? '';
        final otp = arguments['otp'] ?? 0; // Ensure it's a number
        final email = arguments['email'] ?? '';
        final name = arguments['name'] ?? '';
        final role = arguments['role'] ?? 0; // Ensure it's an integer

        return OTPScreen(
          phone: phone,
          otp: otp,
          email: email,
          name: name,
          role: role,
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
      page: () => TransactionsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.AMOUNTSETTINSCREEN,
      page: () => AmountSettingScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.SENDNOTIFICATION,
      page: () => SendNotificationScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),

    GetPage(
      name: AppRoutes.PROMOTIONS,
      page: () => PromotionsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.FEEDBACK,
      page: () => FeedbackScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.TERMCONDITION,
      page: () => TermsConditionsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.WALLETSCREEN,
      page: () => WalletHistoryScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
