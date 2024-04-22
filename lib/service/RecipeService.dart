import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:xml/xml.dart' as xml;
import 'package:flutter/services.dart' show rootBundle;

class RecipeService {
  final List<RecipesTypes> _recipes = [];
  
  late RecipesTypes recipeData;
  File? selectedFile;
  late Widget childWidget = Image.network(recipeData.picture);

  // Load recipes from XML
  Future<void> loadRecipes() async {
    String xmlString = await _loadXMLFromAssets();
    final document = xml.XmlDocument.parse(xmlString);
    final recipes = document.findAllElements('recipe');

    _recipes.clear();

    for (var recipe in recipes) {
      String name = recipe.findElements('name').single.text;
      String type = recipe.findElements('type').single.text;
      String picture = recipe.findElements('picture').single.text;
      String ingredients = recipe.findElements('ingredients').single.text;
      String steps = recipe.findElements('steps').single.text;

      _recipes.add(RecipesTypes(name: name, type: type, picture: picture, ingredients: ingredients, steps: steps));
    }
  }

  // Get all recipes
  List<RecipesTypes> get recipes => List<RecipesTypes>.from(_recipes);

  // Get a recipe by Type
  List<RecipesTypes> getRecipeByType(String type) {
    return _recipes.where((recipe) => recipe.type == type
    // , orElse: () => null
    ).toList();
  }

  // Load XML from assets
  Future<String> _loadXMLFromAssets() async {
    return await rootBundle.loadString('assets/data/recipestypes.xml');
  }

}