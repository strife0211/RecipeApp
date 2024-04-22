// import 'package:flutter/material.dart';
// import 'package:recipe_app/screens/add_recipe_page_screen.dart';
// import 'package:recipe_app/screens/listing_page_screen.dart';
// import 'package:recipe_app/screens/normal_listing_page_screen.dart';

// class NavItem {
//   final int id;
//   final IconData icon;
//   final Widget destination;

//   NavItem({required this.id, required this.icon, required this.destination});

// // If there is no destination then it help us
//   bool destinationChecker() {
//     if (destination != null) {
//       return true;
//     }
//     return false;
//   }
// }

// // If we made any changes here Provider package rebuid those widget those use this NavItems
// class NavItems extends ChangeNotifier {
//   // By default first one is selected
//   int selectedIndex = 0;

//   void changeNavIndex({required int index}) {
//     selectedIndex = index;
//     // if any changes made it notify widgets that use the value
//     notifyListeners();
//   }

//   List<NavItem> items = [
//     NavItem(
//       id: 1,
//       icon: Icons.home,
//       destination: ListingPageScreen(),
//     ),
//     NavItem(
//       id: 2,
//       icon: Icons.add,
//       destination: AddRecipePageScreen(),
//     ),
//     NavItem(
//       id: 3,
//       icon: Icons.photo_camera,
//       destination: NormalListingPageScreen(),
//     ),
//     NavItem(
//       id: 4,
//       icon: Icons.book,
//       destination: ListingPageScreen(),
//     ),
//     NavItem(
//       id: 5,
//       icon: Icons.person,
//       destination: ListingPageScreen(),
//     ),
//   ];
// }