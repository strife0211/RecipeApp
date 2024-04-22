import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:recipe_app/screens/normal_edit_recipe_screen.dart';
import 'package:recipe_app/service/FirestoreService.dart';

class NormalViewRecipeScreen extends StatelessWidget {
  final RecipesTypes recipe;
  final FireStoreService _fireStoreRecipeService = FireStoreService(); 
  NormalViewRecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(recipe.picture),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF6F35A5),
                                  Color(0xFF2979FF),
                                ]
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(50),
                                  spreadRadius: 4,
                                  blurRadius: 4,
                                  offset: const Offset(3, 3),
                                )
                              ]
                            ),
                            child: const Icon(
                              Icons.favorite, 
                              color: Colors.white,
                              size: 30,
                            )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recipe.name, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 15.0),
                  Text(recipe.type, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 15.0),
                  Text(
                    'Recipe Ingredient',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    recipe.ingredients,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Recipe Steps',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    recipe.steps,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 2,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NormalEditRecipeScreen(id: recipe.id),
                          ),
                        ),
                        child: Container(
                          height: 30,
                          width: 150,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.indigo,
                                Colors.blue,
                              ]
                            )
                          ),
                          child: Text(
                            'Edit Recipe',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _fireStoreRecipeService.deleteRecipe(recipe.id!);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 150,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.indigo,
                                Colors.blue,
                              ]
                            )
                          ),
                          child: Text(
                            'Delete Recipe',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}