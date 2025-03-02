import 'package:flutter/material.dart';

class CustomAppBarNew extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBarNew({Key? key}) 
      : preferredSize = const Size.fromHeight(kToolbarHeight), 
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Test Series",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(0, 0, 225, 255),
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
