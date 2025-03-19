import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeacherChat extends StatefulWidget {
  final String name;
  final String profileUrl;

  const TeacherChat({
    super.key,
    required this.name,
    required this.profileUrl,
  });

  @override
  _TeacherChatState createState() => _TeacherChatState();
}

class _TeacherChatState extends State<TeacherChat> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> messages = [];
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ThemeConstants.primaryColor, // Your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons (for dark backgrounds)
      statusBarBrightness: Brightness.dark, // For iOS
    ));
  }

  void sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({"text": _messageController.text, "sender": "user"});
        _messageController.clear();
      });

      // Simulating a bot response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          messages.add({"text": "Got it! 👍", "sender": "bot"});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.profileUrl),
              ),
              const SizedBox(width: 10),
              Text(widget.name),
            ],
          ),
          backgroundColor: ThemeConstants.secondaryColor,
          elevation: 1,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  bool isUser = message["sender"] == "user";

                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        message["text"]!,
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: CommonTextField(
                        suffixicon: Icons.send,
                        inputType: InputType.name,
                        controller: TextEditingController(),
                        onChanged: (p0) => {},
                        label: "",
                        hint: "Type a message here")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
