import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimePickerStyle with Diagnosticable {
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? pickerHeaderColor;

  const TimePickerStyle({
    this.borderRadius,
    this.backgroundColor,
    this.pickerHeaderColor,
  });
}
