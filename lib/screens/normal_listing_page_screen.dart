import 'package:flutter/material.dart';
import 'package:recipe_app/components/listing_page_app_bar.dart';
import 'package:recipe_app/components/normal_body.dart';

class NormalListingPageScreen extends StatelessWidget {
  const NormalListingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ListingPageAppBar(),
      body: NormalBodyComponent(),
    );
  }
}