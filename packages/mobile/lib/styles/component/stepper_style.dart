import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../zero_ui_mobile.dart';

class ZeroStepperStyle with Diagnosticable {
  final Color? dividerColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;

  const ZeroStepperStyle({
    this.dividerColor,
    this.elevation,
    this.margin,
  });

  static ZeroStepperStyle fallback({
    Color? dividerColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
  }) =>
      ZeroStepperStyle(
        dividerColor: dividerColor ?? ZeroColors.neutral,
        elevation: elevation ?? 0,
        margin: margin ?? const EdgeInsets.all(0),
      );

  ZeroStepperStyle copyWith({
    Color? dividerColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
  }) =>
      ZeroStepperStyle(
        dividerColor: dividerColor ?? this.dividerColor,
        elevation: elevation ?? this.elevation,
        margin: margin ?? this.margin,
      );

  ZeroStepperStyle merge(ZeroStepperStyle? style) {
    if (style == null) return this;
    return copyWith(
      dividerColor: style.dividerColor,
      elevation: style.elevation,
      margin: style.margin,
    );
  }

  static ZeroStepperStyle lerp(
    ZeroStepperStyle? a,
    ZeroStepperStyle? b,
    double t,
  ) =>
      ZeroStepperStyle(
        dividerColor: Color.lerp(a?.dividerColor, b?.dividerColor, t),
        elevation: t < 0.5 ? a?.elevation : b?.elevation,
        margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('dividerColor', dividerColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin));
  }
}
