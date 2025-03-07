import 'package:URBANPRO/models/admin/enquiry_model.dart';
import 'package:URBANPRO/services/admin/enquiry_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/admin/enquiry_card.dart';
import 'package:flutter/material.dart';

class AdminEnquiriesScreen extends StatefulWidget {
  const AdminEnquiriesScreen({super.key});

  @override
  _AdminEnquiriesScreenState createState() => _AdminEnquiriesScreenState();
}

class _AdminEnquiriesScreenState extends State<AdminEnquiriesScreen> {
  final int _selectedTabIndex = 0;
  late Future<List<Enquiry>> _enquiryFuture;
  final EnquiryService _enquiryService = EnquiryService();

  @override
  void initState() {
    super.initState();
    _enquiryFuture = _enquiryService.fetchEnquiries();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ThemeConstants.white,
        body: FutureBuilder<List<Enquiry>>(
          future: _enquiryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Failed to load enquiries"));
            }

            List<Enquiry> enquiries = snapshot.data!;
            List<Enquiry> filteredEnquiries = _selectedTabIndex == 0
                ? enquiries.where((e) => e.type == "Student").toList()
                : enquiries.where((e) => e.type == "Teacher").toList();

            return _buildEnquiriesList(filteredEnquiries);
          },
        ),
      ),
    );
  }

  /// Builds Enquiries List
  Widget _buildEnquiriesList(List<Enquiry> enquiries) {
    if (enquiries.isEmpty) {
      return Center(child: Text("No enquiries found"));
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: enquiries.length,
        itemBuilder: (context, index) {
          final enquiry = enquiries[index];
          return EnquiryCard(
            enquiry: enquiry,
            onApprove: () => _handleApprove(enquiry),
            onReject: () => _handleReject(enquiry),
            onViewDetails: () => _handleViewDetails(enquiry),
          );
        },
      ),
    );
  }

  void _handleApprove(Enquiry enquiry) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${enquiry.name} approved")),
    );
  }

  void _handleReject(Enquiry enquiry) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${enquiry.name} rejected")),
    );
  }

  void _handleViewDetails(Enquiry enquiry) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Viewing details for ${enquiry.name}")),
    );
  }
}
