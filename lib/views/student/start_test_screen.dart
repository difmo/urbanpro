import 'package:flutter/material.dart';

class StartTestScreen extends StatelessWidget {
  final String title;
  final String questions;
  final String duration;
  final String level;
  final String image;

  const StartTestScreen({
    super.key,
    required this.title,
    required this.questions,
    required this.duration,
    required this.level,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Test Details",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            const IconThemeData(color: Colors.white), // White back button
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageSection(),
            _buildTestDetails(),
            _buildSyllabusSection(),
            const SizedBox(height: 20),
            _buildStartButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 250,
          color: Colors.black.withOpacity(0.5), // Black overlay for readability
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTestDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Test Level: $level",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text("Duration: $duration",
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text("Total Questions: $questions",
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.timer, color: Colors.red),
              const SizedBox(width: 5),
              Text("Time Limit: $duration",
                  style: const TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Ensure you have a stable internet connection before starting the test.",
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSyllabusSection() {
    List<String> syllabus = [
      "Algebraic Expressions",
      "Linear Equations",
      "Quadratic Equations",
      "Trigonometry Basics",
      "Statistics & Probability",
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Test Syllabus",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...syllabus.map(
            (topic) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 10),
                  Text(topic, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            // Navigate to Test Start
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("Start Test", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
