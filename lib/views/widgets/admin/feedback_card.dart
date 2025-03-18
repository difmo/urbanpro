import 'package:URBANPRO/models/admin/feedback_model.dart';
import 'package:flutter/material.dart';

class FeedbackCard extends StatelessWidget {
  final FeedbackModel feedback;

  const FeedbackCard({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// User Name & Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(feedback.userName,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: feedback.userType == "Teacher"
                        ? Colors.blue
                        : Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    feedback.userType,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            /// Rating
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < feedback.rating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 20,
                );
              }),
            ),
            SizedBox(height: 8),

            /// Comment
            Text(feedback.comment,
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),

            SizedBox(height: 10),

            /// Date
            Text(
              "Date: ${feedback.date.toLocal().toString().split(' ')[0]}",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
