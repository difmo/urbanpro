import 'package:URBANPRO/models/leads/lead_model.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class LeadDetailsScreen extends StatefulWidget {
  final Lead lead;

  const LeadDetailsScreen({super.key, required this.lead});

  @override
  State<LeadDetailsScreen> createState() => _LeadDetailsScreenState();
}

class _LeadDetailsScreenState extends State<LeadDetailsScreen>
    with SingleTickerProviderStateMixin {
  int _activeTab = 0;
  double _sliderValue = 4; // Track slider value

  // Toggle FAB
  bool isFabOpen = false;

  // Handle tab switch
  void _setActiveTab(int index) {
    setState(() {
      _activeTab = index;
    });
  }

  late AnimationController _animationController;
  late Animation<double> _animateIcon;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _animateIcon =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  void toggleFab() {
    setState(() {
      isFabOpen = !isFabOpen;
      if (isFabOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  // Build tab with active style
  Widget _buildTab(String title, IconData icon, int index) {
    final isActive = _activeTab == index;
    return GestureDetector(
      onTap: () => _setActiveTab(index),
      child: Column(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.deepPurple : Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.deepPurple : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget fabOption(
      IconData icon, Color color, String label, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Text(label, style: const TextStyle(color: Colors.black)),
        ),
        FloatingActionButton(
          heroTag: label,
          mini: true,
          backgroundColor: color,
          onPressed: onPressed,
          child: Icon(icon, color: Colors.black),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lead Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement sharing functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lead No: ${widget.lead.leadNo}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const SizedBox(height: 8),
              _buildInfoRow(Icons.class_, "Class", widget.lead.classInfo),
              _buildInfoRow(Icons.school, "Subject", widget.lead.subject),
              _buildInfoRow(
                  Icons.location_on, "Location", widget.lead.location),
              _buildInfoRow(Icons.money, "Fee", "₹${widget.lead.fee}/Hr"),
              _buildInfoRow(
                  Icons.person, "Tutor Gender", widget.lead.tutorGender),
              _buildInfoRow(Icons.offline_bolt, "Mode", widget.lead.mode),
              const SizedBox(height: 16),
              const Text(
                "Note:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                widget.lead.note ?? "No special requirements.",
                style: const TextStyle(color: Colors.blue),
              ),
              const SizedBox(height: 16),
              _buildInfoRow(Icons.monetization_on, "Coins needed",
                  widget.lead.coinsRequired.toString()),
              _buildInfoRow(Icons.people, "Responses",
                  "${widget.lead.responses} out of 3 Responded"),
              const SizedBox(height: 16),
              _buildContactCard(widget.lead),
              const SizedBox(height: 24),

              // Tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTab('Matched', Icons.wifi_tethering, 0),
                  _buildTab('Collected', Icons.people_alt_outlined, 1),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Search Radius Slider
                  const Text(
                    "Search Nearby Leads in Radius of ",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "[${_sliderValue.toStringAsFixed(1)} Kms]",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ],
              ),
              Slider(
                value: _sliderValue,
                min: 1,
                max: 10,
                divisions: 9,
                activeColor: Colors.deepPurple,
                inactiveColor: Colors.grey,
                label: "${_sliderValue.toStringAsFixed(1)} Kms",
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Placeholder for data
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _activeTab == 0
                        ? "No Data found in Matched"
                        : "No Data found in Collected",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isFabOpen) ...[
            fabOption(Icons.upload, Colors.green, "Repost",
                () => print('Repost clicked')),
            const SizedBox(height: 10),
            fabOption(
                Icons.edit, Colors.orange, "Edit", () => print('Edit clicked')),
            const SizedBox(height: 10),
            fabOption(Icons.delete, Colors.red, "Delete",
                () => print('Delete clicked')),
            const SizedBox(height: 10),
          ],
          FloatingActionButton(
            onPressed: toggleFab,
            backgroundColor: ThemeConstants.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48), // Set radius to 24
            ),
            child: Icon(
              isFabOpen ? Icons.close : Icons.more_horiz,
              color: ThemeConstants.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 8),
          Text(
            "$title: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(Lead lead) {
    return Card(
      color: Colors.yellow.shade100,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(Icons.person, "Contact name", lead.contactName),
            _buildInfoRow(Icons.phone, "Contact number", lead.contactNumber),
            _buildInfoRow(Icons.email, "Contact email", lead.contactEmail),
          ],
        ),
      ),
    );
  }
}
