// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:recipe_app/components/navigation_controller.dart';
// import 'package:recipe_app/screens/listing_page_screen.dart';
// class NavigationScreen extends StatelessWidget {
//   const NavigationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final navigationController = Get.put(NavigationController());
//     return GetBuilder<NavigationController>(
//       builder: (_) {
//         return Scaffold(
//           body: SafeArea(
//             child: IndexedStack(
//               index: navigationController.tabIndex,
//               children:  [
//                 const ListingPageScreen(),
//                 const ListingPageScreen(),
//                 const ListingPageScreen(),
//                 const ListingPageScreen(),
//                 const ListingPageScreen(),
//               ],
//             )
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.indigo,
//             unselectedItemColor: const Color.fromARGB(255, 175, 175, 175),
//             selectedItemColor: Colors.white,
//             onTap: navigationController.changeTabInex,
//             currentIndex: navigationController.tabIndex,
//             showSelectedLabels: true,
//             showUnselectedLabels: false,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.feed),
//                 label: 'Post',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(CupertinoIcons.person_3_fill),
//                 label: 'Match',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.notifications),
//                 label: 'Notification',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(CupertinoIcons.chat_bubble),
//                 label: 'Chat',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(CupertinoIcons.home),
//                 label: 'Home',
//               ),
//             ]
//           ),
//         );
//       }
//     );
//   }
// }