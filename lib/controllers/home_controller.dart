import 'package:get/get.dart';
import '../models/user_model.dart';
import '../utils/storage_service.dart';

class HomeController extends GetxController {
  var user = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    // fetchUserDetails();
  }

  // void fetchUserDetails() {
  //   final userData = StorageService().read('user');
  //   if (userData != null) {
  //     user.value = UserModel.fromJson(userData);
  //   }
  // }

  void logout() {
    StorageService().clear();
    Get.offAllNamed('/login');
  }
}
