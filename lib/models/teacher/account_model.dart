class Account {
  bool isProfileOn;
  int maxCallsPerDay;
  bool allowReviews;
  String leadsLink;
  String coursesLink;
  String studioContact;

  // Teacher Profile Fields
  String profileImage;
  String name;
  String qualification;
  int experience;

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
  });
}
