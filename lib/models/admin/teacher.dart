class Teacher {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String specialization;
  final int experienceYears;

  Teacher({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.specialization,
    required this.experienceYears,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      specialization: json['specialization'],
      experienceYears: json['experienceYears'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'specialization': specialization,
      'experienceYears': experienceYears,
    };
  }
}
