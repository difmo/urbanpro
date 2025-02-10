import 'package:URBANPRO/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Utils {
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(Icons.error),
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 500,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red,
      colorText: AppColors.primaryColor,
      dismissDirection: DismissDirection.horizontal,
      barBlur: 2,
      isDismissible: true,
      shouldIconPulse: true,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 500,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.green,
      dismissDirection: DismissDirection.horizontal,
      barBlur: 2,
      colorText: AppColors.primaryColor,
      isDismissible: true,
      shouldIconPulse: true,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  static void showWarningSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 500,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.highlight,
      colorText: AppColors.primaryColor,
      dismissDirection: DismissDirection.horizontal,
      barBlur: 2,
      isDismissible: true,
      shouldIconPulse: true,
      animationDuration: const Duration(
        milliseconds: 200,
      ),
    );
  }
}
