import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/utils/user_role.dart';
import 'package:URBANPRO/utils/validators.dart';
import 'package:URBANPRO/views/auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:URBANPRO/controllers/auth_controller.dart';
import 'package:URBANPRO/utils/colors.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_dropdown.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:URBANPRO/views/widgets/loading_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController roleController = TextEditingController();
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset("assets/images/Logo.png", height: 100),
                const SizedBox(height: 30),
                Text(
                  'Sign Up with your',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(height: 10),
                // Subtitle
                Text(
                  "Education is the passport to the future\nKeep learning, keep growing.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    color: Colors.grey.shade700,
                  ),
                ),

                const SizedBox(height: 30),

                _buildDropdown(),

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
                        // Send OTP
                        await _authController.sendOtpcontroller(
                          phoneController.text,
                          'email@gmail.com',
                          nameController.text,
                          '1',
                        );

                        setState(() {
                          isLoading = false;
                        });

                        // Show OTP screen as a modal from bottom to top
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors
                              .transparent, // Remove background color to show transparency
                          builder: (context) => OTPScreen(
                            phone: phoneController.text,
                            otp:
                                123456, // This should come from your OTP controller or backend
                            email:
                                'email@gmail.com', // Replace with actual email
                            name: nameController.text,
                            role: '1', // Replace with actual role
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
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
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

  Widget _buildDropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CustomDropdown<String>(
        itemDescriptions: roleDescriptions,
        selectedValue: userRole.first,
        onChanged: (String? value) {
          // Handle selection
          print("$value");
          roleController.text = value!;
        },
      ),
    );
  }
}
