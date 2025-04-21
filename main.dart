import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(RandomUserApp());
}

class RandomUserApp extends StatelessWidget {
  const RandomUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
