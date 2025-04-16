import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triangle/app.dart';

void main() {
  testWidgets('renders CircularProgressIndicator', (tester) async {
    await tester.pumpWidget(const LittleSteps());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}