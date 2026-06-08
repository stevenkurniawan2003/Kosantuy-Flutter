import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const KosantuyApp());
}

class KosantuyApp extends StatelessWidget {
  const KosantuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kosantuy',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}