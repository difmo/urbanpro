class FeedbackModel {
  final String id;
  final String userName;
  final String userType; // "Student" or "Teacher"
  final double rating;
  final String comment;
  final DateTime date;

  FeedbackModel({
    required this.id,
    required this.userName,
    required this.userType,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      userName: json['userName'],
      userType: json['userType'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userType': userType,
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }
}
