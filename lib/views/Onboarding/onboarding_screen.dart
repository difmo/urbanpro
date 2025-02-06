// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:rubyscan/roots/routes.dart';
// import '../../assets/colors.dart';
// import '../../services/utils/orientation_lock.dart';
// import 'onboarding_controller.dart';
// import 'package:video_player/video_player.dart';
//
// class OnboardingScreen extends StatefulWidget {
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final OnboardingController controller = Get.put(OnboardingController());
//   // late VideoPlayerController _videoController;
//
//   final List<Map<String, String>> onboardingData = [
//     {
//       'image': 'lib/assets/images/hand.png',
//       'title': 'Title 1',
//       'description': 'A cryptocurrency is a digital currency, which is an alternative form of payment created using encryption algorithms. The use of encryption technologies means that cryptocurrencies',
//     },
//     {
//       'image': 'lib/assets/images/hand.png',
//       'title': 'Title 2',
//       'description': 'Description for image 2',
//     },
//     {
//       'image': 'lib/assets/images/hand.png',
//       'title': 'Title 3',
//       'description': 'Description for image 3',
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.light,
//       ),
//     );    _setStatusBarStyle();
//     // _initializeVideoPlayer();
//   }
//
//   @override
//   void dispose() {
//     _setStatusBarStyle();
//     // _videoController.dispose();
//     super.dispose();
//   }
//
//   // void _initializeVideoPlayer() {
//   //   _videoController =
//   //       VideoPlayerController.asset('lib/assets/images/backgroundgif.mp4')
//   //         ..initialize().then((_) {
//   //           setState(() {});
//   //           _videoController.play();
//   //           _videoController.setLooping(true);
//   //           _videoController.setVolume(0.0); // Mute the video
//   //         });
//   // }
//
//   void _setStatusBarStyle() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//     ));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return OrientationLock(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             // _setBackgroundVideo(),
//             _buildPageView(),
//             _buildIndicator(),
//             _buildBackgroundCircle(),
//             _buildBottomButtons(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPageView() {
//     return PageView.builder(
//       controller: controller.pageController,
//       onPageChanged: (index) => controller.currentIndex.value = index,
//       itemCount: onboardingData.length,
//       itemBuilder: (context, index) {
//         return OnboardingPage(
//           image: onboardingData[index]['image']!,
//           title: onboardingData[index]['title']!,
//           description: onboardingData[index]['description']!,
//         );
//       },
//     );
//   }
//
//   // Widget _setBackgroundVideo() {
//   //   return _videoController.value.isInitialized
//   //       ? Positioned.fill(
//   //           child: FittedBox(
//   //             fit: BoxFit.cover,
//   //             child: SizedBox(
//   //               width: _videoController.value.size.width,
//   //               height: _videoController.value.size.height,
//   //               child: VideoPlayer(_videoController),
//   //             ),
//   //           ),
//   //         )
//   //       : Container(); // Return an empty container if the video is not yet initialized
//   // }
//
//   Widget _buildIndicator() {
//     return Positioned(
//       left: 0,
//       right: 0,
//       bottom: 190,
//       child: Align(
//         alignment: Alignment.center,
//         child: Obx(() {
//           return Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // if (controller.currentIndex.value < 3)
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     onboardingData.length,
//                     (index) => Container(
//                       margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                       width: 10.0,
//                       height: 10.0,
//                       decoration: BoxDecoration(
//                         color: controller.currentIndex.value == index
//                             ? AppColors.primaryColor
//                             : AppColors.grey,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
//
//   Widget _buildBackgroundCircle() {
//     return Positioned(
//       left: -400,
//       right: -400,
//       bottom: -500, // Position the circle partially off-screen
//       child: Center(
//         child: Container(
//           width: 800, // Adjust width to make the circle larger
//           height: 700, // Adjust height to make the circle larger
//           decoration: BoxDecoration(
//             color: AppColors.backgroundCircle,
//             shape: BoxShape.circle, // Make it circular
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBottomButtons() {
//     return Positioned(
//       left: 0,
//       right: 0,
//       bottom: 50,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Container(
//             width: double.infinity,
//             height: 65,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               children: [
//                 _buildButton(
//                   icon: Icons.login,
//                   text: 'Login',
//                   textColor: AppColors.black,
//                   backgroundColor: AppColors.white,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     bottomLeft: Radius.circular(15),
//                   ),
//                   onPressed: () {
//                     // Navigation will occur after the animation
//                     Get.toNamed(AppRoutes.login);
//                   },
//                 ),
//                 _buildButton(
//                   icon: Icons.person_add,
//                   text: 'Sign Up',
//                   textColor: AppColors.white,
//                   backgroundColor: AppColors.secondaryColor,
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(15),
//                     bottomRight: Radius.circular(15),
//                   ),
//                   onPressed: () {
//                     // Navigation will occur after the animation
//                     Get.toNamed(AppRoutes.signup);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
// Widget _buildButton({
//   required IconData icon,
//   required String text,
//   required Color textColor,
//   required Color backgroundColor,
//   required BorderRadius borderRadius,
//   required VoidCallback onPressed,
// }) {
//   final ValueNotifier<bool> _isScaling = ValueNotifier<bool>(false);
//
//   return Expanded(
//     child: ValueListenableBuilder<bool>(
//       valueListenable: _isScaling,
//       builder: (context, scaling, child) {
//         return InkWell(
//           onTap: () {
//             _isScaling.value = true;
//             Future.delayed(const Duration(milliseconds: 200), () {
//               _isScaling.value = false;
//               onPressed();  // Navigate after the animation
//             });
//           },
//           borderRadius: borderRadius,
//           child: AnimatedScale(
//             scale: scaling ? 0.95 : 1.0,
//             duration: const Duration(milliseconds: 100),
//             child: Container(
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 color: backgroundColor,
//                 borderRadius: borderRadius,
//               ),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       icon,
//                       color: textColor,
//                       size: 20,
//                     ),
//                     const SizedBox(width: 15),
//                     Text(
//                       text,
//                       style: TextStyle(
//                         color: textColor,
//                         fontSize: 13,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
//
//
//
// class OnboardingPage extends StatelessWidget {
//   final String image;
//   final String title;
//   final String description;
//
//   const OnboardingPage({
//     Key? key,
//     required this.image,
//     required this.title,
//     required this.description,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           top: 180,
//           child: Image.asset(
//             image,
//             fit: BoxFit.cover,
//             height: 400,
//             width: 400,
//           ),
//         ),
//         Positioned(
//           top: 100,
//           left: 16,
//           right: 16,
//           child: Column(
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.white),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 8.0),
//               Text(
//                 description,
//                 style: TextStyle(fontSize: 16, color: AppColors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:rubyscan/constants/constants.dart';
// import 'package:rubyscan/roots/routes.dart';
// import '../../assets/colors.dart';
// import '../../services/utils/orientation_lock.dart';
import '../../routes/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/orientation_lock.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/hand.png',
      'title': 'Your Window into the Ruby Blockchain',
      'description': 'Rubyscan provides clear access to Ruby blockchain data, allowing users to track transactions, check balances, and explore smart contracts in real time.',
    },
    {
      'image': 'assets/images/hand.png',
      'title': 'Unlocking Ruby Transparency with RubyLinkPro',
      'description': 'RubyLinkPro offers full transparency of Ruby blockchain, enabling users to view transactions, analyze gas fees, and for a clearer, secure blockchain experience.',
    },
    {
      'image': 'assets/images/hand.png',
      'title': 'Explore, Analyze, and Verify Ruby Data',
      'description': 'RubyScan is a powerful tool for exploring Ruby blockchain, allowing users to view transaction histories, examine wallet data with ease',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationLock(
      child: Scaffold(
        body: Stack(
          children: [
            _setBackgroundImage(),
            _buildPageView(),
            _buildIndicator(),
            _buildBackgroundCircle(),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _setBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/blockimg.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (index) => controller.currentIndex.value = index,
      itemCount: onboardingData.length,
      itemBuilder: (context, index) {
        return OnboardingPage(
          image: onboardingData[index]['image']!,
          title: onboardingData[index]['title']!,
          description: onboardingData[index]['description']!,
        );
      },
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 190,
      child: Align(
        alignment: Alignment.center,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? AppColors.primaryColor
                            : AppColors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildBackgroundCircle() {
    return Positioned(
      left: -400,
      right: -400,
      bottom: -500,
      child: Center(
        child: Container(
          width: 800,
          height: 700,
          decoration: BoxDecoration(
            color: AppColors.backgroundCircle,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                _buildButton(
                  icon: Icons.login,
                  text: 'Login',
                  textColor: AppColors.black,
                  backgroundColor: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.LOGIN);
                  },
                ),
                _buildButton(
                  icon: Icons.person_add,
                  text: 'Sign Up',
                  textColor: AppColors.white,
                  backgroundColor: AppColors.secondaryColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.SIGNUP);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildButton({
  required IconData icon,
  required String text,
  required Color textColor,
  required Color backgroundColor,
  required BorderRadius borderRadius,
  required VoidCallback onPressed,
}) {
  final ValueNotifier<bool> _isScaling = ValueNotifier<bool>(false);

  return Expanded(
    child: ValueListenableBuilder<bool>(
      valueListenable: _isScaling,
      builder: (context, scaling, child) {
        return InkWell(
          onTap: () {
            _isScaling.value = true;
            Future.delayed(const Duration(milliseconds: 200), () {
              _isScaling.value = false;
              onPressed(); // Navigate after the animation
            });
          },
          borderRadius: borderRadius,
          child: AnimatedScale(
            scale: scaling ? 0.95 : 1.0,
            duration: const Duration(milliseconds: 100),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: textColor,
                      size: 20,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 180,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 400,
            width: 400,
          ),
        ),
        Positioned(
          top: 150,
          left: 16,
          right: 16,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
