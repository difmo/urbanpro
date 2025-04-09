import 'package:URBANPRO/models/otp_sucess_response.dart';
import 'package:URBANPRO/models/send_otp_response.dart';
import 'package:URBANPRO/routes/app_routes.dart';
import 'package:URBANPRO/utils/storage_service.dart';
import 'package:get/get.dart';
import '../repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  var isLoading = false.obs;
  final StorageService storageService = StorageService();
  Future<OtpGetResponse> sendOtpcontroller(
      String mobile, String email, String name, int role) async {
    isLoading.value = true;
    try {
      final responsedata =
          await _authRepository.sendOtpRepo(mobile, email, name, role);
      Get.snackbar('Success', responsedata.message);
      print(responsedata.otpData.mobileOtp);
      Get.toNamed(AppRoutes.OTPSCREEN, arguments: {
        'phone': mobile,
        'email': email,
        'name': name,
        'role': role,
        'otp': responsedata.otpData.mobileOtp
      });
      return responsedata;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<OtpSuccessResponse> OtpSuccesscontroller(
      String mobile, String email, int otp, String name, int role) async {
    isLoading.value = true;
    try {
      final responsedata =
          await _authRepository.verifyOtpRepo(mobile, email, otp, name, role);
      Get.snackbar('Success', responsedata.message);
      print(responsedata.success);
      responsedata.userData.roles.forEach((role) {
        print(role.roleId);
      });
      await _saveLoginData(responsedata);

      return responsedata;
    } catch (e) {
      Get.snackbar('Error', e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveLoginData(OtpSuccessResponse responsedata) async {
    Map<String, dynamic> loginData = {
      'token': responsedata.token,
      'isLoggedIn': true,
      'userId': responsedata.userData.id,
      'userName': responsedata.userData.name,
      'roleData': responsedata.userData.roles
          .map((role) => {
                'roleId': role.roleId.toString(),
                'roleName': role.roleName,
              })
          .toList()
    };
    await storageService.write('login_details', loginData);
  }
}
