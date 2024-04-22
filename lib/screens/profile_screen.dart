
import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu, 
            color: primaryTextColor
          )
        ),
        centerTitle: true,
        title: const Text(
          "Profile Screen",
          style: TextStyle(color: primaryTextColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: primaryTextColor
            ),
            onPressed: () {},
          )
        ],
      ),
      body: const Text("Just for testing"),
    );
  }
}