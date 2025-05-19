class StudentProfileSetUpdateModal {
  final String boardName;
  final String courseId;
  final String subjectId;
  final String price;
  final String latitude;
  final String longitude;
  final String location;
  final String userId;
  final String mobile;

  StudentProfileSetUpdateModal({
    required this.boardName,
    required this.courseId,
    required this.subjectId,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.userId,
    required this.mobile,
  });

  Map<String, String> toFormData() {
    return {
      'board_name': boardName,
      'course_id': courseId,
      'subject_id': subjectId,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'user_id': userId,
      'mobile': mobile,
    };
  }

  factory StudentProfileSetUpdateModal.fromJson(Map<String, dynamic> json) {
    return StudentProfileSetUpdateModal(
      boardName: json['board_name'] ?? '',
      courseId: json['course_id']?.toString() ?? '',
      subjectId: json['subject_id']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      location: json['location'] ?? '',
      userId: json['user_id']?.toString() ?? '',
      mobile: json['mobile'] ?? '',
    );
  }
}
