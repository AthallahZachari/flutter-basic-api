import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  /* const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

  req.query({
    limit: '24',
    start: '0'
  });

  req.headers({
    'X-RapidAPI-Key': 'd24cb90b35msh146b33081ee7150p1f1936jsnf2c1f8befb19',
    'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  }); */

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": '24', "start": '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd24cb90b35msh146b33081ee7150p1f1936jsnf2c1f8befb19',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for(var i in data['feed']){
      _temp.add(i['content']['details']);
    }
    return Recipe.recipeFromSnapshot(_temp);
  }
}
