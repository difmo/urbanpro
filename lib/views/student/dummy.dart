// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// // Modal content widget (you can replace this with any content you want to show inside the modal)
// class ModalInsideModal extends StatelessWidget {
//   final VoidCallback onExpand;

//   ModalInsideModal({required this.onExpand});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'This is an Avatar Modal!',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Image.network('https://picsum.photos/200'),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: onExpand, // Trigger expansion action
//             child: Text('Expand to Full Screen'),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the modal
//             },
//             child: Text('Close Modal'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modal Bottom Sheet Demo',
//       theme: ThemeData(platform: TargetPlatform.iOS),
//       darkTheme: ThemeData.dark().copyWith(platform: TargetPlatform.iOS),
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(title: 'Modal Bottom Sheet Demo'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   MyHomePage({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text(title),
//         trailing: GestureDetector(
//           child: Icon(Icons.arrow_forward),
//           onTap: () => _showAvatarModal(context), // Trigger modal on tap
//         ),
//       ),
//       child: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Horizontal Button at the center
//               GestureDetector(
//                 onTap: () => _showAvatarModal(context), // Trigger modal on tap
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                   width: 200, // Width of the button
//                   decoration: BoxDecoration(
//                     color: CupertinoColors.activeBlue,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Show Avatar Modal',
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to show the Avatar Modal using modal_bottom_sheet package
//   void _showAvatarModal(BuildContext context) {
//     showCupertinoModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       expand: false, // Initially show modal half-screen
//       builder: (context) {
//         return ModalInsideModal(
//           onExpand: () {
//             Navigator.of(context).pop(); // Close the current modal
//             _showExpandedModal(context); // Reopen it with expand true
//           },
//         );
//       },
//     );
//   }

//   // Function to show the expanded modal
//   void _showExpandedModal(BuildContext context) {
//     showCupertinoModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       expand: true, // Modal will expand to full screen
//       builder: (context) {
//         return ModalInsideModal(
//           onExpand: () {
//             Navigator.of(context).pop(); // Close the modal
//           },
//         );
//       },
//     );
//   }
// }
