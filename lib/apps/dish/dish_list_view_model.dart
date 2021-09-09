import 'dart:convert';
import 'package:test/test.dart' as unit_test;
import 'package:flutter_basics/resources/dish.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  unit_test.test('dishes.json has 4 items', () async {
    DishListViewModel viewModel = DishListViewModel();

    await viewModel.getData();

    unit_test.expect(viewModel.dishes.length, 4);
    unit_test.expect(viewModel.dishes, isA<List<Dish>>());
  });
}

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
