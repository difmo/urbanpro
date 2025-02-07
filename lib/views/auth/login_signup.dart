// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../routes/app_routes.dart';
// import '../../utils/colors.dart';
//
// class UrbanProLogin extends StatelessWidget {
//   const UrbanProLogin({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SafeArea(
//           child: Column(
//             // mainAxisSize: MainAxisSize.min, // Prevents Column from taking full height
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 70.0, bottom: 40),
//                 child: Image.asset("assets/images/Logo.png", height: 120),
//               ),
//               const SizedBox(height: 30),
//               const Text(
//                 "Welcome to Urbanpro",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: 'Poppins',
//                 ),
//               ),
//               // const SizedBox(height: 30),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
//                 child: Text(
//                   "Education is the passport to the future\nkeep learning, keep growing.",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: 'Poppins',
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
//                 child: _buildButton(
//                   icon: Icons.email_outlined,
//                   text: "Login with Email",
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.SIGNUP);
//                   },
//                 ),
//               ),
//               const SizedBox(height: 25),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
//                 child: _buildButton(
//                   icon: Icons.call_outlined,
//                   text: "Login with Phone",
//                   onPressed: () {
//                     Get.toNamed(AppRoutes.LOGIN);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Custom Button Widget
//   Widget _buildButton(
//       {required IconData icon,
//       required String text,
//       required VoidCallback onPressed}) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primaryColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: Colors.white, size: 25,),
//             const SizedBox(width: 10),
//             Text(
//               text,
//               style: const TextStyle(
//                   color: Colors.white, fontSize: 16, fontFamily: "poppins",
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/colors.dart';

class UrbanProLogin extends StatelessWidget {
  const UrbanProLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: const Text(
                    "Welcome to Urbanpro",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
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
              padding: const EdgeInsets.only(top: 38.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: _buildButton(
                      icon: Icons.email_outlined,
                      text: "Login with Email",
                      onPressed: () {
                        Get.toNamed(AppRoutes.SIGNUP);
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: _buildButton(
                      icon: Icons.call_outlined,
                      text: "Login with Phone",
                      onPressed: () {
                        Get.toNamed(AppRoutes.LOGIN);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 40), // Adjust bottom spacing
                  child: Text(
                    'Copyright (c) 2024 by UrbanPro\n'
                        'Confidential and Proprietary',
                    textAlign: TextAlign.center, // Center-align the text
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.only(bottom: 40), // Adjust bottom spacing
            //       child: Text(
            //         'Copyright (c) 2024 by Difmo Technologies\nConfidential and Proprietary',textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'poppins'),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );

  }

  // Custom Button Widget
  Widget _buildButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
