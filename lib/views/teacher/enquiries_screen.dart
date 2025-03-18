import 'package:URBANPRO/models/leads/lead_model.dart';
import 'package:URBANPRO/services/lead_service.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/lead_card.dart';

class EnquiriesScreen extends StatefulWidget {
  const EnquiriesScreen({super.key});

  @override
  _EnquiriesScreenState createState() => _EnquiriesScreenState();
}

class _EnquiriesScreenState extends State<EnquiriesScreen> {
  final LeadService _leadService = LeadService();
  late Future<List<Lead>> _leadsFuture;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _leadsFuture = _leadService.fetchLeads();
    // Set StatusBar color globally
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4A90E2), // Your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons (for dark backgrounds)
      statusBarBrightness: Brightness.dark, // For iOS
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeConstants.white,
        appBar: CustomAppBar(
          title: "Urban Tutors",
          scaffoldKey: _scaffoldKey,
          backgroundColor: ThemeConstants.white,
        ),
        body: FutureBuilder<List<Lead>>(
          future: _leadsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("Failed to load leads"));
            }
            final leads = snapshot.data!;
            return ListView.builder(
              itemCount: leads.length,
              itemBuilder: (context, index) {
                return LeadCard(
                  lead: leads[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
