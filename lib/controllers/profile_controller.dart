import 'package:URBANPRO/models/profile_modal.dart';
import 'package:URBANPRO/models/profile_send_modal.dart';
import 'package:URBANPRO/repositories/profile_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepository = ProfileRepository();

  var isLoading = false.obs;

  Future<void> setProfileController(
      StudentProfileSetUpdateModal profileModal) async {
    try {
      isLoading.value = true;
      StudentProfileModal result =
          await _profileRepository.setOrUpdateProfile(profileModal);
      print("Profile added successfully: ${result.toJson()}");
    } catch (e) {
      print("Error adding profile: $e");
    } finally {
      isLoading.value = false;
    }
    throw Exception("Failed to fetch profile");
  }

  Future<StudentProfileModal> getProfileController() async {
    try {
      isLoading.value = true;
      StudentProfileModal result =
          await _profileRepository.getOrUpdateProfile();
      print("Profile added successfully: ${result.toJson()}");
      return result;
    } catch (e) {
      print("Error adding profile: $e");
    } finally {
      isLoading.value = false;
    }
    throw Exception("Failed to fetch profile");
  }
}
