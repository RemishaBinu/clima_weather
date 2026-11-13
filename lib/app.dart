import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/weather/screens/home_screen.dart';

/// Root application widget configuring global theme and initial screen.
class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Weather',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
