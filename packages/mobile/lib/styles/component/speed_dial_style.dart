import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// TODO: Add more properties

class ZeroSpeedDialStyle with Diagnosticable {
  final Color? activeColor;
  final Color? inactiveColor;
  final double? size;
  final double? spacing;
  final Color? tooltipBackgroundColor;
  final Color? tooltipBorderColor;
  final double? elevation;
  final Color? shadowColor;
  final BorderRadius? borderRadius;

  const ZeroSpeedDialStyle({
    this.activeColor,
    this.inactiveColor,
    this.size,
    this.spacing,
    this.tooltipBackgroundColor,
    this.tooltipBorderColor,
    this.elevation,
    this.shadowColor,
    this.borderRadius,
  });

  static ZeroSpeedDialStyle fallback(
          {Color? activeColor, Color? inactiveColor}) =>
      ZeroSpeedDialStyle(
        activeColor: activeColor ?? Colors.white,
        inactiveColor: inactiveColor ?? activeColor ?? Colors.white,
        size: 56,
        spacing: 4,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.75),
        borderRadius: BorderRadius.circular(28),
      );

  ZeroSpeedDialStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    double? size,
    double? spacing,
    Color? tooltipBackgroundColor,
    Color? tooltipBorderColor,
    double? elevation,
    Color? shadowColor,
    BorderRadius? borderRadius,
  }) {
    return ZeroSpeedDialStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      size: size ?? this.size,
      spacing: spacing ?? this.spacing,
      tooltipBackgroundColor:
          tooltipBackgroundColor ?? this.tooltipBackgroundColor,
      tooltipBorderColor: tooltipBorderColor ?? this.tooltipBorderColor,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  ZeroSpeedDialStyle merge(ZeroSpeedDialStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      size: other.size,
      spacing: other.spacing,
      tooltipBackgroundColor: other.tooltipBackgroundColor,
      tooltipBorderColor: other.tooltipBorderColor,
      elevation: other.elevation,
      shadowColor: other.shadowColor,
      borderRadius: other.borderRadius,
    );
  }

  static ZeroSpeedDialStyle lerp(
      ZeroSpeedDialStyle? a, ZeroSpeedDialStyle? b, double t) {
    return ZeroSpeedDialStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      size: t < 0.5 ? a?.size : b?.size,
      spacing: t < 0.5 ? a?.spacing : b?.spacing,
      tooltipBackgroundColor:
          Color.lerp(a?.tooltipBackgroundColor, b?.tooltipBackgroundColor, t),
      tooltipBorderColor:
          Color.lerp(a?.tooltipBorderColor, b?.tooltipBorderColor, t),
      elevation: t < 0.5 ? a?.elevation : b?.elevation,
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('activeColor', activeColor));
    properties.add(ColorProperty('inactiveColor', inactiveColor));
    properties.add(DoubleProperty('size', size));
    properties.add(DoubleProperty('spacing', spacing));
    properties
        .add(ColorProperty('tooltipBackgroundColor', tooltipBackgroundColor));
    properties.add(ColorProperty('tooltipBorderColor', tooltipBorderColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
  }
}
