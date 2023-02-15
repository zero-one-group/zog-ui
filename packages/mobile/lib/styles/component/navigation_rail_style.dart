import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationRailStyle with Diagnosticable {
  /// A background color of navigation rail
  final Color? backgroundColor;

  /// Width of navigation rail
  final double? width;

  /// Indicator Color when active
  final Color? indicatorColor;

  /// Color of icon when active
  final Color? activeColor;

  /// Color of icon and label when inactive
  final Color? inactiveColor;

  /// Text style of label segment NavigationRail
  ///
  /// By default [labelStyle] is Typography.caption
  final TextStyle? labelStyle;

  /// BorderRadius indicator when active
  final BorderRadius? indicatorBorderRadius;

  const ZeroNavigationRailStyle({
    this.backgroundColor,
    this.width,
    this.indicatorColor,
    this.activeColor,
    this.inactiveColor,
    this.labelStyle,
    this.indicatorBorderRadius,
  });

  /// A default value style of [ZeroNavigationRailStyle]
  static ZeroNavigationRailStyle fallback({
    Color? backgrondColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? indicatorColor,
    TextStyle? labelStyle,
  }) =>
      ZeroNavigationRailStyle(
        backgroundColor: backgrondColor ?? Colors.white,
        width: 72,
        activeColor: activeColor ?? Colors.white,
        inactiveColor: inactiveColor ?? ZeroColors.neutral[12],
        indicatorColor: indicatorColor,
        labelStyle: labelStyle,
        indicatorBorderRadius: BorderRadius.circular(8),
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroNavigationRailStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroNavigationRailStyle copyWith({
    Color? backgroundColor,
    double? width,
    Color? indicatorColor,
    Color? activeColor,
    Color? inactiveColor,
    TextStyle? labelStyle,
    BorderRadius? indicatorBorderRadius,
  }) {
    return ZeroNavigationRailStyle(
      backgroundColor: backgroundColor ?? backgroundColor,
      width: width ?? this.width,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      activeColor: activeColor ?? this.activeColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      labelStyle: labelStyle ?? this.labelStyle,
      indicatorBorderRadius:
          indicatorBorderRadius ?? this.indicatorBorderRadius,
    );
  }

  ZeroNavigationRailStyle merge(ZeroNavigationRailStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      width: other.width,
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      indicatorColor: other.indicatorColor,
      labelStyle: other.labelStyle,
      indicatorBorderRadius: other.indicatorBorderRadius,
    );
  }

  static ZeroNavigationRailStyle lerp(
      ZeroNavigationRailStyle? a, ZeroNavigationRailStyle? b, double t) {
    return ZeroNavigationRailStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      indicatorColor: Color.lerp(a?.indicatorColor, b?.indicatorColor, t),
      width: t < 0.5 ? a?.width : b?.width,
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      indicatorBorderRadius: BorderRadius.lerp(
          a?.indicatorBorderRadius, b?.indicatorBorderRadius, t),
    );
  }

  /// Convert [ZeroNavigationRailStyle] to theme data navigation rail material [NavigationRailThemeData]
  NavigationRailThemeData toNavigationRailTheme() => NavigationRailThemeData(
        backgroundColor: backgroundColor,
        labelType: NavigationRailLabelType.all,
        elevation: 0,
        minWidth: width,
        useIndicator: true,
        indicatorColor: indicatorColor,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('indicatorColor', indicatorColor))
      ..add(DoubleProperty('width', width));
  }
}
