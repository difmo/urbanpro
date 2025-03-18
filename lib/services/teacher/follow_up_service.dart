import 'package:URBANPRO/models/teacher/follow_up_model.dart';

class FollowUpService {
  static List<FollowUpModel> getStudents() {
    return [
      FollowUpModel(
        name: 'Tanisha Chhabra',
        studentClass: 'Class 11 Tuition',
        mode: "Student's Home",
        location: 'Sainik Farm, Delhi',
        status: 'Contacted',
        date: '02 Jan',
        phoneNumber: '9876543210',
        email: 'tanisha@example.com',
        isStarred: true,
      ),
      FollowUpModel(
        name: 'Saif Suhail',
        studentClass: 'Class 11 Tuition',
        mode: 'Online Class',
        location: 'Tri Nagar, Delhi',
        status: 'Demo',
        date: '24/08/2024',
        phoneNumber: '9123456789',
        email: 'saif@example.com',
      ),
      FollowUpModel(
        name: 'Ashvik',
        studentClass: 'Class 11 Tuition',
        mode: "Student's Home",
        location: 'Khanpur, Delhi',
        status: 'Payment',
        date: '24/08/2024',
        phoneNumber: '8765432109',
        email: 'ashvik@example.com',
        isStarred: true,
      ),
      FollowUpModel(
        name: 'Shweta Sharma',
        studentClass: 'Class 11 Tuition',
        mode: 'Online Class',
        location: 'Tri Nagar, Delhi',
        status: 'Enquiry',
        date: '22/08/2024',
        phoneNumber: '9988776655',
        email: 'shweta@example.com',
      ),
    ];
  }
}
