class Leads {
  final String name;
  final String type; // "Student" or "Teacher"
  final String contact;
  final String field; // "Course" for students, "Subject" for teachers
  final String fieldValue;

  Leads({
    required this.name,
    required this.type,
    required this.contact,
    required this.field,
    required this.fieldValue,
  });

  factory Leads.fromJson(Map<String, dynamic> json) {
    return Leads(
      name: json['name'],
      type: json['type'],
      contact: json['contact'],
      field: json['field'],
      fieldValue: json['fieldValue'],
    );
  }
}
