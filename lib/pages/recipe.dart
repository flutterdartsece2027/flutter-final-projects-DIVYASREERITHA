import 'package:flutter/material.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/pasta.jpg",
            width: MediaQuery.of(context).size.width,
            height: 400,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 360), // Instead of using width/1.1
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Creamy Pasta",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    "About Recipe",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Red Sauce Pasta is a classic Italian-inspired dish made by cooking "
                        "pasta—usually penne or spaghetti—until al dente and setting it aside. "
                        "In a separate pan, heat olive oil and sauté finely chopped garlic and onions "
                        "until golden brown. Add pureed or finely chopped tomatoes, followed by salt, "
                        "black pepper, red chili flakes, and mixed herbs like oregano and basil. Let the "
                        "sauce simmer for 10–15 minutes until it thickens and the oil starts separating. "
                        "For extra flavor and richness, a spoonful of tomato ketchup or a dash of cream can "
                        "be added. Once the sauce is ready, toss in the cooked pasta and mix well until it's "
                        "fully coated. Optionally, stir in some grated cheese for a creamy texture. Garnish "
                        "with fresh coriander or parsley and serve hot with garlic bread or a side salad. It's "
                        "a simple, hearty, and delicious meal perfect for any time of the day.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}