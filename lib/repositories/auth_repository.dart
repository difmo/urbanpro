
import '../api/api_client.dart';
import '../api/endpoints.dart';
import '../models/user_model.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<dynamic> login(String email, String password) async {
    try {
      final body = {'email': email, 'password': password};
      return await _apiClient.post(Endpoints.LOGIN, body);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      final body = {'email': email, 'password': password};
      await _apiClient.post(Endpoints.SIGNUP, body);
    } catch (e) {
      throw Exception('Signup failed: $e');
    }
  }

  Future<UserModel> loginWithGet(
      String appID, String studentID, String password) async {
    try {
      final queryParameters = {
        'logid': studentID,
        'passid': password,
        'brid': appID,
      };
      final response = await _apiClient.get(
        Endpoints.LOGIN,
        queryParameters: queryParameters,
      );
      return UserModel.fromJson(response);
    } catch (e) {
      throw Exception('Login with GET failed: $e');
    }
  }
}
