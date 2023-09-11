import 'package:flutter/material.dart';

class RocoTheme {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: Theme.of(context)
          .colorScheme
          .copyWith(
        primary: Colors.red
      )
    );
  }
}