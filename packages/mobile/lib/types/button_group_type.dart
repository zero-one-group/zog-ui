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
        return ZeroColors.primary;
      case outline:
        return ZeroColors.primary.withAlpha(50);
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
        return ZeroColors.white.withAlpha(50);
      case outline:
        return ZeroColors.primary.withAlpha(50);
      case text:
        return ZeroColors.grey.withAlpha(50);
      case underline:
        return ZeroColors.transparent;
      default:
        return ZeroColors.primary;
    }
  }

  Color get color {
    switch (this) {
      case solid:
        return ZeroColors.white;
      case outline:
        return ZeroColors.dark;
      case text:
        return ZeroColors.dark;
      case underline:
        return ZeroColors.dark;
      default:
        return ZeroColors.primary;
    }
  }

  Color get borderBorderColor {
    switch (this) {
      case solid:
        return ZeroColors.transparent;
      case outline:
        return ZeroColors.primary;
      case text:
        return ZeroColors.dark;
      case underline:
        return ZeroColors.dark;
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
        return ZeroColors.dark;
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
