import 'package:URBANPRO/controllers/auth_controller.dart';
import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/utils/validators.dart';
import 'package:URBANPRO/views/auth/otp_screen.dart';
import 'package:URBANPRO/views/widgets/applogo.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:URBANPRO/views/widgets/loading_widget.dart';
import 'package:URBANPRO/views/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late int selectedRole = 1;
  final TextEditingController phoneController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  bool isLoading = false;
  final _mobileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Applogo(width: 100),
                const SizedBox(height: 30),
                Text('Login with Your',
                    style: AppTextStyle.Text20600.copyWith(
                        color: ThemeConstants.primaryColor)),
                const SizedBox(height: 10),
                Text(
                    "Education is the passport to the future\nKeep learning, keep growing.",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.Text16600.copyWith(
                        color: ThemeConstants.grey)),
                const SizedBox(height: 30),
                SimpleDropdown(
                    onSelectedValueChanged: (value) => {selectedRole = value},
                    initialValue: "Admin"),
                const SizedBox(height: 20),
                Form(
                  key: _mobileFormKey,
                  child: CommonTextField(
                    inputType: InputType.phone,
                    label: "Phone Number",
                    hint: "Enter your phone number",
                    controller: phoneController,
                    validator: Validators.validatePhoneNumber,
                    onChanged: (value) {
                      _mobileFormKey.currentState?.validate();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    width: 70,
                    baseTextColor: ThemeConstants.whiteColor,
                    text: 'SIGN IN',
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      bool isPhoneValid =
                          _mobileFormKey.currentState?.validate() ?? false;

                      if (isPhoneValid) {
                        // Send OTP
                        var response = await _authController.sendOtpcontroller(
                          phoneController.text,
                          'email@gmail.com',
                          "nameController.text",
                          selectedRole,
                        );

                        setState(() {
                          isLoading = false;
                        });

                        // Show OTP screen as a modal from bottom to top
                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   backgroundColor: Colors.transparent,
                        //   builder: (context) => OTPScreen(
                        //     phone: phoneController.text,
                        //     otp: response.otpData.mobileOtp,
                        //     email: 'email@gmail.com',
                        //     name: "nameController.text",
                        //     role: selectedRole,
                        //   ),
                        // );
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not registered?",
                      style: AppTextStyle.Text14300,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SIGNUP);
                      },
                      child: Text("Sign Up",
                          style: AppTextStyle.Text14500.copyWith(
                              color: ThemeConstants.primaryColor)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: Center(
                  child: LoadingWidget(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
