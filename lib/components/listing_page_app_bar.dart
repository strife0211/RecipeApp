import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

AppBar ListingPageAppBar() {
    return AppBar(
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
        "Recipe App",
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
    );
  }