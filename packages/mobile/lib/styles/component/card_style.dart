import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ZeroCardStyle with Diagnosticable {
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final BorderSide? side;
  final Color? shadowColor;
  final EdgeInsetsGeometry? margin;
  final bool? borderOnForeground;

  ZeroCardStyle({
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.side,
    this.shadowColor,
    this.margin,
    this.borderOnForeground,
  });

  static ZeroCardStyle fallback({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
    Color? shadowColor,
    EdgeInsetsGeometry? margin,
    bool? borderOnForeground,
  }) =>
      ZeroCardStyle(
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: elevation ?? 4,
        borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(8)),
        side: side ?? BorderSide.none,
        shadowColor: shadowColor ?? Colors.black,
        margin: margin ?? const EdgeInsets.all(0),
        borderOnForeground: borderOnForeground ?? true,
      );

  ZeroCardStyle copyWith({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
    Color? shadowColor,
    EdgeInsetsGeometry? margin,
    bool? borderOnForeground,
  }) =>
      ZeroCardStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        elevation: elevation ?? this.elevation,
        borderRadius: borderRadius ?? this.borderRadius,
        side: side ?? this.side,
        shadowColor: shadowColor ?? this.shadowColor,
        margin: margin ?? this.margin,
        borderOnForeground: borderOnForeground ?? this.borderOnForeground,
      );

  ZeroCardStyle merge(ZeroCardStyle? otherStyle) {
    if (otherStyle == null) return this;

    return copyWith(
      backgroundColor: otherStyle.backgroundColor,
      elevation: otherStyle.elevation,
      borderRadius: otherStyle.borderRadius,
      side: otherStyle.side,
      shadowColor: otherStyle.shadowColor,
      margin: otherStyle.margin,
      borderOnForeground: otherStyle.borderOnForeground,
    );
  }

  static ZeroCardStyle lerp(ZeroCardStyle? a, ZeroCardStyle? b, double t) => ZeroCardStyle(
        backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
        elevation: t < 0.5 ? a?.elevation : b?.elevation,
        borderRadius: BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
        side: BorderSide.lerp(a?.side ?? BorderSide.none, b?.side ?? BorderSide.none, t),
        shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
        margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
        borderOnForeground: t < 0.5 ? a?.borderOnForeground : b?.borderOnForeground,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry>('borderRadius', borderRadius));
    properties.add(DiagnosticsProperty<BorderSide>('side', side));
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin));
    properties.add(FlagProperty('borderOnForeground', value: borderOnForeground, ifTrue: 'borderOnForeground'));
  }
}

class ZeroCardOutlinedStyle extends ZeroCardStyle {
  ZeroCardOutlinedStyle({
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
    EdgeInsetsGeometry? margin,
    bool? borderOnForeground,
  }) : super(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          elevation: 0,
          side: side,
          margin: margin,
          borderOnForeground: borderOnForeground,
        );
}

class ZeroCardElevatedStyle extends ZeroCardStyle {
  ZeroCardElevatedStyle({
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
    Color? shadowColor,
    EdgeInsetsGeometry? margin,
    bool? borderOnForeground,
  }) : super(
          backgroundColor: backgroundColor,
          elevation: elevation,
          borderRadius: borderRadius,
          side: side ?? BorderSide.none,
          shadowColor: shadowColor ?? Colors.black,
          margin: margin,
          borderOnForeground: borderOnForeground,
        );
}

class ZeroCardFilledStyle extends ZeroCardStyle {
  ZeroCardFilledStyle({
    required Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
    EdgeInsetsGeometry? margin,
    bool? borderOnForeground,
  }) : super(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          elevation: 0,
          side: side ?? BorderSide.none,
          margin: margin,
          borderOnForeground: borderOnForeground ?? true,
        );
}
