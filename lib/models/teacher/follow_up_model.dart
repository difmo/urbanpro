class FollowUpModel {
  final String name;
  final String studentClass;
  final String mode;
  final String location;
  final String status;
  final String date;
  final String phoneNumber;
  final String email;
  final bool isStarred;

  FollowUpModel({
    required this.name,
    required this.studentClass,
    required this.mode,
    required this.location,
    required this.status,
    required this.date,
    required this.phoneNumber,
    required this.email,
    this.isStarred = false,
  });

  factory FollowUpModel.fromMap(Map<String, dynamic> map) {
    return FollowUpModel(
      name: map['name'] ?? '',
      studentClass: map['class'] ?? '',
      mode: map['mode'] ?? '',
      location: map['location'] ?? '',
      status: map['status'] ?? '',
      date: map['date'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      isStarred: map['isStarred'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'class': studentClass,
      'mode': mode,
      'location': location,
      'status': status,
      'date': date,
      'phoneNumber': phoneNumber,
      'email': email,
      'isStarred': isStarred,
    };
  }
}
