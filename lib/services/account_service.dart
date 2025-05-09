import 'package:URBANPRO/models/teacher/account_model.dart';

class AccountService {
  Future<Account> fetchAccountDetails() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API call

    return Account(
      isProfileOn: true,
      maxCallsPerDay: 10,
      allowReviews: true,
      leadsLink: "https://example.com/leads",
      coursesLink: "https://example.com/courses",
      studioContact: "https://example.com/studio",
      profileImage:
          "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

      // ✅ Tutor's Basic Info
      name: "Dinesh Kumar",
      qualification: "M.Tech in Computer Science",
      experience: 12,

      // ✅ Extended Tutor Details
      email: "dinesh.tutor@example.com",
      phone: "+91 9876543210",
      city: "New Delhi",
      subjects: ["Mathematics", "Physics", "Computer Science"],
      teachingMode: "Online & Offline",
      hourlyRate: 800,
      bio:
          "Passionate educator specializing in STEM subjects. Focused on making learning engaging and practical.",
      certifications: [
        "B.Ed",
        "Google Certified Educator",
        "Data Science Specialist"
      ],
      availability: "Mon-Fri: 5 PM - 9 PM | Sat-Sun: 10 AM - 6 PM",
      rating: 4.7,
      totalReviews: 120,
      totalStudents: 300,
      totalCourses: 5,
    );
  }
}
