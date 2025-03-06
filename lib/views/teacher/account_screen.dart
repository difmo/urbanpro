import 'package:URBANPRO/models/teacher/account_model.dart';
import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/services/account_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: ThemeConstants.white,
      body: SafeArea(
        child: FutureBuilder<Account>(
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
                      /// **Profile Section**
                      _buildProfileSection(account, constraints),
        
                      SizedBox(height: 20),
        
                      /// **Settings Card**
                      Container(
                        decoration: BoxDecoration(border: Border.all(color: ThemeConstants.lightGrey,width: 1)),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ToggleSwitch(
                                title: "Profile Visibility",
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
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ),
                              ToggleSwitch(
                                title: "Allow Reviews",
                                value: account.allowReviews,
                                onChanged: (newValue) {
                                  setState(() {
                                    account.allowReviews = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
        
                      SizedBox(height: 16),
        
                      /// **Quick Access Links**
                      _buildInfoTile("Share Leads Link", account.leadsLink,
                          Icons.link),
                      _buildInfoTile(
                          "Sell Your Courses", account.coursesLink, Icons.school),
                      _buildInfoTile("Contact for Studio Setup",
                          account.studioContact, Icons.spatial_audio),
        
                      SizedBox(height: 24),
        
                      /// **Logout Button**
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.toNamed(AppRoutes.LOGIN);
                          },
                          icon: Icon(Icons.logout, color: Colors.white),
                          label: Text("Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth > 600 ? 40 : 20,
                                vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// **Profile Section**
  Widget _buildProfileSection(Account account, BoxConstraints constraints) {
    bool isWideScreen = constraints.maxWidth > 600;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: ThemeConstants.lighterGrey,width: 1)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            /// **Profile Image**
            CircleAvatar(
              radius: isWideScreen ? 50 : 40,
              backgroundImage: NetworkImage(account.profileImage),
            ),
      
            SizedBox(width: isWideScreen ? 24 : 16),
      
            /// **User Details**
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
      
            /// **Edit Profile Button**
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue, size: 24),
              onPressed: () => _editProfile(account),
            ),
          ],
        ),
      ),
    );
  }

  /// **Reusable Info Tile**
  Widget _buildInfoTile(String title, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Icon(icon, color: Colors.blue),
          title: Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          subtitle:
              Text(value, style: TextStyle(fontSize: 14, color: Colors.blue)),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: () {},
        ),
      ),
    );
  }
}
