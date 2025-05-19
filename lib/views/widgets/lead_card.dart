import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:URBANPRO/models/leads/lead_model.dart';

class LeadCard extends StatelessWidget {
  final Lead lead;

  const LeadCard({super.key, required this.lead});

  // Helper to launch URLs (phone/email)
  Future<void> _launchUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Could not launch $url")),
    //   );
    // }
  }

  // Helper to copy text to clipboard
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          border:
              Border.all(color: ThemeConstants.primaryColor.withOpacity(0.1))),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with Profile Image and Lead Info
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(lead.imageUrl.isNotEmpty
                      ? lead.imageUrl
                      : 'https://via.placeholder.com/150'), // Fallback image
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lead #${lead.leadNo}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        lead.subject,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  lead.date,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),

            Divider(
              thickness: 1,
              height: 20,
              color: ThemeConstants.primaryColor.withOpacity(0.1),
            ),

            // Lead details rows
            _buildInfoRow(Icons.school, "Class: ${lead.classInfo}"),
            _buildInfoRow(
                Icons.location_on_outlined, "Location: ${lead.location}"),
            _buildInfoRow(Icons.sync_alt, "Mode: ${lead.mode}"),
            _buildInfoRow(Icons.monetization_on_outlined, "Fee: ₹${lead.fee}"),
            _buildInfoRow(Icons.people, "Tutor Gender: ${lead.tutorGender}"),
            _buildInfoRow(Icons.note, "Note: ${lead.note}", maxLines: 2),

            const SizedBox(height: 10),

            // Responses and status row
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
                    "${lead.responses}/${lead.maxResponses} Responses",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: lead.status == "Closed" ? Colors.red : Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    lead.status,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Contact details row with actions
            _buildActionRow(
              icon: Icons.person,
              label: "Contact: ${lead.contactName}",
              onTap: () => _copyToClipboard(context, lead.contactName),
            ),
            _buildActionRow(
              icon: Icons.phone,
              label: lead.contactNumber,
              onTap: () => _launchUrl("tel:${lead.contactNumber}", context),
            ),
            _buildActionRow(
              icon: Icons.email_outlined,
              label: lead.contactEmail,
              onTap: () => _launchUrl("mailto:${lead.contactEmail}", context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
