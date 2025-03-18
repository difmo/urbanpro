class NotificationModel {
  final String title;
  final String message;
  final String userType; // "All", "Students", "Teachers"

  NotificationModel({
    required this.title,
    required this.message,
    required this.userType,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
      'userType': userType,
    };
  }
}
