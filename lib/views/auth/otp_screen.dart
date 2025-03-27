import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/storage_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:URBANPRO/controllers/auth_controller.dart';
class OTPScreen extends StatefulWidget {
  final String phone;
  final int otp;
  final String email;
  final String name;
  final int role;

  const OTPScreen(
      {super.key,
      required this.phone,
      required this.otp,
      required this.email,
      required this.name,
      required this.role});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isLoading = false;

  // Function to verify OTP
  Future<void> verifyOtp() async {
    final authController = Get.find<AuthController>();

    if (widget.phone.isEmpty || widget.otp == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid phone number and OTP")),
      );
      return;
    }

    setState(() {
      isLoading = true; // Show loader
    });

    var response = await authController.OtpSuccesscontroller(
        widget.phone, widget.email, widget.otp, widget.name, widget.role);

    if (response.success) {
      if (response.userData.roles[0].roleId == 1) {
        StorageService().write("login", {"login": true});
        Get.toNamed(AppRoutes.ADMINDASHBOARD);
      } else if (response.userData.roles[0].roleId == 2) {
        Get.toNamed(AppRoutes.TEACHERDASHBOARD);
      } else {
        Get.toNamed(AppRoutes.STUDENTDASHBOARD);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blue,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.whiteColor,
      body: isLoading
          ? LoadingWidget()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40.0),
                    Text('OTP Verification',
                        style: AppTextStyle.Text20600.copyWith(
                            color: ThemeConstants.primaryColor)),
                    const SizedBox(height: 10),
                    Text(
                        "OTP sent on your ${widget.phone} and your temp OTP is ${widget.otp}",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.Text16600.copyWith(
                            color: ThemeConstants.grey)),
                    const SizedBox(height: 30),
                    OtpTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      numberOfFields: 6,
                      fillColor: Colors.black.withOpacity(0.1),
                      filled: true,
                      onSubmit: (code) {
                        print("OTP is => $code");
                        if (code.isNotEmpty) {
                          verifyOtp(); // Verify OTP when entered
                        } else {
                          print("Please enter a valid OTP");
                        }
                      },
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "Next",
                        onPressed: () {
                          verifyOtp(); // Verify OTP when "Next" is clicked
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
