import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basics/resources/dish.dart';
import 'package:test/test.dart' as unit_test;
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter value should be incremented',
      (WidgetTester tester) async {
    final dishListViewModel = DishListViewModel();

    await tester.pumpWidget(Builder(builder: (context) {
      dishListViewModel.getData(context);

      unit_test.expect(dishListViewModel.dishes.length, 4);

      return const Placeholder();
    }));
  });
}

class DishListViewModel {
  List<Dish> dishes = [];

  getData(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("lib/resources/dishes.json");

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
