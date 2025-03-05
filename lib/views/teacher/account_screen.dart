import 'package:URBANPRO/models/teacher/account_model.dart';
import 'package:URBANPRO/services/account_service.dart';
import 'package:flutter/material.dart';
import '../widgets/toggle_switch.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AccountService _accountService = AccountService();
  late Future<Account> _accountFuture;

  @override
  void initState() {
    super.initState();
    _accountFuture = _accountService.fetchAccountDetails();
  }

  void _editProfile(Account account) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Edit Profile Clicked")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Account>(
        future: _accountFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Failed to load account details"));
          }
          Account account = snapshot.data!;

          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth > 600 ? 32 : 16,
                    vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Profile Section
                    _buildProfileSection(account, constraints),

                    SizedBox(height: 16),

                    /// Profile ON/OFF Switch
                    ToggleSwitch(
                      title: "Profile ON/OFF",
                      value: account.isProfileOn,
                      onChanged: (newValue) {
                        setState(() {
                          account.isProfileOn = newValue;
                        });
                      },
                    ),
                    if (account.isProfileOn)
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 16),
                        child: Text(
                          "Max Calls per Day: ${account.maxCallsPerDay}",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),

                    /// Review System Switch
                    ToggleSwitch(
                      title: "Allow Reviews",
                      value: account.allowReviews,
                      onChanged: (newValue) {
                        setState(() {
                          account.allowReviews = newValue;
                        });
                      },
                    ),

                    SizedBox(height: 16),

                    /// Leads Link
                    _buildInfoTile("Share Leads Link", account.leadsLink),

                    /// Sell Courses
                    _buildInfoTile("Sell Your Courses", account.coursesLink),

                    /// Studio Contact
                    _buildInfoTile(
                        "Contact for Studio Setup", account.studioContact),

                    SizedBox(height: 24),

                    /// Logout Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth > 600 ? 40 : 20,
                              vertical: 12),
                        ),
                        child: Text("Logout",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Profile Section
  Widget _buildProfileSection(Account account, BoxConstraints constraints) {
    bool isWideScreen = constraints.maxWidth > 600;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Profile Image
            CircleAvatar(
              radius: isWideScreen ? 50 : 40,
              backgroundImage: NetworkImage(account.profileImage),
            ),

            SizedBox(width: isWideScreen ? 24 : 16),

            /// Teacher Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account.name,
                    style: TextStyle(
                      fontSize: isWideScreen ? 20 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Qualification: ${account.qualification}",
                    style: TextStyle(
                        fontSize: isWideScreen ? 16 : 14,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Experience: ${account.experience} years",
                    style: TextStyle(
                        fontSize: isWideScreen ? 16 : 14,
                        color: Colors.black87),
                  ),
                ],
              ),
            ),

            /// Edit Button
            IconButton(
              icon: Icon(Icons.edit,
                  color: Colors.blue, size: isWideScreen ? 28 : 24),
              onPressed: () => _editProfile(account),
            ),
          ],
        ),
      ),
    );
  }

  /// Helper Widget for Info Tiles
  Widget _buildInfoTile(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          subtitle:
              Text(value, style: TextStyle(fontSize: 14, color: Colors.blue)),
          trailing: Icon(Icons.open_in_new, color: Colors.blue),
          onTap: () {},
        ),
      ),
    );
  }
}
