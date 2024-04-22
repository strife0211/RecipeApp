import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class RecipesTypesComponent extends StatefulWidget {
  final Function(String) onRecipeTypeSelected;
  
  const RecipesTypesComponent({super.key, required this.onRecipeTypeSelected});

  @override
  State<RecipesTypesComponent> createState() => _RecipesTypesComponentState();
}

class _RecipesTypesComponentState extends State<RecipesTypesComponent> {
  List<String> recipesTypes = ["All", "Salad", "Snack", "Drink"];
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recipesTypes.length,
          itemBuilder: (context, index) => buildRecipeTypes(index),
        ),
      ),
    );
  }

  Widget buildRecipeTypes(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          widget.onRecipeTypeSelected(recipesTypes[index]);
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index ? const Color(0xFFC0EAB5) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          recipesTypes[index],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor
          ),
        ),
      ),
    );
  }
}