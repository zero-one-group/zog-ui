import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum ButtonGroupType {
  solid, // 'default' can not be used since this is a dart keyword
  outline,
  text,
  underline,
  ;

  Color get fillColor {
    switch (this) {
      case solid:
        return ZeroColors.primary;
      case outline:
        return ZeroColors.transparent;
      case text:
        return ZeroColors.transparent;
      case underline:
        return ZeroColors.transparent;
      default:
        return ZeroColors.primary;
    }
  }

  Color get selectedFillColor {
    switch (this) {
      case solid:
        return ZeroColors.primary[5];
      case outline:
        return ZeroColors.primary[2];
      case text:
        return ZeroColors.neutral[5];
      case underline:
        return ZeroColors.transparent;
      default:
        return ZeroColors.primary[1];
    }
  }

  Color get color {
    switch (this) {
      case solid:
        return ZeroColors.white;
      case outline:
        return ZeroColors.black;
      case text:
        return ZeroColors.black;
      case underline:
        return ZeroColors.black;
      default:
        return ZeroColors.primary;
    }
  }

  Color get selectedBorderColor {
    switch (this) {
      case solid:
        return ZeroColors.transparent;
      case outline:
        return ZeroColors.primary;
      case text:
        return ZeroColors.black;
      case underline:
        return ZeroColors.black;
      default:
        return ZeroColors.white;
    }
  }

  Color get selectedColor {
    switch (this) {
      case solid:
        return ZeroColors.white;
      case outline:
        return ZeroColors.primary;
      case text:
        return ZeroColors.black;
      case underline:
        return ZeroColors.primary;
      default:
        return ZeroColors.white;
    }
  }

  double get borderWidth {
    switch (this) {
      case solid:
        return 1;
      case outline:
        return 1;
      case text:
        return 0;
      case underline:
        return 0;
      default:
        return 1;
    }
  }

  bool get renderBorder {
    switch (this) {
      case solid:
        return true;
      case outline:
        return true;
      case text:
        return false;
      case underline:
        return false;
      default:
        return true;
    }
  }
}
