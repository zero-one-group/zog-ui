import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

enum ZeroSnackbarAlertVariant {
  danger,
  warning,
  success,
  info;

  Color color(ZeroThemeData theme, ZeroSnackbarAlertStyle? alertStyle) {
    final style = alertStyle ?? theme.snackBarStyle.alert;

    switch (this) {
      case danger:
        return style?.defaultDangerColor ?? theme.errorColor;
      case warning:
        return style?.defaultWarningColor ?? theme.warningColor;
      case success:
        return style?.defaultSuccessColor ?? theme.successColor;
      case info:
        return style?.defaultInfoColor ?? theme.infoColor;
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

  Color iconColor(ZeroThemeData theme, ZeroSnackbarAlertStyle? alertStyle) =>
      color(theme, alertStyle);

  Color titleColor(ZeroThemeData theme, ZeroSnackbarAlertStyle? alertStyle) =>
      color(theme, alertStyle).darken(0.3);

  Color filledBackgroundColor(
          ZeroThemeData theme, ZeroSnackbarAlertStyle? alertStyle) =>
      color(theme, alertStyle).lighten(0.3);
}
