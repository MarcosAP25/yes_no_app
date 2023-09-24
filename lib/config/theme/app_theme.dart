
import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorThemes =[ 
  _customColor,
  Colors.orange,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.green,
  Colors.teal,
];
class AppTheme{

  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    :assert(selectedColor >=0 && selectedColor <= _colorThemes.length -1,
      'El color selecconado debe estar entre 0 y ${_colorThemes.length -1}' );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}