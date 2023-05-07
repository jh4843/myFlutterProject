import 'package:flutter/material.dart';
import 'package:podomoro/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(
          color: Color(0xFF232B55),
        )),
        cardColor: const Color(0xFFF4EDDB),
        scaffoldBackgroundColor: const Color(0xFFE7626C),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      ),
      home: const HomeScreen(),
    );
  }
}
