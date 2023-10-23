import 'package:flutter/material.dart';
import 'package:internet_connection_checker/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Connctivity ',
      home: HomePageScreen(),
    );
  }
}
