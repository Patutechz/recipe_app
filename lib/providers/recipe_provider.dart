import 'package:flutter/material.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeServices _recipeServices = RecipeServices();
  bool _loading = false;
  bool get loading => _loading;

  enableLoading() {
    _loading = true;
    notifyListeners();
  }

  disableLoading() {
    _loading = false;
    notifyListeners();
  }

  List<Recipe> _recipe = [];
  List<Recipe> get recipe => _recipe;

  Future<void> getAllRecipe() async {
    //Loading starts
    enableLoading();

    //Loads the recipe
    _recipe = await _recipeServices.getRecipe();
    notifyListeners();

    //finally disable loading after recipe loaded
    disableLoading();
  }

  init() {
    getAllRecipe();
    notifyListeners();
  }
}
