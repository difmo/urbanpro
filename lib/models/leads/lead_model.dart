class Lead {
  final String leadNo;
  final String date;
  final String classInfo;
  final String subject;
  final String location;
  final String mode;
  final String fee;
  final int responses;
  final int maxResponses;
  final String status;
  final String tutorGender;
  final String note;
  final int coinsRequired;
  final String contactName;
  final String contactNumber;
  final String contactEmail;
  final String imageUrl; // New image field!

  Lead({
    required this.leadNo,
    required this.date,
    required this.classInfo,
    required this.subject,
    required this.location,
    required this.mode,
    required this.fee,
    required this.responses,
    required this.maxResponses,
    required this.status,
    required this.tutorGender,
    required this.note,
    required this.coinsRequired,
    required this.contactName,
    required this.contactNumber,
    required this.contactEmail,
    required this.imageUrl,
  });

  // Factory constructor to create Lead from JSON
  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      leadNo: json['leadNo'],
      date: json['date'],
      classInfo: json['classInfo'],
      subject: json['subject'],
      location: json['location'],
      mode: json['mode'],
      fee: json['fee'],
      responses: json['responses'],
      maxResponses: json['maxResponses'],
      status: json['status'],
      tutorGender: json['tutorGender'] ?? "Any",
      note: json['note'] ?? "No additional notes",
      coinsRequired: json['coinsRequired'] ?? 0,
      contactName: json['contactName'] ?? "Not provided",
      contactNumber: json['contactNumber'] ?? "Not provided",
      contactEmail: json['contactEmail'] ?? "Not provided",
      imageUrl: json['imageUrl'] ??
          "https://via.placeholder.com/150", // Default image URL
    );
  }

  // Convert Lead to JSON
  Map<String, dynamic> toJson() {
    return {
      'leadNo': leadNo,
      'date': date,
      'classInfo': classInfo,
      'subject': subject,
      'location': location,
      'mode': mode,
      'fee': fee,
      'responses': responses,
      'maxResponses': maxResponses,
      'status': status,
      'tutorGender': tutorGender,
      'note': note,
      'coinsRequired': coinsRequired,
      'contactName': contactName,
      'contactNumber': contactNumber,
      'contactEmail': contactEmail,
      'imageUrl': imageUrl,
    };
  }
}
