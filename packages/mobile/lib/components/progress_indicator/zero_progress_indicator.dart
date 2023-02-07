import 'package:flutter/material.dart';

/// [ZeroProgressIndicator] is a widget that shows a progress indicator which is similar to [LinearProgressIndicator] and [CircularProgressIndicator].
/// this widget have two types of progress indicator which is [linear] and [circular].
///
/// [linear] is a widget that shows a progress indicator in a horizontal line.
/// [circular] is a widget that shows a progress indicator in a circle.
class ZeroProgressIndicator {
  static Widget linear({
    Key? key,
    double? value,
    Color? backgroundColor,
    Color? valueColor,
    double height = 4.0,
  }) {
    return LinearProgressIndicator(
      key: key,
      value: value,
      backgroundColor: backgroundColor,
      valueColor: valueColor == null ? null : AlwaysStoppedAnimation<Color>(valueColor),
      minHeight: height,
    );
  }

  static Widget circular({
    Key? key,
    double? value,
    Color? backgroundColor,
    Color? valueColor,
    double strokeWidth = 4.0,
  }) {
    return CircularProgressIndicator(
      key: key,
      value: value,
      backgroundColor: backgroundColor,
      valueColor: valueColor == null ? null : AlwaysStoppedAnimation<Color>(valueColor),
      strokeWidth: strokeWidth,
    );
  }
}
