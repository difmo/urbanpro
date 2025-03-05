class Lead {
  final String id;
  final String name;
  final String subject;
  final double distance;
  final String classSection;
  final String schoolOrCollege;

  Lead({
    required this.id,
    required this.name,
    required this.subject,
    required this.distance,
    required this.classSection,
    required this.schoolOrCollege,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'],
      name: json['name'],
      subject: json['subject'],
      distance: json['distance'].toDouble(),
      classSection: json['classSection'],
      schoolOrCollege: json['schoolOrCollege'],
    );
  }
}
