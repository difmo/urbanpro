import 'package:URBANPRO/models/leads/lead_model.dart';

class LeadService {
  Future<List<Lead>> fetchLeads() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      Lead(
        leadNo: "UP001",
        date: "2025-03-18",
        classInfo: "10th A",
        subject: "Mathematics",
        location: "Springfield High School",
        mode: "Offline",
        fee: "5000",
        responses: 2,
        maxResponses: 5,
        status: "Open",
        tutorGender: "Male",
        note:
            "Looking for an experienced tutor who can handle competitive exam preparation.",
        coinsRequired: 20,
        contactName: "Mr. Johnson",
        contactNumber: "+1 123 456 7890",
        contactEmail: "johnson.parent@example.com",
        imageUrl:
            "https://randomuser.me/api/portraits/men/1.jpg", // Dummy Image
      ),
      Lead(
        leadNo: "UP002",
        date: "2025-03-18",
        classInfo: "9th B",
        subject: "Science",
        location: "Greenwood Academy",
        mode: "Online",
        fee: "4000",
        responses: 1,
        maxResponses: 3,
        status: "Open",
        tutorGender: "Female",
        note: "Prefer a female tutor with a friendly teaching approach.",
        coinsRequired: 15,
        contactName: "Mrs. Carter",
        contactNumber: "+1 234 567 8901",
        contactEmail: "carter.parent@example.com",
        imageUrl:
            "https://randomuser.me/api/portraits/women/2.jpg", // Dummy Image
      ),
      Lead(
        leadNo: "UP003",
        date: "2025-03-17",
        classInfo: "12th C",
        subject: "English",
        location: "Bright Future College",
        mode: "Offline",
        fee: "6000",
        responses: 4,
        maxResponses: 4,
        status: "Closed",
        tutorGender: "Any",
        note: "Focus on essay writing and literature analysis.",
        coinsRequired: 25,
        contactName: "Mr. Roberts",
        contactNumber: "+1 345 678 9012",
        contactEmail: "roberts.parent@example.com",
        imageUrl:
            "https://randomuser.me/api/portraits/men/3.jpg", // Dummy Image
      ),
      Lead(
        leadNo: "UP004",
        date: "2025-03-16",
        classInfo: "11th A",
        subject: "Physics",
        location: "Blue Ridge High School",
        mode: "Offline",
        fee: "5500",
        responses: 3,
        maxResponses: 5,
        status: "Open",
        tutorGender: "Male",
        note: "Need help with practicals and numerical problems.",
        coinsRequired: 18,
        contactName: "Ms. Green",
        contactNumber: "+1 456 789 0123",
        contactEmail: "green.parent@example.com",
        imageUrl:
            "https://randomuser.me/api/portraits/women/4.jpg", // Dummy Image
      ),
      Lead(
        leadNo: "UP005",
        date: "2025-03-15",
        classInfo: "8th B",
        subject: "Chemistry",
        location: "Green Valley School",
        mode: "Online",
        fee: "3500",
        responses: 2,
        maxResponses: 4,
        status: "Open",
        tutorGender: "Any",
        note: "Prefer flexible evening timings.",
        coinsRequired: 12,
        contactName: "Mrs. Brown",
        contactNumber: "+1 567 890 1234",
        contactEmail: "brown.parent@example.com",
        imageUrl:
            "https://randomuser.me/api/portraits/men/5.jpg", // Dummy Image
      ),
    ];
  }
}
