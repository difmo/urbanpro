import 'package:URBANPRO/models/leads/lead_model.dart';
import 'package:URBANPRO/services/lead_service.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
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
  }

  void _connectWithStudent(Lead lead) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Connect with ${lead.name}?"),
          content: Text(
              "You are about to connect with a student for ${lead.subject}."),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Connected with ${lead.name}!")),
                );
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
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
                onConnect: () => _connectWithStudent(leads[index]),
              );
            },
          );
        },
      ),
    );
  }
}
