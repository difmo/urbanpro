import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 10),
            const Text(
              "Account",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(),
            const Divider(thickness: 1),
            _buildMenuItem(Icons.person, "Profile"),
            _buildMenuItem(Icons.cloud_download, "Saved Files"),
            _buildMenuItem(Icons.receipt_long, "Billing History"),
            _buildMenuItem(Icons.settings, "Settings"),
            _buildMenuItem(Icons.share, "Refer & Earn", isNew: true),
            _buildMenuItem(Icons.group, "New Students"),
            _buildMenuItem(Icons.help, "Help & Support"),
            _buildMenuItem(Icons.logout, "Logout"),
            const SizedBox(height: 20),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 30, color: Colors.grey[600]),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dinesh",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Upgrade to Prime",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
              const Text(
                "0 Hours Learned",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isNew = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          if (isNew)
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("NEW",
                  style: TextStyle(color: Colors.red, fontSize: 12)),
            ),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Text("Have any feedback? Kindly",
            style: TextStyle(color: Colors.black54)),
        TextButton(
          onPressed: () {},
          child:
              const Text("let us know", style: TextStyle(color: Colors.blue)),
        ),
        const Text("App Version 25.01.24",
            style: TextStyle(color: Colors.black54)),
      ],
    );
  }
}
