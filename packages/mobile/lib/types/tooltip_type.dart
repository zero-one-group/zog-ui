import 'package:flutter/material.dart';

import '../colors/zero_colors.dart';

enum ZeroTooltipType {
  light,
  dark;

  Color get backgroundColor {
    switch (this) {
      case ZeroTooltipType.light:
        return ZeroColors.neutral2;
      case ZeroTooltipType.dark:
        return ZeroColors.neutral10;
    }
  }

  Color get textColor {
    switch (this) {
      case ZeroTooltipType.light:
        return ZeroColors.neutral10;
      case ZeroTooltipType.dark:
        return ZeroColors.neutral2;
    }
  }

  Color get borderColor {
    switch (this) {
      case ZeroTooltipType.light:
        return ZeroColors.neutral5;
      case ZeroTooltipType.dark:
        return Colors.transparent;
    }
  }
}
