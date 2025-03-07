import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String userName;
  final String userType;
  final double amount;
  final String date;
  final String status;

  const TransactionCard({
    super.key,
    required this.userName,
    required this.userType,
    required this.amount,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = _getStatusColor(status);

    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Name and User Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(userName,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: userType == "Teacher" ? Colors.blue : Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    userType,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            /// Transaction Details
            Text("Amount: \$${amount.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 14, color: Colors.black)),
            SizedBox(height: 4),
            Text("Date: $date",
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            SizedBox(height: 6),

            /// Transaction Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(status,
                    style: TextStyle(
                        fontSize: 14,
                        color: statusColor,
                        fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Pending":
        return Colors.orange;
      case "Failed":
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
