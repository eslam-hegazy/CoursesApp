import 'package:flutter/cupertino.dart';

TextStyle getTextStyle(
  double fontSize,
  FontWeight? fontWeight,
  String fontFamily,
  Color color,
  double? space,
) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    color: color,
    letterSpacing: space,
  );
}
