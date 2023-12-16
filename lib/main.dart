import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MovingButton()),
    );
  }
}

class MovingButton extends StatefulWidget {
  const MovingButton({super.key});

  @override
  State<MovingButton> createState() => _MovingButtonState();
}

class _MovingButtonState extends State<MovingButton> {
  Random random = Random();
  int count = 0;

  double x = 0;
  double y = 0;
  int yMax = 690;
  int xMax = 336;

  void changePosition() {
    setState(() {
      x = random.nextInt(xMax + 1).toDouble();
      y = random.nextInt(yMax + 1).toDouble();
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Moving Button",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: x,
            top: y,
            child: IconButton(
              onPressed: () {
                changePosition();
              },
              icon: const Icon(Icons.add_box),
              iconSize: 60.0,
              highlightColor: Colors.transparent
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                "Count: $count",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
