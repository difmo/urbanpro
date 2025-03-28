import 'package:URBANPRO/utils/app__text_style.dart';
import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:URBANPRO/views/student/live_chat_support_screen.dart';
import 'package:URBANPRO/views/student/profile_edit_form.dart';
import 'package:URBANPRO/views/widgets/custom_button.dart';
import 'package:URBANPRO/views/widgets/custom_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.045;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: CustomStatusBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(color: ThemeConstants.primaryColorSoft),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                _buildProfileSection(context),
                const SizedBox(height: 20),
                _buildStudentAcadmicDetialsCard(context),
                const SizedBox(height: 20),
                _buildContactSection(fontSize),
                const SizedBox(height: 20),
                _buildFaqSection(fontSize),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: _buildChatButton(context),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ThemeConstants.primaryColor,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/4.jpg'),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pritam Kumar Sharma",
                      style: AppTextStyle.Text16500.copyWith(
                          color: ThemeConstants.white)),
                  const SizedBox(height: 2),
                  Text("7800730968",
                      style: AppTextStyle.Text14500.copyWith(
                          color: ThemeConstants.white)),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileEditForm()),
                  );
                },
                child: SvgPicture.asset(
                  "assets/icons/edit.svg",
                  color: ThemeConstants.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStudentAcadmicDetialsCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: ThemeConstants.secondaryColorSoft,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Enrolled Course : ", style: AppTextStyle.Text14500),
                  Text("None", style: AppTextStyle.Text14500),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text("Board Name          :", style: AppTextStyle.Text14500),
                  Text(" None", style: AppTextStyle.Text14500),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileEditForm()),
              );
            },
            child: SvgPicture.asset(
              "assets/icons/edit.svg",
              color: ThemeConstants.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(double fontSize) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Support",
                style: AppTextStyle.Text18600.copyWith(
                    color: ThemeConstants.secondaryColor)),
            const SizedBox(height: 10),
            _buildContactItem(Icons.call, "+1 800 123 4567"),
            const Divider(),
            _buildContactItem(Icons.email, "support@urbanpro.com"),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: ThemeConstants.lightGrey),
      title: Text(text, style: AppTextStyle.Text14400),
      onTap: () {
        // Add call or email functionality
      },
    );
  }

  Widget _buildFaqSection(double fontSize) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Frequently Asked Questions",
                    style: AppTextStyle.Text18600.copyWith(
                        color: ThemeConstants.secondaryColor)),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(faqs[index]["question"]!,
                          style: AppTextStyle.Text14400),
                      trailing: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              icon: Icon(
                                Icons.help,
                                color: ThemeConstants.white,
                              ),
                              backgroundColor: ThemeConstants.primaryColor,
                              title: Text(faqs[index]["question"]!,
                                  style: AppTextStyle.Text18600.copyWith(
                                      color: ThemeConstants.white)),
                              content: Text(faqs[index]["answer"]!,
                                  style: AppTextStyle.Text14600.copyWith(
                                      color: ThemeConstants.white)),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "Close",
                                    style: AppTextStyle.Text16600.copyWith(
                                        color: ThemeConstants.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    if (index < faqs.length - 1) const Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: CustomButton(
          text: "Live Chat Support",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LiveChatScreen()),
            );
          },
        ));
  }
}

List<Map<String, String>> faqs = [
  {
    "question": "How do I reset my password?",
    "answer": "Go to settings > account > reset password."
  },
  {
    "question": "How do I join a live class?",
    "answer": "Click on the 'Join' button in your course dashboard."
  },
  {
    "question": "How do I contact my tutor?",
    "answer": "Use the 'Message Tutor' button in your course page."
  },
  {
    "question": "How do I change my subscription?",
    "answer": "Go to settings > subscription > change plan."
  },
];
