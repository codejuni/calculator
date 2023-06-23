import 'package:flutter/material.dart';

class AppColors {
  static Color _hexToColor(String hexColor) {
    String formattedColor = hexColor.replaceAll("#", "");
    int colorInt = int.parse(formattedColor, radix: 16);

    if (formattedColor.length == 6) {
      colorInt +=
          0xFF000000; // Agrega el canal alfa si no está presente en el código hexadecimal
    }

    return Color(colorInt);
  }

  static Color primaryColor = _hexToColor('FFC107');
  static Color? hint = Colors.grey[400];
  static Color? scaffold = _hexToColor('F8F8FF');
  static Color? dark = _hexToColor('263238');
  static Color? lightNightBlue = _hexToColor('000080');
  static Color? darkNightBlue = _hexToColor('191970');
}
