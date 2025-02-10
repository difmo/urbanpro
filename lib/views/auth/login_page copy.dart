// import 'package:URBANPRO/utils/user_role.dart';
// import 'package:URBANPRO/views/widgets/custom_dropdown.dart';
// import 'package:URBANPRO/views/widgets/custom_text_field.dart';
// import 'package:URBANPRO/views/widgets/phone_number_input.dart';
// import 'package:flutter/material.dart';

// import '../../utils/colors.dart';
// import '../widgets/custom_button.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController appIdController = TextEditingController();
//   final TextEditingController studentIdController = TextEditingController();
//   final TextEditingController nameController = TextEditingController(text: "");
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevents UI from shifting
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 16, right: 16),
//           child: Column(
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 70.0, bottom: 40),
//                     child: Image.asset("assets/images/Logo.png", height: 120),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 12.0, bottom: 20),
//                     child: Text(
//                       'Login with Mobile Number',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primaryColor,
//                         fontFamily: "poppins",
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: const Text(
//                       "Education is the passport to the future\nkeep learning, keep growing.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Container(
//                 width: double.infinity / 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40),
//                   border: Border.all(
//                     color: AppColors.primaryColor,
//                     width: 1,
//                   ),
//                 ),
//                 child: Container(
//                   margin: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: AppColors.primaryColor.withOpacity(0.15),
//                         spreadRadius: 2,
//                         blurRadius: 10,
//                         offset: const Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: CustomDropdown<String>(
//                     itemDescriptions: roleDescriptions,
//                     selectedValue: userRole[0],
//                     onChanged: (String? value) {
//                       // _rolePermissionController
//                       //     .setRole(value ?? userRole.last);
//                       // setState(() {
//                       //   role = value ?? userRole.last;
//                       // });
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               CustomTextField(label: 'School Name', controller: nameController),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 16), // Now it works properly
//                     PhoneNumberInput(
//                       onPhoneNumberChanged: ((value) => {}),
//                       initValue: "phoneNumber",
//                       otpSendStatus: false,
//                     ),

//                     SizedBox(
//                       height: 16,
//                     ),
//                     Center(
//                       child: CustomButton(
//                         text: 'Send OTP',
//                         onPressed: () async {},
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
