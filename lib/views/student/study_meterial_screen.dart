import 'package:URBANPRO/views/student/study_meterial_details_screen.dart';
import 'package:URBANPRO/views/widgets/custom_status_bar.dart';
import 'package:URBANPRO/views/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class StudyMaterialScreen extends StatefulWidget {
  const StudyMaterialScreen({super.key});

  @override
  _StudyMaterialScreenState createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomStatusBar(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255)
            ], // Gradient background
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30), // Push content below app bar
            CustomTabBar(
              controller: _tabController,
              tabs: [
                {
                  'label': 'Notes',
                },
                {
                  'label': 'Videos',
                },
                {
                  'label': 'Books',
                }
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildStudyMaterialList("Notes", fontSize),
                  _buildStudyMaterialList("Videos", fontSize),
                  _buildStudyMaterialList("Books", fontSize),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyMaterialList(String category, double fontSize) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: studyMaterials.length, // Replace with actual data
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 6,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://fastly.picsum.photos/id/1010/200/200.jpg?hmac=030jCT8DyI2wW-CYue7-l9xlHBAGpacaSJ6tYnnka3I", // Placeholder image
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$category Material ${index + 1}",
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "A brief description of the study material goes here.",
                        style: TextStyle(
                          fontSize: fontSize * 0.85,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PDF | 2.5 MB",
                            style: TextStyle(
                              fontSize: fontSize * 0.8,
                              color: Colors.blue,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StudyMaterialDetailsScreen(
                                    title: studyMaterials[index]["title"]!,
                                    description: studyMaterials[index]
                                        ["description"]!,
                                    rating: studyMaterials[index]["rating"]!,
                                    fileSize: studyMaterials[index]
                                        ["fileSize"]!,
                                    image: studyMaterials[index]["image"]!,
                                    price: '',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF6A82FB),
                                    Color(0xFFFC5C7D)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(48),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  const Icon(Icons.download,
                                      color: Colors.white),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Download",
                                    style: TextStyle(
                                      fontSize: fontSize * 0.85,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

final List<Map<String, String>> studyMaterials = [
  {
    "title": "Mathematics Notes",
    "description": "Comprehensive math study material with solved examples.",
    "price": "\$9.99",
    "rating": "4.8",
    "fileSize": "2.5 MB",
    "image": "https://picsum.photos/200/300"
  },
  {
    "title": "Physics Video Lectures",
    "description": "High-quality physics video lectures from experts.",
    "price": "\$14.99",
    "rating": "4.7",
    "fileSize": "1.8 GB",
    "image": "https://picsum.photos/201/300"
  },
  {
    "title": "Chemistry Book",
    "description": "Detailed chemistry book with practical experiments.",
    "price": "\$19.99",
    "rating": "4.9",
    "fileSize": "5.2 MB",
    "image": "https://picsum.photos/202/300"
  },
  {
    "title": "Chemistry Book",
    "description": "Detailed chemistry book with practical experiments.",
    "price": "\$19.99",
    "rating": "4.9",
    "fileSize": "5.2 MB",
    "image": "https://picsum.photos/202/300"
  },
  {
    "title": "Chemistry Book",
    "description": "Detailed chemistry book with practical experiments.",
    "price": "\$19.99",
    "rating": "4.9",
    "fileSize": "5.2 MB",
    "image": "https://picsum.photos/202/300"
  },
];
