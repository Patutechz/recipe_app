
import 'package:flutter/material.dart';
import 'package:recipe_app/models/Recipe.dart';

class DetailPage extends StatelessWidget {
  final Recipe recipe;
  DetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(recipe.image),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(recipe.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
