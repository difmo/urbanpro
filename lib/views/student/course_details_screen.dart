import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  final String instructor;
  final String duration;
  final String rating;
  final String image;
  final String price;

  const CourseDetailScreen({
    super.key,
    required this.title,
    required this.instructor,
    required this.duration,
    required this.rating,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: ThemeConstants.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Course Details"),
      ),
      body: Column(
        children: [
          _buildImageSection(),
          Expanded(child: _buildCourseDetails(fontSize)),
          // _buildEnrollButton(fontSize, context),
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: CustomButton(text: "Enroll Now - Rs/-500", onPressed: () {}),
          )
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildCourseDetails(double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.person, size: 22, color: Colors.blue),
                const SizedBox(width: 5),
                Text(
                  "Instructor: $instructor",
                  style: TextStyle(fontSize: fontSize * 0.9),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.timer, size: 22, color: Colors.green),
                const SizedBox(width: 5),
                Text(
                  "Duration: $duration",
                  style: TextStyle(fontSize: fontSize * 0.9),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, size: 22, color: Colors.amber),
                const SizedBox(width: 5),
                Text(
                  "Rating: $rating ⭐",
                  style: TextStyle(fontSize: fontSize * 0.9),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "Course Overview",
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "This course provides in-depth knowledge and practical "
              "experience in the subject. Perfect for both beginners and advanced learners.",
              style:
                  TextStyle(fontSize: fontSize * 0.85, color: Colors.grey[700]),
            ),
            const SizedBox(height: 15),
            _buildCourseSyllabus(fontSize),
            const SizedBox(height: 15),
            _buildStudentReviews(fontSize),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseSyllabus(double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Course Syllabus",
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        ...syllabus.map((topic) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    topic,
                    style: TextStyle(fontSize: fontSize * 0.85),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildStudentReviews(double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Student Reviews",
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        ...reviews.map((review) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review["name"]!,
                      style: TextStyle(
                          fontSize: fontSize * 0.85,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 5),
                        Text(review["rating"]!,
                            style: TextStyle(fontSize: fontSize * 0.85)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      review["comment"]!,
                      style: TextStyle(
                          fontSize: fontSize * 0.85, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

List<Map<String, String>> reviews = [
  {
    "name": "John Doe",
    "comment": "Great course! The instructor explained everything clearly.",
    "rating": "4.8"
  },
  {
    "name": "Emily Smith",
    "comment": "Loved the hands-on projects and practical assignments!",
    "rating": "4.7"
  },
  {
    "name": "Michael Johnson",
    "comment": "Best course for beginners and professionals alike!",
    "rating": "5.0"
  }
];

List<String> syllabus = [
  "Introduction to the subject",
  "Fundamentals and Basic Concepts",
  "Intermediate Level Topics",
  "Advanced Applications",
  "Final Project & Practical Assignments"
];
