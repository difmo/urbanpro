class Student {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String grade;
  final String subjectsInterested;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.grade,
    required this.subjectsInterested,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      grade: json['grade'],
      subjectsInterested: json['subjectsInterested'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'grade': grade,
      'subjectsInterested': subjectsInterested,
    };
  }
}
