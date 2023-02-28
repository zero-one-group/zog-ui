import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroRatingStyle with Diagnosticable {
  /// Rating item color when the rating is selected
  ///
  /// By default [activeColor] is [ZeroThemeData.primaryColor]
  final Color? activeColor;

  /// Rating item color when the rating is unselected
  final Color? inactiveColor;

  /// Spacing each reting item
  final double? spacing;

  const ZeroRatingStyle({
    this.activeColor,
    this.inactiveColor,
    this.spacing,
  });

  /// A default value style of [ZeroRatingStyle]
  static ZeroRatingStyle fallback({
    Color? activeColor,
    Color? inactiveColor,
    double? spacing,
  }) =>
      ZeroRatingStyle(
        activeColor: activeColor ?? ZeroColors.sunriseYellow,
        inactiveColor: inactiveColor ?? ZeroColors.neutral,
        spacing: spacing,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroRatingStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroRatingStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    double? spacing,
  }) {
    return ZeroRatingStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      spacing: spacing ?? this.spacing,
    );
  }

  ZeroRatingStyle merge(ZeroRatingStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      spacing: other.spacing,
    );
  }

  static ZeroRatingStyle lerp(
      ZeroRatingStyle? a, ZeroRatingStyle? b, double t) {
    return ZeroRatingStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      spacing: t < 0.5 ? a?.spacing : b?.spacing,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(DoubleProperty('spacing', spacing));
  }
}
