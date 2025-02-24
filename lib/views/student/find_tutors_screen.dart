import 'package:URBANPRO/views/student/tutor_details_screen.dart';
import 'package:flutter/material.dart';

class FindTutorsScreen extends StatefulWidget {
  const FindTutorsScreen({super.key});

  @override
  _FindTutorsScreenState createState() => _FindTutorsScreenState();
}

class _FindTutorsScreenState extends State<FindTutorsScreen> {
  List<Map<String, String>> tutors = [
    {
      "name": "John Doe",
      "subject": "Mathematics",
      "experience": "5 Years",
      "rating": "4.8",
      "image": "https://randomuser.me/api/portraits/men/1.jpg"
    },
    {
      "name": "Jane Smith",
      "subject": "Science",
      "experience": "3 Years",
      "rating": "4.6",
      "image": "https://randomuser.me/api/portraits/women/2.jpg"
    },
    {
      "name": "Robert Brown",
      "subject": "Physics",
      "experience": "6 Years",
      "rating": "4.9",
      "image": "https://randomuser.me/api/portraits/men/3.jpg"
    },
    {
      "name": "Emily White",
      "subject": "English",
      "experience": "4 Years",
      "rating": "4.7",
      "image": "https://randomuser.me/api/portraits/women/4.jpg"
    },
    {
      "name": "Michael Green",
      "subject": "Chemistry",
      "experience": "8 Years",
      "rating": "4.9",
      "image": "https://randomuser.me/api/portraits/men/5.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Find Tutors",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
            colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)], // Dark Gradient
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 90),
            _buildSearchBar(),
            Expanded(child: _buildTutorList(fontSize, screenWidth)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for tutors...",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTutorList(double fontSize, double screenWidth) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: tutors.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 8,
          shadowColor: Colors.black26,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    tutors[index]["image"]!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tutors[index]["name"]!,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Subject: ${tutors[index]["subject"]!}",
                        style: TextStyle(
                          fontSize: fontSize * 0.85,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "Experience: ${tutors[index]["experience"]!}",
                        style: TextStyle(
                          fontSize: fontSize * 0.75,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 18, color: Colors.amber),
                          const SizedBox(width: 5),
                          Text(
                            tutors[index]["rating"]!,
                            style: TextStyle(
                              fontSize: fontSize * 0.85,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorDetailScreen(
                          name: tutors[index]["name"]!,
                          subject: tutors[index]["subject"]!,
                          experience: tutors[index]["experience"]!,
                          rating: tutors[index]["rating"]!,
                          image: tutors[index]["image"]!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)],
                      ),
                      borderRadius: BorderRadius.circular(48),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: const Text(
                      "Join Class",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
