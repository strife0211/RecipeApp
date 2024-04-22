import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class FireStoreService {
  CollectionReference recipesCollection = FirebaseFirestore.instance.collection("Recipes");

  //Create recipe
  Future<void> addRecipe(RecipesTypes recipe, File _selectedImage) async {
    String pic = await uploadImageToFirebase(_selectedImage);

    await recipesCollection.add({
      "name" : recipe.name,
      "type" : recipe.type,
      "pic" : pic,
      "ingredients" : recipe.ingredients,
      "steps" : recipe.steps,
    }).then((value) => print("Recipe ${value.id} is created"))
    .catchError((error) => print("Failed to create recipe: $error"));
  }

  //Get recipe list
  Stream<QuerySnapshot> getRecipeList() {
    final recipeStream = recipesCollection.orderBy("name").snapshots();
    return recipeStream;
  }

  //Get recipe list according to the recipe type
  Stream<QuerySnapshot> getRecipeListByType(String type) {
    final recipeStream = recipesCollection.orderBy("name").where('type', isEqualTo: type).snapshots();
    return recipeStream;
  }

  //Update recipe
  Future<void> updateRecipe(String docID, RecipesTypes recipe, File _selectedImage) async {
    String pic = await uploadImageToFirebase(_selectedImage);

    await recipesCollection.doc(docID).update({
      "name" : recipe.name,
      "type" : recipe.type,
      "pic" : pic,
      "ingredients" : recipe.ingredients,
      "steps" : recipe.steps,
    }).then((value) => print("Recipe ${docID} is updated"))
    .catchError((error) => print("Failed to update recipe: $error"));
  }

  //Delete Recipe
  Future<void> deleteRecipe(String docID) async {
    await recipesCollection.doc(docID).delete();
  }

  //Upload Image
  Future<String> uploadImageToFirebase (File image) async {
    final fileName = basename(image.path);
    final destination = 'FoodPic/$fileName';
    UploadTask? task = await uploadFile(destination, image);
    final snapshot = await task!.whenComplete(() {});
    final urlDownload = snapshot.ref.getDownloadURL();
    return urlDownload;
  }

  static Future<UploadTask?> uploadFile(String destination, File file) async {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}