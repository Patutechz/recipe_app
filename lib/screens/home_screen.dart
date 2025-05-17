import 'package:flutter/material.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/screens/detail_screen.dart';
import 'package:recipe_app/shared/recipe_card.dart';
import 'package:provider/provider.dart';

import 'package:recipe_app/models/recipe_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text(
              "Recipe App",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context, notifier, child) {
          if (notifier.loading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepOrange.shade300,
              ),
            );
          } else if (notifier.recipe.isEmpty) {
            return const Center(child: Text("No Recipe"));
          } else {
            return ListView.builder(
              itemCount: notifier.recipe.length,
              itemBuilder: (context, index) {
                Recipe recipes = notifier.recipe[index];
                return RecipeCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(recipe: recipes),
                        ),
                      );
                    },
                    title: recipes.name,
                    rating: recipes.rating.toString(),
                    cookTime: recipes.cookTimeMinutes.toString(),
                    thumbnailUrl: recipes.image);
              },
            );
          }
        },
      ),
    );
  }
}
