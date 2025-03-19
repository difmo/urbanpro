import 'package:URBANPRO/models/teacher/account_model.dart';
import 'package:URBANPRO/services/account_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AccountService _accountService = AccountService();
  late Future<Account> _accountFuture;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isProfileVisible = true; // ✅ Track Profile Visibility Status

  @override
  void initState() {
    super.initState();
    _accountFuture = _accountService.fetchAccountDetails().then((account) {
      isProfileVisible = account.isProfileOn; // Initialize profile status
      return account;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: CustomAppBar(
        title: "My Profile",
        backgroundColor: ThemeConstants.primaryColor,
        scaffoldKey: _scaffoldKey,
      ),
      body: FutureBuilder<Account>(
        future: _accountFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Failed to load account details"));
          }

          final account = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🌟 Profile Section with Toggle Switch
                _buildProfileSection(account),

                const SizedBox(height: 20),

                // 🔍 Tutor Details Section
                _buildTutorDetailsSection(account),

                const SizedBox(height: 20),

                // 🏅 Certifications Section
                _buildCertificationsSection(account.certifications),

                const SizedBox(height: 20),

                // ⭐ Performance Stats Section
                _buildPerformanceStatsSection(account),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  /// 🌟 **Profile Section with Visibility Switch**
  Widget _buildProfileSection(Account account) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(account.profileImage),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account.name,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ThemeConstants.primaryColor),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    account.qualification,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${account.experience} years of experience",
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),

            // 🔥 Profile Visibility Switch
            Switch(
              value: isProfileVisible,
              onChanged: (value) => setState(() {
                isProfileVisible = value;
                _updateProfileVisibility(value);
              }),
              activeColor: ThemeConstants.primaryColor,
              inactiveTrackColor: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔍 **Tutor Details Section**
  Widget _buildTutorDetailsSection(Account account) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoTile(Icons.email, "Email", account.email),
            _buildInfoTile(Icons.phone, "Phone", account.phone),
            _buildInfoTile(Icons.location_city, "City", account.city),
            _buildInfoTile(
                Icons.menu_book, "Subjects", account.subjects.join(", ")),
            _buildInfoTile(
                Icons.computer, "Teaching Mode", account.teachingMode),
            _buildInfoTile(
                Icons.attach_money, "Hourly Rate", "₹${account.hourlyRate}/hr"),
            _buildInfoTile(
                Icons.access_time, "Availability", account.availability),
            _buildInfoTile(Icons.info_outline, "Bio", account.bio),
          ],
        ),
      ),
    );
  }

  /// 🏅 **Certifications Section**
  Widget _buildCertificationsSection(List<String> certifications) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Certifications",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ThemeConstants.primaryColor),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: certifications
                  .map((cert) => Chip(
                        label: Text(cert),
                        backgroundColor: ThemeConstants.secondaryColor,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  /// ⭐ **Performance Stats Section**
  Widget _buildPerformanceStatsSection(Account account) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatTile("⭐ Rating", "${account.rating}/5"),
            _buildStatTile("💬 Reviews", "${account.totalReviews}"),
            _buildStatTile("🎓 Students", "${account.totalStudents}"),
            _buildStatTile("📚 Courses", "${account.totalCourses}"),
          ],
        ),
      ),
    );
  }

  /// ⭐ **Reusable Stats Tile**
  Widget _buildStatTile(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ThemeConstants.primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 🔧 **Reusable Info Tile**
  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: ThemeConstants.primaryColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title:",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                color: ThemeConstants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🛠️ **Update Profile Visibility (API Placeholder)**
  void _updateProfileVisibility(bool isVisible) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Profile visibility turned ${isVisible ? "ON" : "OFF"}"),
      duration: const Duration(seconds: 1),
    ));
  }
}
