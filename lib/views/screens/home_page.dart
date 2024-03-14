import 'package:clock_app_pr/components/button_row.dart';
import 'package:clock_app_pr/views/screens/clock_app.dart';
import 'package:clock_app_pr/views/screens/game_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("clock app"),
              accountEmail: Text("clockapp@gmail.com"),
            ),
            buttonRow(
              btnName: "clock",
              button: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('clock_page');
                  setState(() {});
                },
                child: const Text("clock"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.white,
        title: const Text("Clock App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('AlarmPage');
              setState(() {});
            },
            icon: const Icon(Icons.alarm),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              "Clock App ",
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
