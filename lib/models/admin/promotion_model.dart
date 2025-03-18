class Promotion {
  final String id;
  final String title;
  final String description;
  final double discount;
  final DateTime expiryDate;

  Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.expiryDate,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      discount: json['discount'].toDouble(),
      expiryDate: DateTime.parse(json['expiryDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'discount': discount,
      'expiryDate': expiryDate.toIso8601String(),
    };
  }
}
