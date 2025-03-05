import 'package:URBANPRO/models/teacher/account_model.dart';

class AccountService {
  Future<Account> fetchAccountDetails() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API call
    return Account(
      isProfileOn: true,
      maxCallsPerDay: 5,
      allowReviews: true,
      leadsLink: "https://example.com/leads",
      coursesLink: "https://example.com/courses",
      studioContact: "https://example.com/studio",
      profileImage: "https://via.placeholder.com/150",
      name: "John Doe",
      qualification: "M.Sc. in Mathematics",
      experience: 8,
    );
  }
}
