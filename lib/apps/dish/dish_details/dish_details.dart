// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basics/apps/dish/dish_details/dish_details_view_model.dart';

class DishDetails extends StatelessWidget {
  final DishDetailsViewModel viewModel;

  const DishDetails({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.nameOfDish())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(viewModel.imageURLOfDish(),
                  height: 250,
                  errorBuilder: ((context, exception, stackTrace) =>
                      const Text("Wrong image URL"))),
              Container(height: 20),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Ingredients:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              Container(height: 5),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(viewModel.ingredientsOfDish())),
              Container(height: 20),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Cooking steps:",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              Container(height: 5),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(viewModel.cookingStepsOfDish())),
            ],
          ),
        ),
      ),
    );
  }
}
