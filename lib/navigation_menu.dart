import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/screens/add_recipe_page_screen.dart';
import 'package:recipe_app/screens/listing_page_screen.dart';
import 'package:recipe_app/screens/normal_listing_page_screen.dart';
import 'package:recipe_app/screens/profile_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
      
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.add), label: "Add"),
            NavigationDestination(icon: Icon(Icons.list), label: "List"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [ListingPageScreen(), const AddRecipePageScreen(), const NormalListingPageScreen(), const ProfileScreen()];
}