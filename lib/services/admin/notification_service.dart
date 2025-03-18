import 'package:URBANPRO/models/admin/notification_model.dart';

class NotificationService {
  Future<bool> sendNotification(NotificationModel notification) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate sending notification
    print("Notification Sent: ${notification.toJson()}");
    return true; // Simulated success
  }
}
