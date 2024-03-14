import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Page"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("SCORE : 0"),
          ),
        ],
      ),
      body: Expanded(
        flex: 5,
        child: Column(
          children: [
            Transform.scale(
              scale: 1,
              child: const CircularProgressIndicator(),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(onPressed: () {}),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(onPressed: () {}),
                          FloatingActionButton(onPressed: () {}),
                        ],
                      ),
                      FloatingActionButton(onPressed: () {}),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Stop"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Reset"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
