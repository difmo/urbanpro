import 'package:URBANPRO/views/student/course_details_screen.dart';
import 'package:URBANPRO/views/widgets/custom_status_bar.dart';
import 'package:URBANPRO/views/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Using 3 tabs for different subject areas or categories
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return Scaffold(
      appBar:CustomTabBar(
        height: 124,
              title: "Courses (Classwise)",
              controller: _tabController,
              tabs: [
                {
                  'label': '1st - 4th',
                },
                {
                  'label': '5th - 8th',
                },
                {
                  'label': '9th - 12th',
                }
              ],
            ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ],
          ),
        ),
        child: Column(
          children: [
      
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildCourseList("1st - 4th Class", fontSize),
                  _buildCourseList("5th - 8th Class", fontSize),
                  _buildCourseList("9th - 12th Class", fontSize),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseList(String category, double fontSize) {
    // Dummy course data for students from 1st class to 12th class.

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.black26,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {
              // Navigate to Course Detail Screen with course details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    title: courses[index]["title"]!,
                    instructor: courses[index]["instructor"]!,
                    duration: courses[index]["duration"]!,
                    rating: courses[index]["rating"]!,
                    image: courses[index]["image"]!,
                    price: 'Rs/- 500',
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      courses[index]["image"]!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courses[index]["title"]!,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Instructor: ${courses[index]["instructor"]!}",
                          style: TextStyle(
                            fontSize: fontSize * 0.85,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Duration: ${courses[index]["duration"]!}",
                              style: TextStyle(
                                fontSize: fontSize * 0.75,
                                color: Colors.grey[700],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 18, color: Colors.amber),
                                const SizedBox(width: 5),
                                Text(
                                  courses[index]["rating"]!,
                                  style: TextStyle(
                                    fontSize: fontSize * 0.85,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Each map contains details for one course.
List<Map<String, String>> courses = [
  {
    "title": "Mathematics Basics (Class 1)",
    "instructor": "Ms. A. Math",
    "duration": "6h 00m",
    "rating": "4.5",
    "image": "https://picsum.photos/id/1011/200/300"
  },
  {
    "title": "Fundamentals of English (Class 2)",
    "instructor": "Mr. B. Words",
    "duration": "5h 30m",
    "rating": "4.6",
    "image": "https://picsum.photos/id/1025/200/300"
  },
  {
    "title": "Science Exploration (Class 3)",
    "instructor": "Dr. C. Discover",
    "duration": "7h 00m",
    "rating": "4.7",
    "image": "https://picsum.photos/id/1035/200/300"
  },
  {
    "title": "Social Studies Overview (Class 4)",
    "instructor": "Ms. D. History",
    "duration": "6h 15m",
    "rating": "4.4",
    "image": "https://picsum.photos/id/1045/200/300"
  },
  {
    "title": "Intermediate Mathematics (Class 5)",
    "instructor": "Mr. E. Numbers",
    "duration": "8h 00m",
    "rating": "4.8",
    "image": "https://picsum.photos/id/1055/200/300"
  },
  {
    "title": "Advanced English Grammar (Class 6)",
    "instructor": "Mrs. F. Language",
    "duration": "7h 45m",
    "rating": "4.6",
    "image": "https://picsum.photos/id/1065/200/300"
  },
  {
    "title": "Basic Science Concepts (Class 7)",
    "instructor": "Dr. G. Elements",
    "duration": "8h 20m",
    "rating": "4.5",
    "image": "https://picsum.photos/id/1075/200/300"
  },
  {
    "title": "History and Civics (Class 8)",
    "instructor": "Mr. H. Past",
    "duration": "6h 50m",
    "rating": "4.7",
    "image": "https://picsum.photos/id/1075/200/300"
  },
  {
    "title": "Algebra & Geometry (Class 9)",
    "instructor": "Ms. I. Shapes",
    "duration": "9h 10m",
    "rating": "4.8",
    "image": "https://picsum.photos/id/1075/200/300"
  },
  {
    "title": "Comprehensive Studies (Class 12)",
    "instructor": "Dr. J. Scholar",
    "duration": "10h 00m",
    "rating": "4.9",
    "image": "https://picsum.photos/id/1075/200/300"
  },
];
