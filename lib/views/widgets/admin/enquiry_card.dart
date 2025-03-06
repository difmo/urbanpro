import 'package:URBANPRO/models/admin/enquiry_model.dart';
import 'package:flutter/material.dart';

class EnquiryCard extends StatelessWidget {
  final Enquiry enquiry;
  final VoidCallback onApprove;
  final VoidCallback onReject;
  final VoidCallback onViewDetails;

  EnquiryCard({
    required this.enquiry,
    required this.onApprove,
    required this.onReject,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              enquiry.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text("${enquiry.field}: ${enquiry.fieldValue}"),
            SizedBox(height: 4),
            Text("Contact: ${enquiry.contact}"),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onViewDetails,
                  child: Text("View Details"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onApprove,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text("Approve", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onReject,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text("Reject", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
