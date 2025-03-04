import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/utils/user_role.dart';
import 'package:URBANPRO/views/widgets/applogo.dart';
import 'package:URBANPRO/views/widgets/custom_dropdown%20copy.dart';
import 'package:URBANPRO/views/widgets/custom_dropdown.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  onSelectedValueChanged: (value) => {}, initialValue: "Admin"),
              const SizedBox(height: 20),
              CommonTextField(
                inputType: InputType.name,
                label: "Full Name",
                hint: "Enter your full name",
                controller: nameController,
                onChanged: (value) => print("Name: $value"),
              ),
              const SizedBox(height: 20),
              CommonTextField(
                inputType: InputType.phone,
                label: "Phone Number",
                hint: "Enter your phone number",
                controller: phoneController,
                onChanged: (value) => print("Phone: $value"),
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
                    Get.toNamed(AppRoutes.TEACHERDASHBOARD);
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
      ),
    );
  }

  // ignore: unused_element
  Widget _buildDropdown() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ThemeConstants.primaryColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeConstants.primaryColor.withOpacity(0.15),
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
          roleController.text = value!;
        },
      ),
    );
  }
}
