import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/student/start_test_screen.dart';
import 'package:flutter/material.dart';

class TestSeriesScreen extends StatefulWidget {
  const TestSeriesScreen({super.key});
  @override
  _TestSeriesScreenState createState() => _TestSeriesScreenState();
}

class _TestSeriesScreenState extends State<TestSeriesScreen>
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Test Series",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Text(
      //     "Test Series",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.search, color: Colors.white),
      //       onPressed: () {
      //       },
      //     ),
      //   ],
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              ThemeConstants.whiteColor
            ], 
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 90),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTestSeriesList("Mathematics", fontSize),
                  _buildTestSeriesList("Science", fontSize),
                  _buildTestSeriesList("English", fontSize),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          tabs: const [
            Tab(text: "Mathematics"),
            Tab(text: "Science"),
            Tab(text: "English"),
          ],
        ),
      ),
    );
  }

  Widget _buildTestSeriesList(String subject, double fontSize) {
    List<Map<String, String>> testSeries = [
      {
        "title": "Basic Algebra Test",
        "questions": "20",
        "duration": "30 min",
        "level": "Easy",
        "image":
            "https://fastly.picsum.photos/id/1010/200/200.jpg?hmac=030jCT8DyI2wW-CYue7-l9xlHBAGpacaSJ6tYnnka3I"
      },
      {
        "title": "Trigonometry Challenge",
        "questions": "25",
        "duration": "40 min",
        "level": "Medium",
        "image":
            "https://fastly.picsum.photos/id/1010/200/200.jpg?hmac=030jCT8DyI2wW-CYue7-l9xlHBAGpacaSJ6tYnnka3I"
      },
      {
        "title": "Probability & Statistics",
        "questions": "15",
        "duration": "25 min",
        "level": "Hard",
        "image":
            "https://fastly.picsum.photos/id/1010/200/200.jpg?hmac=030jCT8DyI2wW-CYue7-l9xlHBAGpacaSJ6tYnnka3I"
      },
      {
        "title": "Probability & Statistics",
        "questions": "15",
        "duration": "25 min",
        "level": "Hard",
        "image":
            "https://fastly.picsum.photos/id/1010/200/200.jpg?hmac=030jCT8DyI2wW-CYue7-l9xlHBAGpacaSJ6tYnnka3I"
      },
      {
        "title": "Probability & Statistics",
        "questions": "15",
        "duration": "25 min",
        "level": "Hard",
        "image":
            "https://fastly.picsum.photos/id/1010/200/200.jpg?hmac=030jCT8DyI2wW-CYue7-l9xlHBAGpacaSJ6tYnnka3I"
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: testSeries.length,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        testSeries[index]["image"]!,
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
                            testSeries[index]["title"]!,
                            style: TextStyle(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Subject: $subject  \nLevel: ${testSeries[index]["level"]!}",
                            style: TextStyle(
                              fontSize: fontSize * 1,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: fontSize * 0.9, color: Colors.grey[700]),
                        const SizedBox(width: 5),
                        Text(
                          testSeries[index]["duration"]!,
                          style: TextStyle(
                              fontSize: fontSize * 1, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.help_outline,
                            size: fontSize * 0.9, color: Colors.grey[700]),
                        const SizedBox(width: 5),
                        Text( 
                          "${testSeries[index]["questions"]!} Questions",
                          style: TextStyle(
                              fontSize: fontSize * 1, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartTestScreen(
                            title: testSeries[index]["title"]!,
                            questions: testSeries[index]["questions"]!,
                            duration: testSeries[index]["duration"]!,
                            level: testSeries[index]["level"]!,
                            image: testSeries[index]["image"]!,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.play_arrow, size: 18),
                    label: const Text("Start Test"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(fontSize: fontSize * 0.85),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
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
