import 'package:flutter/material.dart';

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
