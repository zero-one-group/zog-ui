import 'package:flutter/material.dart';

class ZeroProgressIndicator {
  static Widget linear({
    Key? key,
    double? value,
    Color? backgroundColor,
    Animation<Color>? valueColor,
    double? strokeWidth,
    double? height,
    bool showValue = false,
    TextStyle? valueStyle,
    String? valueSuffix,
  }) {
    return LinearProgressIndicator(
      key: key,
      value: value,
      backgroundColor: backgroundColor,
      valueColor: valueColor,
      minHeight: height,
    );
  }

  static Widget circular({
    Key? key,
    double? value,
    Color? backgroundColor,
    Animation<Color>? valueColor,
    Color? color,
    double strokeWidth = 4.0,
  }) {
    return CircularProgressIndicator(
      key: key,
      value: value,
      backgroundColor: backgroundColor,
      color: color,
      valueColor: valueColor,
      strokeWidth: strokeWidth,
    );
  }
}
