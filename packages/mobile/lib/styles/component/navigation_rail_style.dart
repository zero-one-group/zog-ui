import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationRailStyle with Diagnosticable {
  /// Divider color
  final Color? color;

  /// Height/width of divider or thickness
  final double? size;

  /// Padding start
  final double? startInset;

  /// Padding end
  final double? endInset;

  const ZeroNavigationRailStyle({
    this.color,
    this.size,
    this.startInset,
    this.endInset,
  });

  /// A default value style of [ZeroNavigationRailStyle]
  static ZeroNavigationRailStyle fallback({Color? color}) =>
      ZeroNavigationRailStyle(
        color: color ?? ZeroColors.neutral[7],
        size: 1,
        startInset: 16,
        endInset: 16,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroNavigationRailStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroNavigationRailStyle copyWith({
    Color? color,
    double? size,
    double? startInset,
    double? endInset,
  }) {
    return ZeroNavigationRailStyle(
      color: color ?? this.color,
      size: size ?? this.size,
      startInset: startInset ?? this.startInset,
      endInset: endInset ?? this.endInset,
    );
  }

  ZeroNavigationRailStyle merge(ZeroNavigationRailStyle? other) {
    if (other == null) return this;

    return copyWith(
      color: other.color,
      size: other.size,
      startInset: other.startInset,
      endInset: other.endInset,
    );
  }

  static ZeroNavigationRailStyle lerp(
      ZeroNavigationRailStyle? a, ZeroNavigationRailStyle? b, double t) {
    return ZeroNavigationRailStyle(
      color: Color.lerp(a?.color, b?.color, t),
      size: t < 0.5 ? a?.size : b?.size,
      startInset: t < 0.5 ? a?.startInset : b?.startInset,
      endInset: t < 0.5 ? a?.endInset : b?.endInset,
    );
  }

  /// Convert [ZeroNavigationRailStyle] to theme data divider material [DividerThemeData]
  DividerThemeData toDividerTheme() => DividerThemeData(
        color: color,
        thickness: size,
        endIndent: endInset,
        space: size,
        indent: startInset,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('color', color))
      ..add(DoubleProperty('size', size))
      ..add(DoubleProperty('startInset', startInset))
      ..add(DoubleProperty('endInset', endInset));
  }
}
