class Enquiry {
  final String name;
  final String type; // "Student" or "Teacher"
  final String contact;
  final String field; // "Course" for students, "Subject" for teachers
  final String fieldValue;

  Enquiry({
    required this.name,
    required this.type,
    required this.contact,
    required this.field,
    required this.fieldValue,
  });

  factory Enquiry.fromJson(Map<String, dynamic> json) {
    return Enquiry(
      name: json['name'],
      type: json['type'],
      contact: json['contact'],
      field: json['field'],
      fieldValue: json['fieldValue'],
    );
  }
}
