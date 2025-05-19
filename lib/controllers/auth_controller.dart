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
    print("🔄 Sending OTP for mobile: $mobile, email: $email, name: $name, role: $role");
    try {
      final responsedata =
          await _authRepository.sendOtpRepo(mobile, email, name, role);

      print("✅ OTP Response: ${responsedata.otpData.mobileOtp}");
      Get.snackbar('Success', responsedata.message);

      // Navigating to OTP screen
      Get.toNamed(AppRoutes.OTPSCREEN, arguments: {
        'mobile': mobile,
        'email': email,
        'name': name,
        'role': role,
        'otp': responsedata.otpData.mobileOtp
      });

      return responsedata;
    } catch (e) {
      print("❌ Error sending OTP: $e");
      Get.snackbar('Error', e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<OtpSuccessResponse> OtpSuccesscontroller(
      String mobile, String email, int otp, String name, int role) async {
    isLoading.value = true;
    print("🔄 Verifying OTP: $otp for mobile: $mobile, email: $email, name: $name, role: $role");
    try {
      final responsedata =
          await _authRepository.verifyOtpRepo(mobile, email, otp, name, role);

      print("✅ OTP Verification Success: ${responsedata.success}");
      print("👤 User Data:");
      print("   ID: ${responsedata.userData.id}");
      print("   Name: ${responsedata.userData.name}");
      print("   Token: ${responsedata.token}");

      for (var role in responsedata.userData.roles) {
        print("   Role: ${role.roleId} - ${role.roleName}");
      }

      await _saveLoginData(responsedata);
      return responsedata;
    } catch (e) {
      print("❌ Error verifying OTP: $e");
      Get.snackbar('Error', e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveLoginData(OtpSuccessResponse responsedata) async {
    print("💾 Saving login data...");
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
    print("✅ Login data saved: $loginData");
  }
}
