import 'package:URBANPRO/models/leads/lead_model.dart';
import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  final Lead lead;

  const LeadCard({Key? key, required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                    children: [
                      const TextSpan(
                        text: "Lead No: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: lead.leadNo,
                        style: const TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  lead.date,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _buildInfoRow(Icons.bookmark, "Class: ${lead.classInfo}"),
            _buildInfoRow(Icons.school, "Subject: ${lead.subject}"),
            _buildInfoRow(Icons.location_city, "Location: ${lead.location}"),
            _buildInfoRow(Icons.sync_alt, "Mode: ${lead.mode}"),
            _buildInfoRow(
              Icons.attach_money,
              "Fee: ${lead.fee}",
              action: TextButton(
                onPressed: () {},
                child: const Text(
                  "Read more",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "${lead.responses}/${lead.maxResponses}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  lead.status,
                  style: TextStyle(
                    color: lead.status == "Responded"
                        ? Colors.green
                        : Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {Widget? action}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
          if (action != null) action,
        ],
      ),
    );
  }
}
