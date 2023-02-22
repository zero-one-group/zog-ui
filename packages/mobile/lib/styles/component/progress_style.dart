import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroProgressStyle with Diagnosticable {
  /// Color of the track being filled by the progress indicator.
  ///
  /// By default [activeColor] is [ZeroThemeData.primaryColor]
  final Color? backgroundColor;

  /// The progress indicator's color as an animated value.
  final Color? valueColor;

  /// The width of the line used to draw the progress indicator.
  final double? lineSize;

  const ZeroProgressStyle({
    this.backgroundColor,
    this.valueColor,
    this.lineSize,
  });

  /// A default value style of [ZeroProgressStyle]
  static ZeroProgressStyle fallback({
    Color? valueColor,
    Color? backgroundColor,
    double? lineSize,
  }) =>
      ZeroProgressStyle(
        backgroundColor: backgroundColor ?? ZeroColors.neutral[4],
        lineSize: lineSize ?? 4,
        valueColor: valueColor ?? ZeroColors.primary,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroProgressStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroProgressStyle copyWith({
    Color? valueColor,
    Color? backgroundColor,
    double? lineSize,
  }) {
    return ZeroProgressStyle(
      valueColor: valueColor ?? this.valueColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      lineSize: lineSize ?? this.lineSize,
    );
  }

  ZeroProgressStyle merge(ZeroProgressStyle? other) {
    if (other == null) return this;

    return copyWith(
      valueColor: other.valueColor,
      backgroundColor: other.backgroundColor,
      lineSize: other.lineSize,
    );
  }

  static ZeroProgressStyle lerp(
      ZeroProgressStyle? a, ZeroProgressStyle? b, double t) {
    return ZeroProgressStyle(
      valueColor: Color.lerp(a?.valueColor, b?.valueColor, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      lineSize: t < 0.5 ? a?.lineSize : b?.lineSize,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('valueColor', valueColor))
      ..add(DoubleProperty('lineSize', lineSize));
  }
}
