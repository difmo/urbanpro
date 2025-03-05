import 'package:URBANPRO/models/leads/lead_model.dart';
import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  final Lead lead;
  final VoidCallback onConnect;

  const LeadCard({Key? key, required this.lead, required this.onConnect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth;

        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name
                Text(
                  lead.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 6),

                /// Subject & Distance
                Row(
                  children: [
                    Icon(Icons.book, size: 18, color: Colors.blueAccent),
                    SizedBox(width: 4),
                    Text(
                      lead.subject,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    Spacer(),
                    Icon(Icons.location_on, size: 18, color: Colors.redAccent),
                    SizedBox(width: 4),
                    Text(
                      "${lead.distance} km away",
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                /// Class & School/College
                Text(
                  "${lead.classSection} • ${lead.schoolOrCollege}",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),

                SizedBox(height: 12),

                /// Connect Button - Full width for small screens, fixed width for large screens
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: cardWidth > 400 ? 120 : double.infinity,
                    child: ElevatedButton(
                      onPressed: onConnect,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("Connect",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
