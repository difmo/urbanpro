import 'package:URBANPRO/models/admin/enquiry_model.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
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
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ThemeConstants.lightGrey),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      margin: EdgeInsets.symmetric(vertical: 8),
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
                GestureDetector(
                  onTap: onViewDetails,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: ThemeConstants.primaryColor,borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Text(
                      "View Details",
                      style: AppTextStyle.TextWhite12700 ,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: onApprove,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: ThemeConstants.secondaryColor,borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Text("Approve",   style: AppTextStyle.TextWhite12700 ))),
                SizedBox(width: 8),
                GestureDetector(
                onTap: onApprove,
                child: Container(
                   padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: ThemeConstants.red,borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text("Reject",   style: AppTextStyle.TextWhite12700 ,)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
