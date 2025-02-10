import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/user_role.dart';
import 'package:URBANPRO/views/widgets/custom_dropdown.dart';
import 'package:URBANPRO/views/widgets/phone_number_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../widgets/custom_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController roleController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Logo
              Image.asset("assets/images/Logo.png", height: 100),

              const SizedBox(height: 30),

              // Title
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

              // Dropdown for User Role
              _buildDropdown(),

              const SizedBox(height: 20),

              // Name Input
              CommonTextField(
                inputType: InputType.name,
                label: "Full Name",
                hint: "Enter your full name",
                controller: nameController,
                onChanged: (value) => print("Name: $value"),
              ),

              const SizedBox(height: 20),

              // Phone Input
              CommonTextField(
                inputType: InputType.phone,
                label: "Phone Number",
                hint: "Enter your phone number",
                controller: phoneController,
                onChanged: (value) => print("Phone: $value"),
              ),

              const SizedBox(height: 10),

              const SizedBox(height: 20),
              // Sign In Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'SIGN UP',
                  onPressed: () async {
                    print("Logging In...");
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Don't have an account? Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you have already registered?",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.LOGIN);
                    },
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
