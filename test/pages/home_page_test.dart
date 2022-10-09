import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/pages/home_page.dart';

void main() {
  group('Home page test', () {
    testWidgets('Show first product name after each click',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.text(product[0].name), findsOneWidget);

      await tester.tap(find.text('Check'));
      await tester.pump();

      expect(find.text(product[1].name), findsOneWidget);
      await tester.tap(find.text('Check'));
      await tester.pump();

      expect(find.text(product[2].name), findsOneWidget);
      await tester.tap(find.text('Check'));
      await tester.pump();
      expect(find.text(product[3].name), findsOneWidget);
    });
  });
}
