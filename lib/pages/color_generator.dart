import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator extends StatefulWidget {
  const ColorGenerator({super.key});

  @override
  State<ColorGenerator> createState() => _ColorGeneratorState();
}

class _ColorGeneratorState extends State<ColorGenerator> {
  List<Color> colorsList = [
    Colors.white,
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.pink,
    Colors.grey,
    Colors.blue,
    Colors.indigo,
    Colors.blueAccent,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.cyan,
    Colors.lime,
    Colors.orange,
    Colors.teal,
    Colors.tealAccent
  ];
  List<String> colorNameList = [
    "White",
    "Green",
    "Amber",
    "Red",
    "Pink",
    "Grey",
    "Blue",
    "Indigo",
    "Blue Accent",
    "Blue Grey",
    "Light Blue",
    "Cyan Lime",
    "Orange",
    "Teal",
    "Teal Accent"
  ];
  int i = 0;
  colorGenerator(int rand) {
    Color color = colorsList[i + rand < colorsList.length ? i + rand : 0];
    return color;
  }

  nameGenerator(int rand) {
    String name = colorNameList[i + rand < colorNameList.length ? i + rand : 0];
    return name;
  }

  actionButtonColorGenerator() {
    Color color = colorsList[i != colorsList.length - 1 ? i + 1 : 0];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGenerator(0),
      floatingActionButton: FloatingActionButton(
        backgroundColor: actionButtonColorGenerator(),
        onPressed: () {
          setState(
            () {
              i = Random().nextInt(colorsList.length);
            },
          );
        },
        child: Icon(
          Icons.repeat,
          color: colorGenerator(0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorsCard(
            color: colorGenerator(1),
            name: nameGenerator(1),
          ),
          ColorsCard(
            color: colorGenerator(2),
            name: nameGenerator(2),
          ),
          ColorsCard(
            color: colorGenerator(3),
            name: nameGenerator(3),
          ),
        ],
      ),
    );
  }
}

class ColorsCard extends StatelessWidget {
  const ColorsCard({
    super.key,
    required this.color,
    required this.name,
  });

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Text(
        name.toString().replaceAll(
              "MaterialColor(primary value: ",
              "",
            ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
