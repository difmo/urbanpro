import 'package:URBANPRO/models/otp_sucess_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StorageService {
  Future<void> write(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  Future<Map<String, dynamic>?> read(String key) async {
    final prefs = await SharedPreferences.getInstance(); 
    final data = prefs.getString(key); 

    if (data != null) {
      return jsonDecode(data) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setUserData(OtpSuccessResponse otpSuccessResponse) async {
    final prefs = await SharedPreferences.getInstance();

    final Map<String, dynamic> otpData = {
      'success': otpSuccessResponse.success,
      'token': otpSuccessResponse.token,
      'fairbasetoken': otpSuccessResponse.fairbasetoken,
      'user_data': {
        'id': otpSuccessResponse.userData.id,
        'name': otpSuccessResponse.userData.name,
        'mobile': otpSuccessResponse.userData.mobile,
        'created_at': otpSuccessResponse.userData.createdAt.toIso8601String(),
        'updated_at': otpSuccessResponse.userData.updatedAt.toIso8601String(),
        'roles': otpSuccessResponse.userData.roles
            .map((role) => {
                  'role_id': role.roleId,
                  'role_name': role.roleName,
                })
            .toList(),
      },
      'message': otpSuccessResponse.message,
    };

    await prefs.setString('otpSuccessResponse', jsonEncode(otpData));
  }

  Future<OtpSuccessResponse?> readUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString('otpSuccessResponse');

    if (data != null) {
      final Map<String, dynamic> jsonData = jsonDecode(data);
      return OtpSuccessResponse.fromJson(jsonData);
    } else {
      return null;
    }
  }
}
