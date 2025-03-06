import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 100),
              children: [
                _buildDrawerItem(
                    Icons.person, 'Users', AppRoutes.USERSSCREEN, context),
                _buildDrawerItem(Icons.account_balance, 'Transactions',
                    AppRoutes.TRANSACTIONSCREEN, context),
                _buildDrawerItem(Icons.wallet, 'Wallet History',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.account_circle_outlined,
                    'Account Option', AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.notification_add, 'Send Notification',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.offline_share_rounded,
                    'Promotions & Offers', AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(
                    Icons.feedback, 'Feedback', AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.arrow_drop_down, 'Dynamic Dropdown',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.security, 'Terms & Condition',
                    AppRoutes.STUDENTHOME, context),
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
