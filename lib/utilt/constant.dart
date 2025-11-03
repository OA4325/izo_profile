import 'dart:io';
import 'package:flutter/material.dart';


class ConstantApp {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getTextSize(BuildContext context) {
    return ConstantApp.isTab(context)
        ? MediaQuery.of(context).size.height / MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height;
  }

  static TextStyle getTextStyle({
    required BuildContext context,
    Color? color,
    double size = 10,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color ?? Colors.green,
      fontSize: getTextSize(context) * size,
      fontFamily: "bah",
      fontWeight: fontWeight,
      decorationColor: Colors.green,
    );
  }

  static String capitalizeFirstLetter(String input) {
    List<String> words = input.split(' ');
    List<String> capitalizedWords = words.map((word) {
      if (word.isNotEmpty) {
        return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
      } else {
        return word;
      }
    }).toList();
    return capitalizedWords.join(' ');
  }

  static Future<dynamic> showNoteDialog(String note, BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(note),
          );
        });
  }

  static bool isTab(BuildContext context) {
    if (!Platform.isWindows && MediaQuery.of(context).size.width <= 800) {
      return true;
    }
    return false;
  }

  static Map<dynamic, dynamic> sortMapByKey(Map<dynamic, dynamic> map) {
    List<MapEntry<dynamic, dynamic>> sortedEntries = map.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    return Map.fromEntries(sortedEntries);
  }

  static String roundDoubleToInt({required double num}) {
    return num.toStringAsFixed(2).endsWith('.00')
        ? num.toStringAsFixed(2).replaceAll('.00', '')
        : num.toStringAsFixed(2);
  }
}
