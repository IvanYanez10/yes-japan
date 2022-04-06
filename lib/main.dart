import 'package:flutter/material.dart';
import 'package:yes_japan/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),

    );
  }
}

/*
routes: {
        '/splash': (ctx) => const Splash(),
        '/home': (ctx) => const Home(),
        '/slider': (ctx) => const Slider(),
      },
 */