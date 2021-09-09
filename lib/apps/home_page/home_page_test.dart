import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'home_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('MyHomePage has a title', (WidgetTester tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(
          const MaterialApp(home: MyHomePage(title: 'Flutter Basics')));

      expect(find.text('Flutter Basics'), findsOneWidget);
    });
  });

  testWidgets('ScrollView should be present', (WidgetTester tester) async {
    const scrollViewWidget = SingleChildScrollView(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: scrollViewWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(scrollViewWidget), findsOneWidget);
  });
}
