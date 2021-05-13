import 'dart:math';

import 'package:flutter/material.dart';

/// Class that contains all the main app colors
class WCColors {
  WCColors._();

  static Color get primary => const Color(0xffFE7D8A);
  static Color get extraLightText => const Color(0xffFFFFFF);
  static Color get lightText => const Color(0xffACACAC);
  static Color get text => const Color(0xff3E3E3E);
  static Color get title => const Color(0xff7F3E45);
  static Color get appBarColor => const Color(0xffE188C2);
  static Color get facebookColor => const Color(0xff3A569B);
  static Color get errorColor => const Color(0xffE8431F);
  static Color get bgColor => const Color(0xfff5f8fa);

  static Color get primaryShadeOne => const Color(0xffFFCED3);
  static Color get primaryShadeTwo => const Color(0xffFE9EA7);

  static MaterialColor get primaryTheme => generateMaterialColor(primary);

  static Color get greyBlue => const Color(0xffF5F4F8);
  static Color get lightPurple => const Color(0xff97AFF3);
  static Color get darkYellow => const Color(0xffFEC106);
  static Color get softGreyText => Colors.grey[700];
  static Color get lightOrange => const Color(0xffF28E1A);
  static Color get darkGrey => const Color(0xff484A54);

  static Color get blue => Colors.blue;
  static Color get orange => Colors.orange;
  static Color get red => Colors.red;
  static Color get purple => Colors.purpleAccent;
  static Color get blueGrey => Colors.blueGrey;

  static Color getColor(int index) {
    final colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.green,
      Colors.greenAccent,
      Colors.amber,
      Colors.orange,
      Colors.blue[900],
      Colors.lightGreen,
      Colors.lightBlue,
      Colors.yellow[700],
      Colors.teal,
      Colors.tealAccent,
      Colors.redAccent,
      Colors.red
    ];

    if (index > colors.length) {
      Random random = Random();
      int indexMaterial = random.nextInt(Colors.primaries.length - 1);
      return Colors.primaries[indexMaterial];
    }
    return colors[index];
  }

  static List<Color> getColorGradient(int index) {
    final colors = [
      [Colors.red, Colors.red[300]],
      [Colors.pink, Colors.pink[300]],
      [Colors.purple, Colors.purple[300]],
      [Colors.deepPurple, Colors.deepPurple[300]],
      [Colors.indigo, Colors.indigo[300]],
      [Colors.blue, Colors.blue[300]],
      [Colors.green, Colors.green[300]],
      [Colors.greenAccent, Colors.greenAccent[700]],
      [Colors.amber, Colors.amber[300]],
      [Colors.orange, Colors.orange[300]],
      [Colors.blue[900], Colors.blue[300]],
      [Colors.lightGreen, Colors.lightGreen[300]],
      [Colors.lightBlue, Colors.lightBlue[300]],
      [Colors.yellow[700], Colors.yellow[300]],
      [Colors.teal, Colors.teal[300]],
      [Colors.tealAccent, Colors.tealAccent[400]],
      [Colors.redAccent, Colors.redAccent[700]],
      [Colors.red, Colors.red[800]]
    ];

    if (index > colors.length) {
      Random random = Random();
      int indexMaterial = random.nextInt(Colors.primaries.length - 1);
      return [Colors.primaries[indexMaterial], Colors.primaries[indexMaterial]];
    }
    return colors[index];
  }

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
