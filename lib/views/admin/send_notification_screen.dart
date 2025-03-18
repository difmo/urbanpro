import 'package:URBANPRO/models/admin/notification_model.dart';
import 'package:URBANPRO/services/admin/notification_service.dart';
import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendNotificationScreen extends StatefulWidget {
  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  final NotificationService _notificationService = NotificationService();
  String _selectedUserType = "All";
  bool _isSending = false;

  void _sendNotification() async {
    if (_titleController.text.isEmpty || _messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter title and message")),
      );
      return;
    }

    setState(() => _isSending = true);

    NotificationModel notification = NotificationModel(
      title: _titleController.text,
      message: _messageController.text,
      userType: _selectedUserType,
    );

    bool success = await _notificationService.sendNotification(notification);

    setState(() => _isSending = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              success ? "Notification Sent!" : "Failed to send notification")),
    );

    if (success) {
      _titleController.clear();
      _messageController.clear();
      setState(() => _selectedUserType = "All");
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.white,
      appBar: AppBar(
          backgroundColor: ThemeConstants.white,
          title: Text(
            "Send Notification",
            style: AppTextStyle.Text18700,
          )),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Notification Title Input**
            CommonTextField(
              controller: _titleController,
              label: "Notification Title",
              inputType: InputType.name,
              onChanged: (value) {},
              hint: '',
            ),

            SizedBox(height: 12),

            /// **Notification Message Input**
            CommonTextField(
              controller: _messageController,
              label: "Notification Message",
              maxLines: 4,
              inputType: InputType.address,
              onChanged: (value) {},
              hint: '',
            ),

            SizedBox(height: 12),

            /// **Select User Type**
            Text("Send To:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(child: _buildUserTypeOption("All")),
                Expanded(child: _buildUserTypeOption("Students")),
                Expanded(child: _buildUserTypeOption("Teachers")),
              ],
            ),

            SizedBox(height: 20),

            /// **Send Notification Button**
            _isSending
                ? Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      width: 70,
                      baseTextColor: ThemeConstants.whiteColor,
                      text: 'Send Notification',
                      onPressed: _sendNotification,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  /// **Radio Button for Selecting User Type**
  Widget _buildUserTypeOption(String type) {
    return Row(
      children: [
        Radio(
          value: type,
          groupValue: _selectedUserType,
          activeColor: ThemeConstants.primaryColor, // Set theme color
          onChanged: (value) {
            setState(() => _selectedUserType = value as String);
          },
        ),
        Text(
          type,
          style: AppTextStyle.Text12300,
        ),
      ],
    );
  }
}
