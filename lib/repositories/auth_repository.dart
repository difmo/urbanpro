import 'package:URBANPRO/models/otp_sucess_response.dart';
import 'package:URBANPRO/models/send_otp_response.dart';

import '../api/api_client.dart';
import '../api/endpoints.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<OtpGetResponse> sendOtpRepo(
      String mobile, String email, String name, String roleId) async {
    try {
      final body = {
        'mobile': mobile,
        'email': email,
        'name': name,
        'role_id': roleId,
      };
      final responseJson = await _apiClient.post(
          Endpoints.SEND_OTP, body, (json) => OtpGetResponse.fromJson(json));

      if (responseJson.success == true) {
        return responseJson;
      } else {
        throw Exception('OTP verification failed: ${responseJson.message}');
      }
    } catch (e) {
      throw Exception('OTP request failed: $e');
    }
  }

  Future<OtpSuccessResponse> verifyOtpRepo(
      String mobile, String email, int otp, String name, String roleId) async {
    try {
      final body = {
        'mobile': mobile,
        'email': email,
        'name': name,
        'role_id': roleId,
        'otp': otp,
      };
      final responseJson = await _apiClient.post(Endpoints.VERIFY_OTP, body,
          (json) => OtpSuccessResponse.fromJson(json));
      if (responseJson.success == true) {
        return responseJson;
      } else {
        throw Exception('OTP verification failed: ${responseJson.message}');
      }
    } catch (e) {
      throw Exception('OTP request failed: $e');
    }
  }
}
