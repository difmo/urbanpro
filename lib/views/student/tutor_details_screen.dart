import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/student/chat_with_tutor_screen.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TutorDetailScreen extends StatelessWidget {
  final String name;
  final String subject;
  final String experience;
  final String rating;
  final String image;

  const TutorDetailScreen({
    super.key,
    required this.name,
    required this.subject,
    required this.experience,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(title: Text(name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(image,
                  width: 120, height: 120, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            Text(subject,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Experience: $experience",
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
            Text("Rating: $rating ⭐",
                style: const TextStyle(fontSize: 16, color: Colors.grey)),

            const SizedBox(height: 25),

            // Tutor Bio
            _buildSectionTitle("About the Tutor"),
            _buildDescription(
                "Hello! I'm $name, an experienced tutor in $subject. I have been teaching for over $experience and have helped many students improve their skills. My approach is interactive, engaging, and tailored to every student's needs."),

            const SizedBox(height: 20),

            // Available Timings
            _buildSectionTitle("Available Timings"),
            _buildDescription(
                "Monday - Friday: 4:00 PM - 8:00 PM\nSaturday - Sunday: 10:00 AM - 5:00 PM"),

            const SizedBox(height: 20),

            // Pricing
            _buildSectionTitle("Pricing"),
            _buildDescription(
                "\$20 per session (1 hour)\nDiscounts available for monthly subscriptions."),

            const SizedBox(height: 30),

            CustomButton(width: 150, text: "Join Class", onPressed: () {}),
            const SizedBox(height: 15),

            CustomButton(
                text: "Chat with Tutor",
                width: 300,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChatWithTutorScreen(tutorName: name),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
