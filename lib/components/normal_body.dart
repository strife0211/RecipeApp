import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/components/normal_recipe_card_component.dart';
import 'package:recipe_app/components/recipes_types_component.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:recipe_app/service/FirestoreService.dart';
import 'package:recipe_app/service/RecipeService.dart';

class NormalBodyComponent extends StatefulWidget {
  const NormalBodyComponent({Key? key}) : super(key: key);

  @override
  _NormalBodyComponentState createState() => _NormalBodyComponentState();
}

class _NormalBodyComponentState extends State<NormalBodyComponent> {
  final RecipeService _recipeService = RecipeService();
  final FireStoreService _fireStoreRecipeService = FireStoreService(); 
  bool filter = false;
  String filterType = "";
  late Future<void> _loadRecipesFuture;

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
                filter = false;
              } else {
                filter = true;
                filterType = type;
              }
            });
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: StreamBuilder<QuerySnapshot>(
              stream: filter ? _fireStoreRecipeService.getRecipeListByType(filterType) : _fireStoreRecipeService.getRecipeList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List recipeList = snapshot.data!.docs;
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.0,
                    ),
                    itemCount:recipeList.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot recipeDocument = recipeList[index];
                      Map<String, dynamic> data = recipeDocument.data() as Map<String, dynamic>;
                      String id = recipeDocument.id;
                      String name = data['name'];
                      String type = data['type'];
                      String pic = data['pic'];
                      String ingredients = data['ingredients'];
                      String steps = data['steps'];
                      RecipesTypes recipe = RecipesTypes(id: id, name: name, type: type, picture: pic, ingredients: ingredients, steps: steps);
                      return NormalRecipeCardComponent(recipe: recipe);
                    },
                  );
                }
                else {
                  return const Text("No Recipe");
                }
              }
            ),
          ),
        ) 
      ],
    );
  }
}