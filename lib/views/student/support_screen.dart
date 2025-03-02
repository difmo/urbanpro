import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/student/live_chat_support_screen.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.045;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Get Help Support"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 90),
            _buildProfileSection(),
            const SizedBox(height: 20),
            _buildContactSection(fontSize),
            const SizedBox(height: 20),
            Expanded(child: _buildFaqSection(fontSize)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: _buildChatButton(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12, width: 0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  "https://picsum.photos/seed/picsum/200/300"), // Replace with user's image URL
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "John Doe", // Replace with user's name
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "johndoe@example.com", // Replace with user's email
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12, width: 0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Contact Support",
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 10),
              _buildContactItem(Icons.call, "+1 800 123 4567"),
              const Divider(),
              _buildContactItem(Icons.email, "support@edulearn.com"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(text, style: const TextStyle(color: Colors.black)),
      onTap: () {
        // Add call or email functionality
      },
    );
  }

  Widget _buildFaqSection(double fontSize) {
    List<Map<String, String>> faqs = [
      {
        "question": "How do I reset my password?",
        "answer": "Go to settings > account > reset password."
      },
      {
        "question": "How do I join a live class?",
        "answer": "Click on the 'Join' button in your course dashboard."
      },
      {
        "question": "How do I contact my tutor?",
        "answer": "Use the 'Message Tutor' button in your course page."
      },
      {
        "question": "How do I change my subscription?",
        "answer": "Go to settings > subscription > change plan."
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12, width: 0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text("Frequently Asked Questions",
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: faqs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(faqs[index]["question"]!,
                              style: TextStyle(
                                  fontSize: fontSize * 0.9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          trailing: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(faqs[index]["question"]!,
                                      style: TextStyle(
                                          fontSize: fontSize * 0.9,
                                          fontWeight: FontWeight.bold)),
                                  content: Text(faqs[index]["answer"]!,
                                      style: TextStyle(
                                          fontSize: fontSize * 0.85,
                                          color: Colors.grey[700])),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Close"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        if (index < faqs.length - 1) const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LiveChatScreen()),
          );
        },
        icon: const Icon(Icons.chat, color: Colors.white),
        label: const Text("Live Chat Support",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConstants.secondaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
