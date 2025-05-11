import 'package:flutter/material.dart';
import 'package:recipe_app/providers/recipe_provider.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => RecipeProvider()..init(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        // 'https://dummyjson.com/recipes'
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}