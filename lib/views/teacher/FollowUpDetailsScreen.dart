// screens/followup_details_screen.dart
import 'package:flutter/material.dart';
import 'package:URBANPRO/models/teacher/follow_up_model.dart';
import 'package:URBANPRO/utils/theme_constants.dart';

class FollowUpDetailsScreen extends StatelessWidget {
  final FollowUpModel followUp;

  const FollowUpDetailsScreen({Key? key, required this.followUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(
        backgroundColor: ThemeConstants.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          followUp.name,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: (value) {
              if (value == 'Report') {
                // Handle Report Action
              } else if (value == 'Archive') {
                // Handle Archive Action
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: 'Report', child: Text('Report an Issue')),
              const PopupMenuItem(value: 'Archive', child: Text('Archive')),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Info
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: ThemeConstants.primaryColor,
                  child: Text(
                    followUp.name[0].toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      followUp.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      followUp.studentClass,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          followUp.location,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        const Icon(Icons.directions_bike,
                            size: 16, color: Colors.grey),
                      ],
                    ),
                    Text(
                      followUp.status == "payment"
                          ? "Payment requested"
                          : "Enquiry",
                      style: TextStyle(
                        color: followUp.status == "payment"
                            ? Colors.orange
                            : Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Call, Demo, Payment Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.call, "Call"),
                _buildActionButton(Icons.calendar_today, "Demo Class"),
                _buildActionButton(Icons.attach_money, "Payment"),
              ],
            ),

            const SizedBox(height: 16),

            // Call Details Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.phone, color: Colors.black54),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Outgoing Call\nCall Connected    4:23",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const Text(
                    "↩ Reply",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Next Step
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "Next Step",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Contact this Student",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              "Call the student, understand requirements and offer a free demo class.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 12),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeConstants.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text("Call"),
              ),
            ),

            const SizedBox(height: 16),

            // Notes & Details Tabs
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: ThemeConstants.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: ThemeConstants.primaryColor,
                    tabs: const [
                      Tab(text: "Notes"),
                      Tab(text: "Enquiry Details"),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    child: TabBarView(
                      children: [
                        const Center(child: Text("No notes added")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Text("85 coins deducted"),
                            const Text("26% Transaction Fee"),
                            const SizedBox(height: 12),
                            Text("Posted Date: ${followUp.date}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: ThemeConstants.primaryColor, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
