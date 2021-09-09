import 'package:flutter_basics/resources/dish.dart';

class DishDetailsViewModel {
  final Dish _dish;

  DishDetailsViewModel(this._dish);
  // Data Transformations

  String nameOfDish() {
    return _dish.name;
  }

  String imageURLOfDish() {
    return _dish.imageURL;
  }

  String ingredientsOfDish() {
    return _dish.ingredients.join("\n");
  }

  String cookingStepsOfDish() {
    return _dish.cookingSteps.join("\n");
  }
}
