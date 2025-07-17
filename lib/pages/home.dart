import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){}, child: Icon(Icons.add,color: Colors.white,),),
      body: Container(
        margin:  EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Padding(
              padding:  EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text(
                    "Looking for your\nfavorite meal",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/boy.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Search Bar
            Container(
              padding: EdgeInsets.only(left: 10.0),
              margin:  EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                color:  Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search_outlined),
                  hintText: "Search Recipe...",
                ),
              ),
            ),

            SizedBox(height: 20.0),

            // Horizontally scrollable recipe list
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  recipeCard("images/soup.jpg", "Soup Recipes"),
                  recipeCard("images/chinese.jpg", "Chinese Recipes"),
                  recipeCard("images/indian.jpg", "Indian Recipes"),
                  recipeCard("images/maincourse.jpg", "Maincourse Recipes"),
                ],
              ),
            ),

            SizedBox(height: 20.0),

            // Expanded vertical section (can scroll)
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin:  EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/burger.jpg",
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Special Burger",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "images/pasta.jpg",
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Creamy Pasta",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper widget to clean repeated card code
  Widget recipeCard(String imagePath, String title) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            title,
            style:  TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}