
import 'package:flutter/material.dart';
import 'package:resumegenerator/features/generate_resume.dart/presentation/pages/home_page.dart';

// import 'package:riverpod/riverpod.dart';

void main() {
  runApp(MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
// // State Providers
// final fontSizeProvider = StateProvider<double>((ref) => 12);
// final fontColorProvider = StateProvider<Color>((ref) => Colors.black);
// final bgColorProvider = StateProvider<Color>((ref) => Colors.white);



