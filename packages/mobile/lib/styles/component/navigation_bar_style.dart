import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroNavigationBarStyle with Diagnosticable {
  /// Background of Navigation Bar, by default use white/black by theme
  final Color? backgroundColor;

  /// Height of navigation bar
  final double? height;

  /// Indicator background color when item is active
  ///
  /// By default [indicatorColor] use from [ZeroTheme.primaryColor.lighter]
  final Color? indicatorColor;

  /// Label color when state is unselected/inactive
  final Color? unselectedColor;

  /// Label color when state is selected/active
  final Color? selectedColor;

  /// Type indicator on active
  final ZeroNavigationBarIndicatorType? indicatorType;

  const ZeroNavigationBarStyle({
    this.backgroundColor,
    this.height,
    this.indicatorColor,
    this.unselectedColor,
    this.selectedColor,
    this.indicatorType,
  });

  /// A default value style of [ZeroNavigationBarStyle]
  static ZeroNavigationBarStyle fallback({
    Color? backgroundColor,
    Color? indicatorColor,
    Color? unselectedColor,
    Color? selectedColor,
  }) =>
      ZeroNavigationBarStyle(
        backgroundColor: backgroundColor ?? Colors.white,
        unselectedColor: unselectedColor ?? Colors.black,
        selectedColor: selectedColor ?? Colors.black,
        indicatorColor:
            indicatorColor ?? ZeroColors.primary.toAccentColor().lighter,
        indicatorType: ZeroNavigationBarIndicatorType.oval,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  /// A new instance of ZeroNavigationBarStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroNavigationBarStyle copyWith({
    Color? backgroundColor,
    Color? indicatorColor,
    Color? unselectedColor,
    Color? selectedColor,
    double? height,
    ZeroNavigationBarIndicatorType? indicatorType,
  }) {
    return ZeroNavigationBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      selectedColor: selectedColor ?? this.selectedColor,
      height: height ?? this.height,
      indicatorType: indicatorType ?? this.indicatorType,
    );
  }

  ZeroNavigationBarStyle merge(ZeroNavigationBarStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      indicatorColor: other.indicatorColor,
      unselectedColor: other.unselectedColor,
      selectedColor: other.selectedColor,
      height: other.height,
      indicatorType: other.indicatorType,
    );
  }

  static ZeroNavigationBarStyle lerp(
      ZeroNavigationBarStyle? a, ZeroNavigationBarStyle? b, double t) {
    return ZeroNavigationBarStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      indicatorColor: Color.lerp(a?.indicatorColor, b?.indicatorColor, t),
      unselectedColor: Color.lerp(a?.unselectedColor, b?.unselectedColor, t),
      selectedColor: Color.lerp(a?.selectedColor, b?.selectedColor, t),
      height: t < 0.5 ? a?.height : b?.height,
      indicatorType: t < 0.5 ? a?.indicatorType : b?.indicatorType,
    );
  }

  /// Convert [ZeroNavigationBarStyle] to theme data divider material [NavigationBarThemeData]
  NavigationBarThemeData toNavigationBarTheme() => NavigationBarThemeData(
        backgroundColor: backgroundColor,
        height: height,
        elevation: 0,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('indicatorColor', indicatorColor))
      ..add(ColorProperty('unselectedColor', unselectedColor))
      ..add(ColorProperty('selectedColor', selectedColor))
      ..add(DoubleProperty('height', height));
  }
}
