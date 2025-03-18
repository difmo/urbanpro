import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userImage;

  const CustomDrawer(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Header
          UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  Color(0xFF4A90E2), // A smooth blue gradient
                  Color(0xFF50E3C2)
                ],
              ),
              color: ThemeConstants.primaryColor,
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                    Icons.person, 'Users', AppRoutes.USERSSCREEN, context),
                _buildDrawerItem(Icons.account_balance, 'Transactions',
                    AppRoutes.TRANSACTIONSCREEN, context),
                _buildDrawerItem(Icons.wallet, 'Wallet History',
                    AppRoutes.WALLETSCREEN, context),
                _buildDrawerItem(Icons.account_circle_outlined,
                    'Account Option', AppRoutes.AMOUNTSETTINSCREEN, context),
                _buildDrawerItem(Icons.notification_add, 'Send Notification',
                    AppRoutes.SENDNOTIFICATION, context),
                _buildDrawerItem(Icons.offline_share_rounded,
                    'Promotions & Offers', AppRoutes.PROMOTIONS, context),
                _buildDrawerItem(
                    Icons.feedback, 'Feedback', AppRoutes.FEEDBACK, context),
                _buildDrawerItem(Icons.security, 'Terms & Condition',
                    AppRoutes.TERMCONDITION, context),
                Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    indent: 20,
                    endIndent: 20),
                _buildLogoutItem(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, String? route, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ThemeConstants.primaryColor, size: 26),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
      ),
      onTap: () {
        Navigator.pop(context);
        if (route != null && route.isNotEmpty) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  // Logout Menu Item
  Widget _buildLogoutItem(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red, size: 26),
      title: const Text(
        "Logout",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
      ),
      onTap: () => _logout(context),
    );
  }

  // Logout Confirmation Dialog
  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.LOGIN);
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
