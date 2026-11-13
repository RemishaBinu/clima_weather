import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clima_weather/app.dart';

void main() {
  testWidgets('ClimaApp dashboard renders correctly on standard screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0; // 390 x 844 logical pixels
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ClimaApp());

    expect(find.text('CLIMA'), findsOneWidget);
    expect(find.text('San Francisco, United States'), findsOneWidget);
    expect(find.text('Hourly Forecast'), findsOneWidget);
    expect(find.text('Weather Details'), findsOneWidget);
    expect(find.text('HUMIDITY'), findsOneWidget);
  });

  testWidgets('ClimaApp dashboard does not overflow on compact screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(640, 1136);
    tester.view.devicePixelRatio = 2.0; // 320 x 568 logical pixels
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ClimaApp());

    expect(find.text('CLIMA'), findsOneWidget);
    expect(find.text('San Francisco, United States'), findsOneWidget);
  });
}
