import 'package:URBANPRO/views/student/chat_with_tutor_screen.dart';
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

            // Join Class Button
            _buildGradientButton("Join Class", () {
              // Join class functionality
            }),

            const SizedBox(height: 15),

            // Chat with Tutor Button
            _buildOutlinedButton("Chat with Tutor", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatWithTutorScreen(tutorName: name),
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

  Widget _buildGradientButton(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onTap,
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)]),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
