class Account {
  bool isProfileOn;
  int maxCallsPerDay;
  bool allowReviews;
  String leadsLink;
  String coursesLink;
  String studioContact;

  // ✅ **Basic Profile Details**
  String profileImage;
  String name;
  String qualification;
  int experience;

  // ✅ **Extended Tutor Information**
  String email;
  String phone;
  String city;
  List<String> subjects;
  String teachingMode; // e.g., "Online", "Offline", "Hybrid"
  double hourlyRate;
  String bio; // Short bio or tagline for the tutor
  List<String> certifications; // Any tutor certificates or achievements
  String availability; // e.g., "Mon-Fri: 4 PM - 8 PM"
  double rating; // Average rating out of 5
  int totalReviews; // Total number of reviews
  int totalStudents; // Total students taught
  int totalCourses; // Total courses provided

  Account({
    required this.isProfileOn,
    required this.maxCallsPerDay,
    required this.allowReviews,
    required this.leadsLink,
    required this.coursesLink,
    required this.studioContact,
    required this.profileImage,
    required this.name,
    required this.qualification,
    required this.experience,

    // 🆕 **Extended Details Initialization**
    required this.email,
    required this.phone,
    required this.city,
    required this.subjects,
    required this.teachingMode,
    required this.hourlyRate,
    required this.bio,
    required this.certifications,
    required this.availability,
    required this.rating,
    required this.totalReviews,
    required this.totalStudents,
    required this.totalCourses,
  });

  /// ✅ **Factory method to parse from JSON (for API support)**
  factory Account.fromJson(Map<String, dynamic> json) => Account(
        isProfileOn: json['isProfileOn'] ?? true,
        maxCallsPerDay: json['maxCallsPerDay'] ?? 5,
        allowReviews: json['allowReviews'] ?? true,
        leadsLink: json['leadsLink'] ?? '',
        coursesLink: json['coursesLink'] ?? '',
        studioContact: json['studioContact'] ?? '',
        profileImage: json['profileImage'] ?? '',
        name: json['name'] ?? 'Unknown',
        qualification: json['qualification'] ?? 'Not Provided',
        experience: json['experience'] ?? 0,
        email: json['email'] ?? 'Not provided',
        phone: json['phone'] ?? 'Not provided',
        city: json['city'] ?? 'Unknown',
        subjects: List<String>.from(json['subjects'] ?? []),
        teachingMode: json['teachingMode'] ?? 'Offline',
        hourlyRate: (json['hourlyRate'] ?? 0).toDouble(),
        bio: json['bio'] ?? 'No bio provided',
        certifications: List<String>.from(json['certifications'] ?? []),
        availability: json['availability'] ?? 'Not provided',
        rating: (json['rating'] ?? 0).toDouble(),
        totalReviews: json['totalReviews'] ?? 0,
        totalStudents: json['totalStudents'] ?? 0,
        totalCourses: json['totalCourses'] ?? 0,
      );

  /// ✅ **Convert Account data back to JSON (for API submission)**
  Map<String, dynamic> toJson() => {
        'isProfileOn': isProfileOn,
        'maxCallsPerDay': maxCallsPerDay,
        'allowReviews': allowReviews,
        'leadsLink': leadsLink,
        'coursesLink': coursesLink,
        'studioContact': studioContact,
        'profileImage': profileImage,
        'name': name,
        'qualification': qualification,
        'experience': experience,
        'email': email,
        'phone': phone,
        'city': city,
        'subjects': subjects,
        'teachingMode': teachingMode,
        'hourlyRate': hourlyRate,
        'bio': bio,
        'certifications': certifications,
        'availability': availability,
        'rating': rating,
        'totalReviews': totalReviews,
        'totalStudents': totalStudents,
        'totalCourses': totalCourses,
      };
}
