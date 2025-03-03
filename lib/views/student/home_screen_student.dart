import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class StudentNewHomeScreen extends StatefulWidget {
  const StudentNewHomeScreen({super.key});

  @override
  _StudentNewHomeScreenState createState() => _StudentNewHomeScreenState();
}

class _StudentNewHomeScreenState extends State<StudentNewHomeScreen> {


 @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green, // Change to your desired color
      statusBarIconBrightness: Brightness.light, // Light icons for dark background
    ));
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Set back to default or previous color
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 247),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Jerel",
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w600)),
                      Text("Find your lessons today!",
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.notifications, size: 30, color: Colors.black),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search now...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
      
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
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
                        foregroundColor: Colors.orangeAccent,
                      ),
                      child: Text("Explore more"),
                    ),
                  ],
                ),
              ),
      
              /////////////////////////////////////////////////////////////////////////
              SizedBox(height: 20),
              ExploreCategories(),
              SizedBox(height: 20),
              Text("Popular lessons",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
              /////////////////////////////////////////////////////////////////////////
              SizedBox(height: 20),
              Text("Popular lessons",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
              /////////////////////////////////////////////////////////////////////////
              SizedBox(height: 20),
              Text("Popular lessons",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
            ],
          ),
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final double rating;

  const LessonCard(
      {super.key, required this.title,
      required this.subtitle,
      required this.duration,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 10),
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w600)),
          Text(subtitle,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(duration,
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.grey)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(rating.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExploreCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": FeatherIcons.penTool, "label": "Design"},
    {"icon": FeatherIcons.code, "label": "Programmer"},
    {"icon": FeatherIcons.dollarSign, "label": "Finance"},
    {"icon": FeatherIcons.settings, "label": "Soft skill"},
    {"icon": FeatherIcons.monitor, "label": "Accountancy"},
    {"icon": FeatherIcons.share2, "label": "Data science"},
    {"icon": FeatherIcons.globe, "label": "Language"},
    {"icon": FeatherIcons.barChart2, "label": "Marketing"},
  ];

   ExploreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore categories",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(categories[index]['icon'],
                      size: 28, color: Colors.amber[800]),
                  SizedBox(height: 8),
                  Text(
                    categories[index]['label'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
