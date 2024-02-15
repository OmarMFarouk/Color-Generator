import 'package:flutter/material.dart';

import '../pages/color_generator.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ColorGenerator(),
    );
  }
}
