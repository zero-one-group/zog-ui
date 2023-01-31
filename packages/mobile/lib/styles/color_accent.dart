import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// An accent color is a color that can have multiple shades. It's
/// similar to [ShadedColor] and [ColorSwatch], but it has helper
/// methods to help you access the shade you want easily. These
/// shades may not be accessible on every accent color.
class AccentColor extends ColorSwatch<String> {
  /// The default shade for this color. This can't be null
  final String primary;

  /// The avaiable shades for this color. This can't be null nor empty
  final Map<String, Color> swatch;

  /// Create a new accent color.
  AccentColor(this.primary, this.swatch)
      : super(swatch[primary]!.value, swatch);

  /// The darkest shade of the color.
  Color get darkest => swatch['darkest'] ?? darker;

  /// The darker shade of the color.
  ///
  /// Usually used for shadows
  Color get darker => swatch['darker'] ?? dark;

  /// The dark shade of the color.
  ///
  /// Usually used for the mouse press effect;
  Color get dark => swatch['dark'] ?? normal;

  /// The default shade of the color.
  Color get normal => swatch['normal']!;

  /// The light shade of the color.
  ///
  /// Usually used for the mouse hover effect
  Color get light => swatch['light'] ?? normal;

  /// The lighter shade of the color.
  ///
  /// Usually used for shadows
  Color get lighter => swatch['lighter'] ?? light;

  /// The lighest shade of the color
  Color get lightest => swatch['lightest'] ?? lighter;

  static AccentColor lerp(AccentColor? a, AccentColor? b, double t) {
    final darkest = Color.lerp(a?.darkest, b?.darkest, t);
    final darker = Color.lerp(a?.darker, b?.darker, t);
    final dark = Color.lerp(a?.dark, b?.dark, t);
    final light = Color.lerp(a?.light, b?.light, t);
    final lighter = Color.lerp(a?.lighter, b?.lighter, t);
    final lightest = Color.lerp(a?.lightest, b?.lightest, t);

    return AccentColor('normal', {
      if (darkest != null) 'darkest': darkest,
      if (darker != null) 'darker': darker,
      if (dark != null) 'dark': dark,
      'normal': Color.lerp(a?.normal, b?.normal, t)!,
      if (light != null) 'light': light,
      if (lighter != null) 'lighter': lighter,
      if (lightest != null) 'lightest': lightest,
    });
  }

  static Color resolve(Color resolvable, BuildContext context) {
    return (resolvable is AccentColor)
        ? resolvable.resolveFrom(context)
        : resolvable;
  }

  Color resolveFrom(BuildContext context, [Brightness? bright]) {
    final ZeroThemeData? theme = ZeroTheme.maybeOf(context);
    final brightness = bright ?? theme?.brightness ?? Brightness.light;
    return resolveFromBrightness(brightness);
  }

  Color resolveFromBrightness(Brightness brightness, {int level = 0}) {
    switch (brightness) {
      case Brightness.light:
        return level == 0
            ? light
            : level == 1
                ? lighter
                : lightest;
      case Brightness.dark:
        return level == 0
            ? dark
            : level == 1
                ? darker
                : darkest;
    }
  }

  Color resolveFromReverseBrightness(Brightness brightness, {int level = 0}) {
    switch (brightness) {
      case Brightness.dark:
        return level == 0
            ? light
            : level == 1
                ? lighter
                : lightest;
      case Brightness.light:
        return level == 0
            ? dark
            : level == 1
                ? darker
                : darkest;
    }
  }
}

/// Extension methods to help dealing with colors.
extension ShadedColorExtension on ShadedColor {
  AccentColor toAccentColor() {
    return AccentColor('normal', {
      'lightest': swatch.entries.first.value,
      'lighter': this[3],
      'light': this[4],
      'normal': this[6],
      'dark': this[7],
      'darker': this[9],
      'darkest': swatch.entries.last.value,
    });
  }
}
