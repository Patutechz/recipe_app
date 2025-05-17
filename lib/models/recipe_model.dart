import 'dart:convert';

Recipe recipeFromMap(String str) => Recipe.fromMap(json.decode(str));

String recipeToMap(Recipe data) => json.encode(data.toMap());

class Recipe {
  final int id;
  final String name;
  final String image;
  final List ingredients;
  final List instructions;
  final int cookTimeMinutes;
  final num rating;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.cookTimeMinutes,
    required this.rating,
  });

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        ingredients: json["ingredients"] as List,
        instructions: json["instructions"] as List,
        cookTimeMinutes: json["cookTimeMinutes"],
        rating: json["rating"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "ingredients": ingredients,
        "instructions": instructions,
        "cookTimeMinutes": cookTimeMinutes,
        "rating": rating,
      };
}




// "https://dummyjson.com/recipes"