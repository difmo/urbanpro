import 'package:URBANPRO/utils/theme_constants.dart';
import 'package:flutter/material.dart';

class TeacherBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const TeacherBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
      ), // Added padding
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedItemColor: ThemeConstants.secondaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.equalizer_rounded),
            label: 'Enquiries',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Follow-Up',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message ',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Support',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
