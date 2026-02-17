import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TaalumApp());
}

class TaalumApp extends StatelessWidget {
  const TaalumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taalum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
