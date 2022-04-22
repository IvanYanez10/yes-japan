import 'package:flutter/material.dart';
import 'package:yes_japan/screens/start/splash_screen.dart';
import 'package:yes_japan/theme/custom_theme.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const Splash(),
    );
  }
}