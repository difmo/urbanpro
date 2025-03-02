import 'package:flutter/material.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: _customAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildEmptyState("No Scheduled Course found!\nContact the Tutor to schedule your classes."),
          _buildEmptyState("No Pending Courses found!"),
          _buildEmptyState("No Courses available at the moment."),
        ],
      ),
    );
  }

  PreferredSize _customAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 5),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Scheduled"),
                  Tab(text: "Pending"),
                  Tab(text: "All"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      gradient: LinearGradient(
        colors: [Colors.white, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }



  Widget _buildEmptyState(String message) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
