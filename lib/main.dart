import 'package:flutter/material.dart';
import 'package:recipe/pages/add_recipe.dart';
import 'package:recipe/pages/home.dart';
import 'package:recipe/pages/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AddRecipe(),
    );
  }
}
