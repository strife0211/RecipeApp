import 'package:flutter/material.dart';
import 'package:recipe_app/components/body.dart';
import 'package:recipe_app/components/listing_page_app_bar.dart';

class ListingPageScreen extends StatelessWidget {
  const ListingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ListingPageAppBar(),
      body: BodyComponent(),
      // bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}