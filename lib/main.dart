import 'package:clock_app_pr/views/screens/alarm_page.dart';
import 'package:clock_app_pr/views/screens/clock_app.dart';
import 'package:clock_app_pr/views/screens/game_page.dart';
import 'package:clock_app_pr/views/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.amberAccent,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'clock_page': (context) => const ClockApp(),
        'game_Page': (context) => const GamePage(),
        'alarm_Page': (context) => const AlarmPage(),
      },
    );
  }
}
