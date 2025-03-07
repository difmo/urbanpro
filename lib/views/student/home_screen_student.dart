import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/category_section.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:URBANPRO/views/widgets/lesson_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentNewHomeScreen extends StatefulWidget {
  const StudentNewHomeScreen({super.key});

  @override
  _StudentNewHomeScreenState createState() => _StudentNewHomeScreenState();
}

class _StudentNewHomeScreenState extends State<StudentNewHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Jerel", style: AppTextStyle.Text20600),
                      Text("Find your lessons today!",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.notifications,
                      size: 30, color: ThemeConstants.primaryColor),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CommonTextField(
                    inputType: InputType.name,
                    controller: _searchController,
                    onChanged: (String value) {},
                    label: "",
                    hint: "Search now...")),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(169, 17, 192, 245),
                      Color(0xFF1AD6FD)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Discover Top Picks",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                            Text("+100 lessons",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.white)),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor:
                                    const Color.fromARGB(255, 70, 70, 70),
                              ),
                              child: Text("Explore more"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10, // Adjust position as necessary
                      left: -20, // Adjust position as necessary
                      child: SvgPicture.asset(
                        "assets/bg/circle.svg",
                        height: 100, // You can adjust the size as needed
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            /////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("Explore categories",
                  style: AppTextStyle.Text18600.copyWith(
                    color: ThemeConstants.grey,
                  )),
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: ExploreCategories(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("Popular lessons",
                  style: AppTextStyle.Text18600.copyWith(
                    color: ThemeConstants.grey,
                  )),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                  ],
                ),
              ),
            ),
            /////////////////////////////////////////////////////////////////////////
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("Popular lessons",
                  style: AppTextStyle.Text18600.copyWith(
                    color: ThemeConstants.grey,
                  )),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                  ],
                ),
              ),
            ),
            /////////////////////////////////////////////////////////////////////////
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("Popular lessons",
                  style: AppTextStyle.Text18600.copyWith(
                    color: ThemeConstants.grey,
                  )),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                    SizedBox(width: 10),
                    LessonCard(
                        title: "Figma master class",
                        subtitle: "UI Design",
                        duration: "6h 30min",
                        rating: 4.9),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
