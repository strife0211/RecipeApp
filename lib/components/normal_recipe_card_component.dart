import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:recipe_app/screens/normal_view_recipe.dart';

class NormalRecipeCardComponent extends StatelessWidget {
  final RecipesTypes recipe;
  const NormalRecipeCardComponent({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NormalViewRecipeScreen(recipe: recipe),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: primaryTextColor
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      recipe.type,
                      style: const TextStyle(
                        color: primaryTextColor
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        const Icon(Icons.dinner_dining),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            recipe.ingredients,
                            style: const TextStyle(
                              fontSize: 12,
                              color: primaryTextColor
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ),
            const SizedBox(width: 5),
            AspectRatio(
              aspectRatio: 0.75,
              child: Image.network(
                recipe.picture,
                fit: BoxFit.fill,
                alignment: Alignment.centerLeft,
              ),
            )
          ],
        ),
      ),
    );
  }
}
