import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipestypes.dart';

class RecipeCardComponent extends StatelessWidget {
  final RecipesTypes recipe;
  const RecipeCardComponent({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Spacer(),
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryTextColor
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    recipe.type,
                    style: const TextStyle(
                      color: primaryTextColor
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(Icons.dinner_dining),
                      SizedBox(width: 10),
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
                  Spacer(),
                ],
              ),
            )
          ),
          SizedBox(width: 5),
          AspectRatio(
            aspectRatio: 0.75,
            child: Image.asset(
              recipe.picture,
              fit: BoxFit.fill,
              alignment: Alignment.centerLeft,
            ),
          )
        ],
      ),
    );
  }
}
