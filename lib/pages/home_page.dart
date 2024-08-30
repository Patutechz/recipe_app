import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/components/my_recipe_tile.dart';
import 'package:recipe_app/models/Recipe.dart';
import 'package:recipe_app/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Recipe> recipes = [];

  Future getRecipes() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/recipes"),
        headers: {'Access-Control-Allow-Origin': '*'});
    final jsonData = jsonDecode(response.body);

    for (final eachRecipe in jsonData["recipes"]) {
      final recipe = Recipe(
        id: eachRecipe['id'],
        name: eachRecipe['name'],
        image: eachRecipe['image'],
      );

      recipes.add(recipe);
    }
    print(jsonData);
    print(recipes.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(
          //         "Food Menu",
          //         style: TextStyle(
          //           fontSize: 18,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: FutureBuilder(
                future: getRecipes(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // return ListView.builder(
                    //     itemCount: recipes.length,
                    //     itemBuilder: (context, index) {
                    //       final recipe = recipes[index];
                    //       return ListTile(
                    //         leading: Image.network(recipe.image),
                    //         title: Text(recipe.name),
                    //         subtitle: Text(recipe.id.toString()),
                    //         onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           DetailPage(recipe: recipe),
                    //     ),
                    //   );
                    //         },
                    //       );
                    //     });
                    return GridView.builder(
                      itemCount: recipes.length,
                      padding: EdgeInsets.all(0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.4,
                      ),
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return MyRecipeTile(
                          recipeImagePath: recipe.image,
                          recipeName: recipe.name,
                          recipePrice: recipe.id.toString(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(recipe: recipe),
                              ),
                            );
                          },
                        );
                        // return ListTile(
                        //   leading: Image.network(recipe.image),
                        //   title: Text(recipe.name),
                        //   subtitle: Text(recipe.id.toString()),
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) =>
                        //             DetailPage(recipe: recipe),
                        //       ),
                        //     );
                        //   },
                        // );
                        // return Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) =>
                        //               DetailPage(recipe: recipe),
                        //         ),
                        //       );
                        //     },
                        //     child: Container(
                        //       padding: EdgeInsets.all(12),
                        //       decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(12),
                        //       ),
                        //       child: Column(
                        //         children: [
                        //           ClipRRect(
                        //             borderRadius: BorderRadius.circular(12),
                        //             child: Image.network(
                        //               recipe.image,
                        //               height: 200,
                        //             ),
                        //           ),
                        //           Column(
                        //             children: [
                        //             Text(recipe.name),
                        //             Text(recipe.id.toString())
                        //           ],)
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

// 'https://dummyjson.com/recipes'