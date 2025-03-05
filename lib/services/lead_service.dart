import 'package:URBANPRO/models/leads/lead_model.dart';

class LeadService {
  Future<List<Lead>> fetchLeads() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      Lead(
        id: "1",
        name: "John Doe",
        subject: "Mathematics",
        distance: 2.0,
        classSection: "10th A",
        schoolOrCollege: "Springfield High School",
      ),
      Lead(
        id: "2",
        name: "Emma Watson",
        subject: "Science",
        distance: 3.5,
        classSection: "9th B",
        schoolOrCollege: "Greenwood Academy",
      ),
      Lead(
        id: "3",
        name: "Liam Smith",
        subject: "English",
        distance: 1.2,
        classSection: "12th C",
        schoolOrCollege: "Bright Future College",
      ),
    ];
  }
}
