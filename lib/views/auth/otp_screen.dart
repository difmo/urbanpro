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
  final String role;

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
  bool isLoading = false;  // To control the loader visibility

  Future<void> verifyOtp(String mobile, int otp, String email, String name, String role) async {
    final authController = Get.find<AuthController>();
    setState(() {
      isLoading = true;  // Show loader
    });
    print("Verifying OTP with the following details:");
    print("Mobile: $mobile");
    print("OTP: $otp");
    print("Email: $email");
    print("Name: $name");
    print("Role: $role");

    await authController.OtpSuccesscontroller(mobile, email, otp, name, role);
    setState(() {
      isLoading = false;  // Hide loader after OTP verification
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Incoming data to OTP screen:");
    print("Phone: ${widget.phone}");
    print("OTP: ${widget.otp}");
    print("Email: ${widget.email}");
    print("Name: ${widget.name}");
    print("Role: ${widget.role}");

    return Scaffold(
      backgroundColor: ThemeConstants.whiteColor,
      body: isLoading
          ? LoadingWidget()  
          : Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40.0),
                  Text('Phone Number: ${widget.phone} and your temp otp is ${widget.otp}', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 20.0),
                  OtpTextField(
                    mainAxisAlignment: MainAxisAlignment.center,
                    numberOfFields: 6,
                    fillColor: Colors.black.withOpacity(0.1),
                    filled: true,
                    onSubmit: (code) {
                      print("OTP is => $code");
                      if (widget.phone.isNotEmpty && code.isNotEmpty) {
                        verifyOtp(widget.phone, widget.otp, widget.email, widget.name, widget.role);
                      } else {
                        print("Please enter a valid phone number and OTP");
                      }
                    },
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: "Next",
                      onPressed: () {
                        if (widget.phone.isNotEmpty) {
                          verifyOtp(widget.phone, widget.otp, widget.email, widget.name, widget.role);
                        } else {
                          print("Please enter a valid phone number");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
