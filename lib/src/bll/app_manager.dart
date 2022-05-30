import 'package:flutter/material.dart';

class AppManager {
  static final backgroundColor = Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 38, 70, 75),
        ],
      ),
    ),
  );

  static const colorRose = Color.fromARGB(255, 252, 222, 190);

  static const colorGreen = Color.fromARGB(255, 71, 120, 120);

  static const colorDarkGreen = Color.fromARGB(255, 31, 65, 69);

  static const colorOrange = Color.fromARGB(255, 241, 153, 55);

  static const colorContainer = Color.fromARGB(255, 38, 70, 75);

  static const colorTextContainer = Color.fromARGB(255, 79, 133, 132);

  static const colorGreenFluo = Color.fromARGB(255, 29, 211, 176);

  static const colorTextOrange = Color.fromARGB(255, 220, 150, 90);
}
