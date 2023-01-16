import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';

enum ButtonGroupType {
  solid, // 'default' can not be used since this is a dart keyword
  outline,
  text,
  underline,
  ;

  Color get fillColor {
    switch (this) {
      case solid:
        return ZeroColors.primary6;
      case outline:
        return ZeroColors.transparent;
      case text:
        return ZeroColors.transparent;
      case underline:
        return ZeroColors.transparent;
      default:
        return ZeroColors.primary6;
    }
  }

  Color get selectedFillColor {
    switch (this) {
      case solid:
        return ZeroColors.primary5;
      case outline:
        return ZeroColors.primary2;
      case text:
        return ZeroColors.neutral5;
      case underline:
        return ZeroColors.transparent;
      default:
        return ZeroColors.primary1;
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
        return ZeroColors.primary6;
    }
  }

  Color get selectedBorderColor {
    switch (this) {
      case solid:
        return ZeroColors.transparent;
      case outline:
        return ZeroColors.primary6;
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
        return ZeroColors.primary6;
      case text:
        return ZeroColors.black;
      case underline:
        return ZeroColors.primary6;
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
