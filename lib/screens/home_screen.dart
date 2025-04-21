import 'package:flutter/material.dart';
import 'package:recipe_app/shared/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.grey.shade50,
        // elevation: 4,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text("Food Recipe App")
          ],
        ),
      ),
      body: ListView(
        children: [
          RecipeCard(
              title: "My Recipe Title",
              rating: "3",
              cookTime: "4",
              thumbnailUrl: "lib/images/pizza.jpg"),

                    RecipeCard(
              title: "My Recipe Title",
              rating: "3",
              cookTime: "4",
              thumbnailUrl: "lib/images/pizza.jpg"),


                        RecipeCard(
              title: "My Recipe Title",
              rating: "3",
              cookTime: "4",
              thumbnailUrl: "lib/images/pizza.jpg"),


                        RecipeCard(
              title: "My Recipe Title",
              rating: "3",
              cookTime: "4",
              thumbnailUrl: "lib/images/pizza.jpg"),


                        RecipeCard(
              title: "My Recipe Title",
              rating: "3",
              cookTime: "4",
              thumbnailUrl: "lib/images/pizza.jpg"),
        ],
      ),
    );
  }
}
