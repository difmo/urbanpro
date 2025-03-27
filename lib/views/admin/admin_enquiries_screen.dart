import 'package:URBANPRO/models/leads/lead_model.dart'; // Ensure correct Lead model is imported
import 'package:URBANPRO/services/lead_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/admin/create_newlead_screen.dart';
import 'package:URBANPRO/views/admin/lead_details_screen.dart';
import 'package:URBANPRO/views/widgets/lead_card.dart';
import 'package:flutter/material.dart';

class AdminEnquiriesScreen extends StatefulWidget {
  const AdminEnquiriesScreen({super.key});

  @override
  _AdminEnquiriesScreenState createState() => _AdminEnquiriesScreenState();
}

class _AdminEnquiriesScreenState extends State<AdminEnquiriesScreen> {
  late Future<List<Lead>> _enquiryFuture; // Updated to Lead class
  final LeadService _leadService = LeadService();

  @override
  void initState() {
    super.initState();
    _enquiryFuture = _leadService.fetchLeads(); // Fetch leads from the service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      body: SafeArea(
        child: FutureBuilder<List<Lead>>(
          future: _enquiryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Failed to load enquiries"));
            }

            List<Lead> enquiries = snapshot.data!;

            return _buildEnquiriesList(enquiries);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeConstants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48), // Set radius to 24
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNewLeadScreen()),
          );
        },
        child: Icon(
          Icons.add,
          color: ThemeConstants.white,
        ),
      ),
    );
  }

  /// Builds Enquiries List
  Widget _buildEnquiriesList(List<Lead> enquiries) {
    if (enquiries.isEmpty) {
      return Center(child: Text("No enquiries found"));
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: enquiries.length,
        itemBuilder: (context, index) {
          final enquiry = enquiries[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LeadDetailsScreen(lead: enquiry),
                ),
              );
            },
            child: LeadCard(
              lead: enquiry,
            ),
          );
        },
      ),
    );
  }
}
