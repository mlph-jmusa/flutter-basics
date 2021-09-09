import 'dart:convert';
import 'package:flutter_basics/resources/dish.dart';
import 'package:flutter/services.dart';

class DishListViewModel {
  List<Dish> dishes = [];
  getData() async {
    String data = await rootBundle.loadString('lib/resources/dishes.json');

    var jsonData = jsonDecode(data);
    dishes = jsonData
        .map<Dish>((e) => Dish(
            e["name"],
            e["imageURL"],
            List<String>.from(e["ingredients"]),
            List<String>.from(e["cookingSteps"])))
        .toList();
  }
}
