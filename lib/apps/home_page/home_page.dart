import 'package:flutter/material.dart';
import 'package:flutter_basics/apps/dish/image_container.dart';
import '../dish/dishes_list.dart';

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
