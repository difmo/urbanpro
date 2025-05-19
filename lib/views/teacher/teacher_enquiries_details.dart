import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:URBANPRO/models/leads/lead_model.dart';
import 'package:URBANPRO/utils/theme_constants.dart';

class TeacherEnquiriesDetails extends StatefulWidget {
  final Lead lead;

  const TeacherEnquiriesDetails({super.key, required this.lead});

  @override
  State<TeacherEnquiriesDetails> createState() =>
      _TeacherEnquiriesDetailsState();
}

class _TeacherEnquiriesDetailsState extends State<TeacherEnquiriesDetails> {
  // Launch Phone Dialer
  void _launchPhone(String phoneNumber) =>
      launchUrl(Uri.parse("tel:$phoneNumber"));

  // Launch Email
  void _launchEmail(String email) => launchUrl(Uri.parse("mailto:$email"));

  // Launch WhatsApp
  void _launchWhatsApp(String number) =>
      launchUrl(Uri.parse("https://wa.me/$number"));

  // Generate and Save PDF
  Future<void> _generatePDF(Lead lead) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text("Lead Report",
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.Divider(),
            pw.Text("Lead No: ${lead.leadNo}"),
            pw.Text("Class: ${lead.classInfo}"),
            pw.Text("Subject: ${lead.subject}"),
            pw.Text("Location: ${lead.location}"),
            pw.Text("Fee: ₹${lead.fee}/hr"),
            pw.Text("Mode: ${lead.mode}"),
            pw.Text("Tutor Gender: ${lead.tutorGender}"),
            pw.Text("Note: ${lead.note}"),
            pw.Text("Coins Required: ${lead.coinsRequired}"),
            pw.Text("Responses: ${lead.responses}/${lead.maxResponses}"),
            pw.Text("Status: ${lead.status}"),
            pw.Text("Contact Name: ${lead.contactName}"),
            pw.Text("Contact Number: ${lead.contactNumber}"),
            pw.Text("Contact Email: ${lead.contactEmail}"),
          ],
        ),
      ),
    );

    final directory = await getApplicationDocumentsDirectory();
    final file = File("${directory.path}/lead_${lead.leadNo}.pdf");
    await file.writeAsBytes(await pdf.save());

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("PDF saved: ${file.path}")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lead Details"),
        backgroundColor: ThemeConstants.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.lead.imageUrl.isNotEmpty
                          ? widget.lead.imageUrl
                          : 'https://via.placeholder.com/300'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  color: Colors.black.withOpacity(0.3),
                  alignment: Alignment.center,
                  child: Text(
                    "Lead #${widget.lead.leadNo}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.black38,
                            offset: Offset(1, 1),
                            blurRadius: 4)
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Lead Information Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.class_, "Class", widget.lead.classInfo),
                  _buildInfoRow(Icons.school, "Subject", widget.lead.subject),
                  _buildInfoRow(
                      Icons.location_on, "Location", widget.lead.location),
                  _buildInfoRow(Icons.money, "Fee", "₹${widget.lead.fee}/Hr"),
                  _buildInfoRow(
                      Icons.person, "Tutor Gender", widget.lead.tutorGender),
                  _buildInfoRow(Icons.offline_bolt, "Mode", widget.lead.mode),
                  _buildInfoRow(Icons.monetization_on, "Coins Needed",
                      widget.lead.coinsRequired.toString()),
                  _buildInfoRow(Icons.people, "Responses",
                      "${widget.lead.responses}/${widget.lead.maxResponses}"),
                  _buildInfoRow(
                      Icons.star_border, "Status", widget.lead.status),
                  const SizedBox(height: 16),
                  const Divider(thickness: 1),

                  const Text("Special Requirements",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ThemeConstants.primaryColor)),
                  const SizedBox(height: 8),
                  Text(
                    widget.lead.note,
                    style: const TextStyle(
                        color: ThemeConstants.black,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                  ),

                  const SizedBox(height: 16),
                  const Divider(thickness: 1),

                  // Contact Details Section
                  const Text("Contact Details",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ThemeConstants.primaryColor)),
                  const SizedBox(height: 8),
                  _buildContactCard(widget.lead),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _generatePDF(widget.lead),
        icon: const Icon(
          Icons.picture_as_pdf,
          color: ThemeConstants.white,
        ),
        label: const Text(
          "Save as PDF",
          style: TextStyle(color: ThemeConstants.white),
        ),
        backgroundColor: ThemeConstants.secondaryColor,
      ),
    );
  }

  // Build Info Row with Theme Colors
  Widget _buildInfoRow(IconData icon, String title, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Icon(icon, color: ThemeConstants.primaryColor),
            const SizedBox(width: 8),
            Text("$title: ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87)),
            Expanded(
              child: Text(value,
                  style: const TextStyle(color: ThemeConstants.black),
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      );

  // Build Contact Card
  Widget _buildContactCard(Lead lead) => Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: ThemeConstants.primaryColor.withOpacity(0.1), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(Icons.person, "Contact Name", lead.contactName),
              GestureDetector(
                onTap: () => _launchPhone(lead.contactNumber),
                child: _buildInfoRow(
                    Icons.phone, "Contact Number", lead.contactNumber),
              ),
              GestureDetector(
                onTap: () => _launchEmail(lead.contactEmail),
                child: _buildInfoRow(
                    Icons.email, "Contact Email", lead.contactEmail),
              ),
            ],
          ),
        ),
      );
}
