import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 10),
              children: [
                _buildDrawerItem(Icons.dashboard, 'Dashboard',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.person_outline, 'Profile',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.apartment, 'Published Properties',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.shopping_bag, 'Purchased Properties',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.info_outline, 'About Us',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.contact_mail_outlined, 'Contact Us',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.lock_outline, 'Privacy Policy',
                    AppRoutes.STUDENTHOME, context),
                _buildDrawerItem(Icons.rule, 'Terms & Conditions',
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

  // Default Header (if no user data is found)
  // ignore: unused_element
  Widget _buildDefaultHeader(bool isLoading) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Guest User',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const Text('guest@example.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
    );
  }


  Widget _buildDrawerItem(
      IconData icon, String title, String? route, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor, size: 26),
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
        title: const Text("Log Out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
