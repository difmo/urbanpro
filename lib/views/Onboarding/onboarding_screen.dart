import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utils/orientation_lock.dart';
import 'onboarding_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/education.png',
      'title': 'Your Gateway to Quality Learning',
      'description':
          'Urban Pro connects students with expert tutors, helping them access high-quality education in various subjects and skills.',
    },
    {
      'image': 'assets/images/education.png',
      'title': 'Find the Best Tutors for Your Needs',
      'description':
          'Urban Pro offers a vast network of professional tutors, making it easy to find and connect with the right educator for your learning journey.',
    },
    {
      'image': 'assets/images/education.png',
      'title': 'Upskill with Personalized Learning',
      'description':
          'From academics to professional skills, Urban Pro provides a platform to enhance your knowledge through one-on-one and group learning sessions.',
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
        backgroundColor: ThemeConstants.white,
        body: Stack(
          children: [
            // Positioned(
            //   top: 100,
            //   left: 60,
            //   child: Container(
            //     child: SvgPicture.asset(
            //       'assets/bg/onboardbook.svg',
            //     ),
            //   ),
            // ),
            Positioned(
              top: 0,
              left: 15,
              child: Container(
                child: SvgPicture.asset(
                  'assets/bg/onboard.svg',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 15,
              child: Container(
                child: SvgPicture.asset(
                  'assets/bg/onboardbottom.svg',
                ),
              ),
            ),
            _buildPageView(),
            _buildIndicator(),
            _buildBottomButtons(),
          ],
        ),
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
                            ? ThemeConstants.primaryColor
                            : ThemeConstants.grey,
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
                  text: 'Get Started',
                  icon: Icons.arrow_forward_sharp,
                  textColor: ThemeConstants.white,
                  backgroundColor: const Color.fromARGB(255, 17, 191, 245),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.LOGIN);
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
  required String text,
  required IconData icon,
  required Color textColor,
  required Color backgroundColor,
  required BorderRadius borderRadius,
  required VoidCallback onPressed,
}) {
  final ValueNotifier<bool> isScaling = ValueNotifier<bool>(false);

  return Expanded(
    child: ValueListenableBuilder<bool>(
      valueListenable: isScaling,
      builder: (context, scaling, child) {
        return InkWell(
          onTap: () {
            isScaling.value = true;
            Future.delayed(const Duration(milliseconds: 200), () {
              isScaling.value = false;
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
                    Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      icon,
                      color: textColor,
                      size: 25,
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
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left:
                MediaQuery.of(context).size.width * 0.15, // Adjusts dynamically
            top: 150,
            child: TweenAnimationBuilder(
              tween: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)),
              duration: Duration(seconds: 2),
              curve: Curves.easeOut, // Smooth animation
              builder: (context, Offset offset, child) {
                return Transform.translate(
                  offset: offset * 100, // image,
                  child: Image.asset(image, width: 300, height: 300),
                );
              },
            )),
        SizedBox(height: 20),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5, // Adjusts dynamically
          left: 16,
          right: 16,
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeConstants.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: ThemeConstants.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
