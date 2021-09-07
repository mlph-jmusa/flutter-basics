import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basics/resources/dish.dart';

import 'dishDetails.dart';

class DishesList extends StatefulWidget {
  const DishesList({Key? key}) : super(key: key);

  @override
  _DishesListState createState() => _DishesListState();
}

class _DishesListState extends State<DishesList> {
  List<Dish> dishes = [];

  getData() async {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
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
                    itemCount: dishes.length,
                    itemBuilder: (context, row) {
                      return GestureDetector(
                          child: Text(dishes[row].name),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DishDetails(dish: dishes[row])));
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
