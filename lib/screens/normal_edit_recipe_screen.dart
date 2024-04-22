import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipestypes.dart';
import 'package:recipe_app/navigation_menu.dart';
import 'package:recipe_app/service/FirestoreService.dart';
import 'package:recipe_app/service/RecipeService.dart';

class NormalEditRecipeScreen extends StatefulWidget {
  final String? id;
  const NormalEditRecipeScreen({super.key, required this.id});

  @override
  State<NormalEditRecipeScreen> createState() => _NormalEditRecipeScreenState();
}

class _NormalEditRecipeScreenState extends State<NormalEditRecipeScreen> {
  _NormalEditRecipeScreenState(){
    _selectedVal = recipeType[0];
  }
  
  final RecipeService _recipeService = RecipeService();
  final FireStoreService _fireStoreRecipeService = FireStoreService(); 
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController ingredientsTextController = TextEditingController();
  final TextEditingController stepTextController = TextEditingController();
  final List<String> recipeType = ["Salad", "Snack", "Drink"];
  String _selectedVal = "";
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: const Text(
          "Add Recipe",
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child:  Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.file_copy),
                      onPressed: () async {
                        await pickImage();
                      },
                    ),
                    const Text('Choose From Gallery'),
                    _selectedImage != null ? Image.file(_selectedImage!) : Text("No Image Selected"),
                    TextFormField(
                      controller: nameTextController,
                      validator: (content) => 
                        content == null || content.isEmpty
                        ? 'Enter something. Don\'t be shy'
                        : null,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        label: Text("Name"), prefixIcon: Icon(Icons.book)
                      ),
                    ),
                    const SizedBox(height: 30),
                    DropdownButtonFormField(
                      value: _selectedVal,
                      items: recipeType.map(
                        (e) => DropdownMenuItem(child: Text(e), value: e)
                      ).toList(), 
                      onChanged: (val) {
                        setState(() {
                          _selectedVal = val!;
                        });
                      },
                    ),
                    TextFormField(
                      controller: ingredientsTextController,
                      validator: (content) => 
                        content == null || content.isEmpty
                        ? 'Enter something. Don\'t be shy'
                        : null,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        label: Text("Ingredients"), prefixIcon: Icon(Icons.book)
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: stepTextController,
                      validator: (content) => 
                        content == null || content.isEmpty
                        ? 'Enter something. Don\'t be shy'
                        : null,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        label: Text("Step"), prefixIcon: Icon(Icons.book)
                      ),
                    ),
                    const SizedBox(height: 30),

                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            String name = nameTextController.text;
                            String type = _selectedVal;
                            String ingredients = ingredientsTextController.text;
                            String step = stepTextController.text;
                            RecipesTypes recipe = RecipesTypes(id: widget.id, name: name, type: type, picture: "Super_Sundae.jpg", ingredients: ingredients, steps: step);
                            _fireStoreRecipeService.updateRecipe(widget.id!, recipe, _selectedImage!);
                            _formKey.currentState!.reset();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => NavigationMenu(),
                              ),
                              (route) => false
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[200],
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Edit Recipe", style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}