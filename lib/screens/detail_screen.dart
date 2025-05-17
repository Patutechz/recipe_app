import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Screen",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Image.network(
                  recipe.image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.deepOrange.shade300),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          recipe.rating.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.schedule, color: Colors.deepOrange.shade300),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          recipe.cookTimeMinutes.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  recipe.name,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      recipe.ingredients.join("\n"),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                        height: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Instructions",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  recipe.instructions.join(
                    " ",
                  ),
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    height: 2,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
