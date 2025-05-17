import 'dart:convert';
import 'package:recipe_app/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeServices {
  Future<List<Recipe>> getRecipe() async {
    const url = "https://dummyjson.com/recipes";
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {'Access-Control-Allow-Origin': '*'});

    if (response.statusCode == 200) {
      // final json = jsonDecode(response.body) as List;
      final List<dynamic>json = jsonDecode(response.body)['recipes'];
      print(json);

      final recipe = json.map((e) => Recipe.fromMap(e)).toList();
      return recipe;
    }
    throw "Something went wrong";
  }
}
