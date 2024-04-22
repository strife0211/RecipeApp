import 'package:flutter/material.dart';
import 'package:recipe_app/components/recipe_card_component.dart';
import 'package:recipe_app/components/recipes_types_component.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:recipe_app/service/RecipeService.dart';

class BodyComponent extends StatefulWidget {
  const BodyComponent({Key? key}) : super(key: key);

  @override
  _BodyComponentState createState() => _BodyComponentState();
}

class _BodyComponentState extends State<BodyComponent> {
  final RecipeService _recipeService = RecipeService();
  List<RecipesTypes>? test;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadRecipesFuture = _recipeService.loadRecipes();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RecipesTypesComponent(
          onRecipeTypeSelected: (String type) async {
            setState(() {
              if (type == "All") {
                test = null;
              } else {
                test = _recipeService.getRecipeByType(type);
              }
            });
          },
        ),
        FutureBuilder<void>(
          future: _recipeService.loadRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.0,
                    ),
                    itemCount: test == null ? _recipeService.recipes.length : test!.length,
                    itemBuilder: (context, index) => RecipeCardComponent(recipe: test == null ? _recipeService.recipes[index] : test![index]),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}