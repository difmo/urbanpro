import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String role;
  final String extraInfo;
  final VoidCallback? onViewProfile;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.extraInfo,
    this.onViewProfile,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: ThemeConstants.lightGrey)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: role == "Teacher"
                        ? ThemeConstants.primaryColor
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    role,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            /// Contact Details
            Text("Email: $email",
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 4),
            Text("Phone: $phone",
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 6),

            /// Extra Info
            Text(extraInfo,
                style: TextStyle(fontSize: 14, color: Colors.black)),
            SizedBox(height: 10),

            /// Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// View Profile Button
                ElevatedButton.icon(
                  onPressed: onViewProfile,
                  icon: Icon(Icons.person_outline, size: 20),
                  label: Text("View Profile"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ThemeConstants.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),

                /// Edit and Delete Buttons
                Row(
                  children: [
                    IconButton(
                      onPressed: onEdit,
                      icon: Icon(Icons.edit, color: Colors.blue),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
