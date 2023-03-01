import 'package:flutter/material.dart';
import 'package:zog_ui/styles/theme.dart';
import 'package:zog_ui/utils/extensions/color_extension.dart';

enum ZeroSnackbarAlertVariant {
  danger,
  warning,
  success,
  info;

  Color color(ZeroThemeData theme) {
    switch (this) {
      case danger:
        return theme.errorColor;
      case warning:
        return theme.warningColor;
      case success:
        return theme.successColor;
      case info:
        return theme.infoColor;
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

  Color iconColor(ZeroThemeData theme) => color(theme);

  Color titleColor(ZeroThemeData theme) {
    return color(theme).darken(0.3);
  }

  Color filledBackgroundColor(ZeroThemeData theme) {
    switch (this) {
      case danger:
        return theme.errorColor.lighten(0.5);
      case warning:
        return theme.warningColor.lighten(0.5);
      case success:
        return theme.successColor.lighten(0.5);
      case info:
        return theme.infoColor.lighten(0.5);
    }
  }
}
