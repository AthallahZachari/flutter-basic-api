import 'package:api/models/recipe.api.dart';
import 'package:api/views/widgets/recipe_card.dart';
import 'package:api/models/recipe.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Recipe> _recipes = [];
  bool isLoadin = true;

  @override
  void initState(){
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async{
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      isLoadin = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Food Recipe')
          ],
        ),
      ),
      body: isLoadin 
        ? Center(child: CircularProgressIndicator()) 
        : ListView.builder(
            itemCount: _recipes.length,
            itemBuilder: (context, index){
              return RecipeCard(
                title: _recipes[index].name, 
                cookTime: _recipes[index].totalTime, 
                rating: _recipes[index].rating.toString(), 
                thumbnailUrl: _recipes[index].images
              );
            },
        ),
    );
  }
}
