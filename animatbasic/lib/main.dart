import 'package:flutter/material.dart';
import './pages/Home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimateBasic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 79, 3, 211)),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}
