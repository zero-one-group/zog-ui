import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum ZeroTooltipType {
  light,
  dark;

  Color get backgroundColor {
    switch (this) {
      case light:
        return ZeroColors.neutral[2];
      case dark:
        return ZeroColors.neutral[10];
    }
  }

  Color get textColor {
    switch (this) {
      case light:
        return ZeroColors.neutral[10];
      case dark:
        return ZeroColors.neutral[2];
    }
  }

  Color get borderColor {
    switch (this) {
      case light:
        return ZeroColors.neutral[5];
      case dark:
        return Colors.transparent;
    }
  }
}
