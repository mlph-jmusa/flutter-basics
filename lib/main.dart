import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basics/dish.dart';
import 'dishDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Basics'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const ImageContainer(),
                  Container(height: 40),
                  const DishesList()
                ],
              ),
            ),
          ),
        ));
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
        width: screenSize.width * 0.9,
        height: screenSize.width * 0.55,
        decoration:
            const BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue),
        child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYQhwSIg7wQ5_eL32Ynqkm1ac-RZEMv7FwZA&usqp=CAU',
            fit: BoxFit.fill));
  }
}

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
