import 'package:URBANPRO/models/admin/feedback_model.dart';

class FeedbackService {
  List<FeedbackModel> _feedbacks = [
    FeedbackModel(
      id: "1",
      userName: "Alice Johnson",
      userType: "Student",
      rating: 4.5,
      comment: "Great learning experience!",
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    FeedbackModel(
      id: "2",
      userName: "David Williams",
      userType: "Teacher",
      rating: 4.8,
      comment: "The platform is easy to use.",
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    FeedbackModel(
      id: "3",
      userName: "Bob Smith",
      userType: "Student",
      rating: 3.5,
      comment: "Could use more study materials.",
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  Future<List<FeedbackModel>> fetchFeedbacks() async {
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay
    return _feedbacks;
  }
}
