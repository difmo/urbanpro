import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, // Prevents UI from shifting

      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, bottom: 40),
                    child: Image.asset("assets/images/Logo.png", height: 120),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom:20 ),
                    child: Text(
                      'Login with Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                        fontFamily: "poppins",
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Text(
                      "Education is the passport to the future\nkeep learning, keep growing.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text to the left
                  children: [
                    const SizedBox(height: 16), // Now it works properly
          
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        return null;
                      },
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 36),
          
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
                    const SizedBox(height: 30),
          
                    // Login Button
                    CustomButton(
                      suffixIcon: Icons.login,
                      text: 'Login',
                      isLoading: false, // Update dynamically in your logic
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
          
                        if (email.isNotEmpty && password.isNotEmpty) {
                          print('Login with Email: $email, Password: $password');
                          // Add your login logic here
                        } else {
                          // Show a dialog or snackbar for missing fields
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('All fields are required')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
