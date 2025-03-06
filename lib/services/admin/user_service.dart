// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:URBANPRO/models/admin/student.dart';
// import 'package:URBANPRO/models/admin/teacher.dart';

// class UserService {
//   final String baseUrl = "https://api.yourbackend.com"; // Replace with your API URL

//   Future<List<Student>> fetchStudents() async {
//     final response = await http.get(Uri.parse("$baseUrl/students"));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map<Student>((json) => Student.fromJson(json)).toList();
//     } else {
//       throw Exception("Failed to fetch students");
//     }
//   }

//   Future<List<Teacher>> fetchTeachers() async {
//     final response = await http.get(Uri.parse("$baseUrl/teachers"));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map<Teacher>((json) => Teacher.fromJson(json)).toList();
//     } else {
//       throw Exception("Failed to fetch teachers");
//     }
//   }
// }



import 'package:URBANPRO/models/admin/student.dart';
import 'package:URBANPRO/models/admin/teacher.dart';

class UserService {
  Future<List<Student>> fetchStudents() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return [
      Student(
        id: "S1",
        name: "Alice Johnson",
        email: "alice@example.com",
        phone: "9876543210",
        grade: "10th Grade",
        subjectsInterested: "Math, Science",
      ),
      Student(
        id: "S2",
        name: "Bob Smith",
        email: "bob@example.com",
        phone: "9876543211",
        grade: "8th Grade",
        subjectsInterested: "English, History",
      ),
      Student(
        id: "S3",
        name: "Charlie Brown",
        email: "charlie@example.com",
        phone: "9876543212",
        grade: "12th Grade",
        subjectsInterested: "Physics, Chemistry",
      ),
    ];
  }

  Future<List<Teacher>> fetchTeachers() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return [
      Teacher(
        id: "T1",
        name: "David Williams",
        email: "david@example.com",
        phone: "9876543220",
        specialization: "Mathematics",
        experienceYears: 5,
      ),
      Teacher(
        id: "T2",
        name: "Emma Davis",
        email: "emma@example.com",
        phone: "9876543221",
        specialization: "Physics",
        experienceYears: 8,
      ),
      Teacher(
        id: "T3",
        name: "Frank Miller",
        email: "frank@example.com",
        phone: "9876543222",
        specialization: "Computer Science",
        experienceYears: 10,
      ),
    ];
  }
}

