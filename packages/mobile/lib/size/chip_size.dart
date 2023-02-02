import 'package:flutter/material.dart';

/// A list of [ZeroChipSize] variants
enum ZeroChipSize {
  /// The chip will be smaller
  small,

  /// The chip will be larger
  large;

  /// The padding of the label/content matches the size of the type
  EdgeInsetsGeometry contentPadding() {
    switch (this) {
      case small:
        return const EdgeInsets.symmetric(vertical: 1, horizontal: 6);
      case large:
        return const EdgeInsets.symmetric(vertical: 5, horizontal: 6);
    }
  }

  /// Get base padding of chip(top, left, right and bottom)
  EdgeInsetsGeometry basePadding() {
    return const EdgeInsets.all(4);
  }

  /// To retrieve the size of the icon/avatar according to the type of size
  double iconSize() {
    switch (this) {
      case small:
        return 16;
      case large:
        return 24;
    }
  }
}
