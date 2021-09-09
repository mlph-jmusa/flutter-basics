import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basics/apps/dish/dish_list_view_model.dart';
import 'package:flutter_basics/resources/dish.dart';

import 'dishDetails.dart';

class DishesList extends StatefulWidget {
  const DishesList({Key? key}) : super(key: key);

  @override
  _DishesListState createState() => _DishesListState();
}

class _DishesListState extends State<DishesList> {
  DishListViewModel viewModel = DishListViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.getData(context),
        builder: (context, snapshot) => Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Dishes List',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(height: 10),
                  ListView.separated(
                    itemCount: viewModel.dishes.length,
                    itemBuilder: (context, row) {
                      return GestureDetector(
                          child: Text(viewModel.dishes[row].name),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DishDetails(
                                        dish: viewModel.dishes[row])));
                          });
                    },
                    separatorBuilder: (context, row) {
                      return Container(height: 20);
                    },
                    shrinkWrap: true,
                  )
                ],
              ),
            ));
  }
}
