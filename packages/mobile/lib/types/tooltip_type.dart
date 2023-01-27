import 'package:flutter/material.dart';

import '../colors/zero_colors.dart';

enum ZeroTooltipType {
  light,
  dark;

  Color get backgroundColor {
    switch (this) {
      case light:
        return ZeroColors.neutral2;
      case dark:
        return ZeroColors.neutral10;
    }
  }

  Color get textColor {
    switch (this) {
      case light:
        return ZeroColors.neutral10;
      case dark:
        return ZeroColors.neutral2;
    }
  }

  Color get borderColor {
    switch (this) {
      case light:
        return ZeroColors.neutral5;
      case dark:
        return Colors.transparent;
    }
  }
}
