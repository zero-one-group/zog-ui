import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/styles/theme.dart';

extension BrightnessExtension on Brightness {
  /// Detects when the theme is light or not, if so returns true
  bool get isLight => this == Brightness.light;

  /// Detects when the theme is dark or not, if so returns true
  bool get isDark => this == Brightness.dark;

  /// Reverse brightness in the current state
  Brightness get opposite => isLight ? Brightness.dark : Brightness.light;
}

/// A theme utility extension
extension ThemeExtension on BuildContext {
  /// Get current of [ZeroTheme] on the parent widget using InheritedWidget
  ///
  /// Make sure that when using this, the project root already has a [ZeroApp] widget,
  /// otherwise it will give an error
  ZeroThemeData get theme => ZeroTheme.of(this);

  /// This function is the same as [theme],
  /// the only difference is that when calling it is safer,
  /// at the expense of value may be null(nullable)
  ZeroThemeData? get themeMaybe => ZeroTheme.maybeOf(this);
}
