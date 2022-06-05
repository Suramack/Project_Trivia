import 'package:flutter/material.dart';
import 'package:project_trivia/screens/01_home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trivia',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}
