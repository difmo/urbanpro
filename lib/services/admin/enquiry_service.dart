
import 'package:URBANPRO/models/admin/enquiry_model.dart';

class EnquiryService {
  Future<List<Enquiry>> fetchEnquiries() async {
    await Future.delayed(Duration(seconds: 1)); // Simulated API delay

    return [
      Enquiry(name: "John Doe", type: "Student", contact: "9876543210", field: "Course", fieldValue: "Mathematics"),
      Enquiry(name: "Alice Smith", type: "Student", contact: "9123456789", field: "Course", fieldValue: "Physics"),
      Enquiry(name: "Mr. Robert", type: "Teacher", contact: "9988776655", field: "Subject", fieldValue: "Science"),
      Enquiry(name: "Ms. Emma", type: "Teacher", contact: "9900112233", field: "Subject", fieldValue: "English"),
    ];
  }
}
