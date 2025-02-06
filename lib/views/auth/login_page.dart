import 'package:flutter/material.dart';
import 'package:urbanpro/utils/colors.dart';
import 'package:urbanpro/views/widgets/custom_button.dart';
import 'package:urbanpro/views/widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController appIdController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App ID Field
              // Logo
              Image.asset(
                'assets/Icons/loginlogo.png', // Update with your actual logo path
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 32),
              Text(
                'Login with your',
                style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: appIdController,
                hintText: 'Enter App ID',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'App ID cannot be empty';
                  }
                  return null;
                },
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),

              // Student ID Field
              CustomTextFormField(
                controller: studentIdController,
                hintText: 'Enter Student ID',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Student ID cannot be empty';
                  }
                  return null;
                },
                prefixIcon: Icons.person,
              ),
              const SizedBox(height: 16),

              // Password Field
              CustomTextFormField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                prefixIcon: Icons.lock,
              ),
              const SizedBox(height: 24),

              // Login Button
              CustomButton(
                text: 'Login',
                isLoading: false, // Update dynamically in your logic
                onPressed: () {
                  final appId = appIdController.text.trim();
                  final studentId = studentIdController.text.trim();
                  final password = passwordController.text.trim();

                  if (appId.isNotEmpty &&
                      studentId.isNotEmpty &&
                      password.isNotEmpty) {
                    print(
                        'Login with App ID: $appId, Student ID: $studentId, Password: $password');
                    // Add your login logic here
                  } else {
                    // Show a dialog or snackbar for missing fields
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('All fields are required')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
