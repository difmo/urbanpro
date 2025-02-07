// import 'package:flutter/material.dart';
// import 'package:urbanpro/utils/colors.dart';
// import 'package:urbanpro/views/widgets/custom_button.dart';
// import 'package:urbanpro/views/widgets/custom_text_form_field.dart';
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController appIdController = TextEditingController();
//   final TextEditingController studentIdController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       // appBar: AppBar(title: const Text('')),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // App ID Field
//                   // Logo
//                   Image.asset(
//                     'assets/images/Logo.png', // Update with your actual logo path
//                     height: 220,
//                     width: 220,
//                   ),
//                   // const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 18.0),
//                     child: Text(
//                       'Login with Mobile Number',
//                       style: TextStyle(
//                           fontSize: 20,
//                           // fontStyle: FontStyle.normal,
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.primaryColor),
//                     ),
//                   ),
//                   // const SizedBox(height: 16),
//                   // CustomTextFormField(
//                   //   controller: appIdController,
//                   //   hintText: 'Enter App ID',
//                   //   keyboardType: TextInputType.number,
//                   //   validator: (value) {
//                   //     if (value == null || value.isEmpty) {
//                   //       return 'App ID cannot be empty';
//                   //     }
//                   //     return null;
//                   //   },
//                   //   prefixIcon: Icons.person,
//                   // ),
//                   const SizedBox(height: 16),
//
//                   // Student ID Field
//                   CustomTextFormField(
//                     controller: studentIdController,
//                     hintText: 'Enter Mobile No.',
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Student ID cannot be empty';
//                       }
//                       return null;
//                     },
//                     prefixIcon: Icons.phone,
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Password Field
//                   CustomTextFormField(
//                     controller: passwordController,
//                     hintText: 'Enter your password',
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Password cannot be empty';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                     prefixIcon: Icons.lock,
//                   ),
//                   const SizedBox(height: 24),
//
//                   // Login Button
//                   CustomButton(
//                     text: 'Login',
//                     isLoading: false, // Update dynamically in your logic
//                     onPressed: () {
//                       final appId = appIdController.text.trim();
//                       final studentId = studentIdController.text.trim();
//                       final password = passwordController.text.trim();
//
//                       if (appId.isNotEmpty &&
//                           studentId.isNotEmpty &&
//                           password.isNotEmpty) {
//                         print(
//                             'Login with App ID: $appId, Student ID: $studentId, Password: $password');
//                         // Add your login logic here
//                       } else {
//                         // Show a dialog or snackbar for missing fields
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('All fields are required')),
//                         );
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController appIdController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false, // Prevents UI from shifting
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  padding: const EdgeInsets.only(top: 12.0, bottom: 20),
                  child: Text(
                    'Login with Mobile Number',
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
                children: [
                  const SizedBox(height: 16), // Now it works properly

                  CustomTextFormField(
                    controller: studentIdController,
                    hintText: 'Enter Mobile No.',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Student ID cannot be empty';
                      }
                      return null;
                    },
                    prefixIcon: Icons.phone,
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
    );
  }
}
