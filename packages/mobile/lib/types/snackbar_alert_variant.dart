import 'package:flutter/material.dart';

import '../styles/colors.dart';

enum ZeroSnackbarAlertVariant {
  danger,
  warning,
  success,
  info;

  Color get color {
    switch (this) {
      case danger:
        return Colors.red;
      case warning:
        return Colors.orange;
      case success:
        return Colors.green;
      case info:
        return Colors.blue;
    }
  }

  IconData get icon {
    switch (this) {
      case danger:
        return Icons.error_outline;
      case warning:
        return Icons.warning_amber_outlined;
      case success:
        return Icons.check_circle_outline;
      case info:
        return Icons.info_outline;
    }
  }

  Color get iconColor {
    switch (this) {
      case danger:
        return ZeroColors.dustRed[7];
      case warning:
        return ZeroColors.sunsetOrange[7];
      case success:
        return ZeroColors.polarGreen[7];
      case info:
        return ZeroColors.primary[7];
    }
  }

  Color get titleColor {
    switch (this) {
      case danger:
        return ZeroColors.dustRed[9];
      case warning:
        return ZeroColors.sunsetOrange[9];
      case success:
        return ZeroColors.polarGreen[9];
      case info:
        return ZeroColors.primary[10];
    }
  }

  Color get filledBackgroundColor {
    switch (this) {
      case danger:
        return ZeroColors.dustRed[1];
      case warning:
        return ZeroColors.sunsetOrange[1];
      case success:
        return ZeroColors.polarGreen[1];
      case info:
        return ZeroColors.primary[1];
    }
  }
}
