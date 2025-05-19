class StudentProfileModal {
  final bool success;
  final String? message;
  final StudentData? data;

  StudentProfileModal({
    required this.success,
    this.message,
    this.data,
  });

  factory StudentProfileModal.fromJson(Map<String, dynamic> json) {
    return StudentProfileModal(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null ? StudentData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
    };
  }
}


class StudentData {
  final int id;
  final int leadId;
  final String studentName;
  final String boardName;
  final String courseName;
  final String subjectName;
  final String mobile;
  final String price;
  final String latitude;
  final String longitude;
  final List<dynamic> location; // Adjust type if you know the structure
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentData({
    required this.id,
    required this.leadId,
    required this.studentName,
    required this.boardName,
    required this.courseName,
    required this.subjectName,
    required this.mobile,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.location,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
      id: json['id'],
      leadId: json['lead_id'],
      studentName: json['student_name'],
      boardName: json['board_name'],
      courseName: json['course_name'],
      subjectName: json['subject_name'],
      mobile: json['mobile'],
      price: json['price'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      location: List<dynamic>.from(json['location'] ?? []),
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lead_id': leadId,
      'student_name': studentName,
      'board_name': boardName,
      'course_name': courseName,
      'subject_name': subjectName,
      'mobile': mobile,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
