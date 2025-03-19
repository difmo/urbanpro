import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeacherChatSupportScreen extends StatefulWidget {
  const TeacherChatSupportScreen({super.key});

  @override
  _TeacherChatSupportScreenState createState() =>
      _TeacherChatSupportScreenState();
}

class _TeacherChatSupportScreenState extends State<TeacherChatSupportScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({"text": _messageController.text, "sender": "teacher"});
      });
      _messageController.clear();

      /// Simulate a support staff response after a delay
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            "text": "Hello! How can we assist you today?",
            "sender": "support"
          });
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF4A90E2), // Your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons (for dark backgrounds)
      statusBarBrightness: Brightness.dark, // For iOS
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeConstants.white,
        appBar: CustomAppBar(
          title: "Chat-Support",
          scaffoldKey: _scaffoldKey,
          backgroundColor: ThemeConstants.white,
        ),
        body: Column(
          children: [
            /// Chat Messages
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  bool isTeacher = message["sender"] == "teacher";

                  return Align(
                    alignment: isTeacher
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isTeacher ? Colors.blueAccent : Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft:
                              isTeacher ? Radius.circular(16) : Radius.zero,
                          bottomRight:
                              isTeacher ? Radius.zero : Radius.circular(16),
                        ),
                      ),
                      child: Text(
                        message["text"]!,
                        style: TextStyle(
                            color: isTeacher ? Colors.white : Colors.black87),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// Message Input Field
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_file, color: Colors.blueAccent),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Attach File Clicked")),
                      );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: _sendMessage,
                    backgroundColor: Colors.blueAccent,
                    mini: true,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
