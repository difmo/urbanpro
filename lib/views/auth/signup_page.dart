import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/utils/validators.dart';
import 'package:URBANPRO/views/auth/otp_screen.dart';
import 'package:URBANPRO/views/widgets/applogo.dart';
import 'package:URBANPRO/views/widgets/simple_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:URBANPRO/controllers/auth_controller.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:URBANPRO/views/widgets/loading_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int selectedRole = 0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  bool isLoading = false;
  final _nameFormKey = GlobalKey<FormState>();
  final _mobileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Applogo(
                    width: 100,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Sign Up with your',
                    style: AppTextStyle.Text20600.copyWith(
                        color: ThemeConstants.primaryColor),
                  ),
                  const SizedBox(height: 10),
                  // Subtitle
                  Text(
                    "Education is the passport to the future\nKeep learning, keep growing.",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.Text16400,
                  ),

                  const SizedBox(height: 30),

                  SimpleDropdown(
                      onSelectedValueChanged: (value) => {selectedRole = value},
                      initialValue: "Select Role"),
                  const SizedBox(height: 20),
                  Form(
                    key: _nameFormKey,
                    child: CommonTextField(
                      inputType: InputType.name,
                      label: "Full Name",
                      hint: "Enter your full name",
                      controller: nameController,
                      validator: Validators.validateName,
                      onChanged: (value) {
                        _nameFormKey.currentState?.validate();
                      },
                    ),
                  ),

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
                      baseTextColor: ThemeConstants.whiteColor,
                      text: 'SIGN UP',
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });

                        bool isNameValid =
                            _nameFormKey.currentState?.validate() ?? false;
                        bool isPhoneValid =
                            _mobileFormKey.currentState?.validate() ?? false;

                        if (isNameValid && isPhoneValid) {
                          if (selectedRole == 0) {
                            setState(() {
                              isLoading = false;
                            });
                            Get.snackbar(
                              "Error",
                              "Please select a role",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }
                          // Send OTP
                          await _authController.sendOtpcontroller(
                            phoneController.text,
                            'email@gmail.com',
                            nameController.text,
                            selectedRole,
                          );

                          setState(() {
                            isLoading = false;
                          });

                          showMaterialModalBottomSheet(
                            context: context,
                            builder: (context) => OTPScreen(
                              phone: phoneController.text,
                              otp: 123456, // Replace with actual OTP logic
                              email:
                                  'email@gmail.com', // Replace with actual email
                              name: nameController.text,
                              role: selectedRole, // Replace with actual role
                            ),
                          );
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
                        "If you have already registered?",
                        style: AppTextStyle.Text14300,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.LOGIN);
                        },
                        child: Text("Sign In",
                            style: AppTextStyle.Text14600.copyWith(
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
      ),
    );
  }
}
