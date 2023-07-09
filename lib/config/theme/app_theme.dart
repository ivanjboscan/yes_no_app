import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF6200FF);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.grey
];

class AppTheme {
  final int selectedColor;
  final Brightness modeScreen;

  AppTheme({this.modeScreen = Brightness.light, this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'selectedColor debe ser entre 0 y ${_colorThemes.length - 1}');

  ThemeData theme(int index) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[index],
      brightness: modeScreen,
    );
  }
}
