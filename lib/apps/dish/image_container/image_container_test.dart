import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'image_container.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Image container has image', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MaterialApp(home: ImageContainer()));

      Finder imageWidget = find.byWidget(Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYQhwSIg7wQ5_eL32Ynqkm1ac-RZEMv7FwZA&usqp=CAU'));

      expect(imageWidget, findsOneWidget);
    });
  });
}
