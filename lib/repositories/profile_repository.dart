import 'package:URBANPRO/api/api_client.dart';
import 'package:URBANPRO/api/endpoints.dart';
import 'package:URBANPRO/models/profile_send_modal.dart';
import 'package:URBANPRO/models/profile_modal.dart';
import 'package:URBANPRO/utils/storage_service.dart';

class ProfileRepository {
  final ApiClient _apiClient = ApiClient();

  Future<StudentProfileModal> setOrUpdateProfile(
      StudentProfileSetUpdateModal studentProfileData) async {
    try {
      final StorageService storageService = StorageService();
      final formData = studentProfileData.toFormData();
      final data =
          await storageService.read('login_details'); // or any key you stored
      final token = data != null ? data['token'] ?? "" : "";
      if (data != null) {
        print("✅ Data found for dsfds key:");
        print("Token: ${data['token']}");
        print("User ID: ${data['userId']}");
        print("User Name: ${data['userName']}");
      } else {
        print("⚠️ No data found for the given key.");
      }

      final responseJson = await _apiClient.post(
        Endpoints.USER_PROFILE_SET_AND_UPDATE,
        formData,
        (json) => StudentProfileModal.fromJson(json),
        token: token,
      );

      if (responseJson.success == true) {
        return responseJson;
      } else {
        throw Exception('Profile update failed: ${responseJson.message}');
      }
    } catch (e) {
      throw Exception('Profile update request failed: $e');
    }
  }

  Future<StudentProfileModal> getOrUpdateProfile() async {
    try {
      final StorageService storageService = StorageService();
 final data =
          await storageService.read('login_details'); // or any key you stored
      final token = data != null ? data['token'] ?? "" : "";
      if (data != null) {
        print("✅ Data found for dsfds key:");
        print("Token: ${data['token']}");
        print("User ID: ${data['userId']}");
        print("User Name: ${data['userName']}");
      } else {
        print("⚠️ No data found for the given key.");
      }

      final responseJson = await _apiClient.post(
        Endpoints.USER_PROFILE,
        {"": ""},
        (json) => StudentProfileModal.fromJson(json),
        token: token,
      );

      if (responseJson.success == true) {
        return responseJson;
      } else {
        throw Exception('Profile update failed: ${responseJson.message}');
      }
    } catch (e) {
      throw Exception('Profile update request failed: $e');
    }
  }
}
