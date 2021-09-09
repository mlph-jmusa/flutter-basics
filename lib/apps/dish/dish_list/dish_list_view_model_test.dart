import 'package:flutter_basics/resources/dish.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart' as unit_test;

import 'dish_list_view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  unit_test.test('dishes.json has 4 items', () async {
    DishListViewModel viewModel = DishListViewModel();

    await viewModel.getData();

    unit_test.expect(viewModel.dishes.length, 4);
    unit_test.expect(viewModel.dishes, isA<List<Dish>>());
  });
}
