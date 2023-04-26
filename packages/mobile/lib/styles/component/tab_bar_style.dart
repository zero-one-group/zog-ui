import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroTabBarStyle with Diagnosticable {
  /// Background color of TabBar
  final Color? backgroundColor;

  /// Default label & icon color when tab item is active
  ///
  /// By default [activeColor] is `primaryColor` from [ZeroThemeData]
  final Color? activeColor;

  /// Default label & icon color when tab item is not active
  final Color? inactiveColor;

  /// Indicator color tab active
  ///
  /// By default [indicatorColor] is `primaryColor` from [ZeroThemeData]
  final Color? indicatorColor;

  /// Padding item of [ZeroTab]
  final EdgeInsetsGeometry? padding;

  /// The padding added to each of the tab labels.
  final EdgeInsetsGeometry? labelPadding;

  /// Default icon size
  final double? iconSize;

  /// Text style for label
  final TextStyle? labelStyle;

  /// Tabbar style scrollable
  ///
  /// By default [isScrollable] is false
  final bool isScrollable;

  const ZeroTabBarStyle({
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.indicatorColor,
    this.padding,
    this.labelPadding,
    this.iconSize,
    this.labelStyle,
    this.isScrollable = false,
  });

  /// A default value style of [ZeroTabBarStyle]
  static ZeroTabBarStyle fallback({
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? indicatorColor,
    EdgeInsetsGeometry? padding,
    double? iconSize,
    TextStyle? labelStyle,
  }) =>
      ZeroTabBarStyle(
        activeColor: activeColor ?? ZeroColors.primary,
        inactiveColor: inactiveColor ?? ZeroColors.neutral[8],
        indicatorColor: indicatorColor ?? ZeroColors.primary,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
        iconSize: 24,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        isScrollable: false,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroTabBarStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroTabBarStyle copyWith({
    Color? backgroundColor,
    Color? activeColor,
    Color? inactiveColor,
    Color? indicatorColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? labelPadding,
    double? iconSize,
    TextStyle? labelStyle,
    bool? isScrollable,
  }) {
    return ZeroTabBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      indicatorColor: indicatorColor ?? this.indicatorColor,
      padding: padding ?? this.padding,
      labelPadding: labelPadding ?? this.labelPadding,
      iconSize: iconSize ?? this.iconSize,
      labelStyle: labelStyle ?? this.labelStyle,
      isScrollable: isScrollable ?? this.isScrollable,
    );
  }

  ZeroTabBarStyle merge(ZeroTabBarStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      indicatorColor: other.indicatorColor,
      padding: other.padding,
      labelPadding: other.labelPadding,
      iconSize: other.iconSize,
      labelStyle: labelStyle?.merge(other.labelStyle) ?? other.labelStyle,
      isScrollable: other.isScrollable,
    );
  }

  static ZeroTabBarStyle lerp(
      ZeroTabBarStyle? a, ZeroTabBarStyle? b, double t) {
    return ZeroTabBarStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      indicatorColor: Color.lerp(a?.indicatorColor, b?.indicatorColor, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      labelPadding:
          EdgeInsetsGeometry.lerp(a?.labelPadding, b?.labelPadding, t),
      iconSize: t < 0.5 ? a?.iconSize : b?.iconSize,
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      isScrollable: (t < 0.5 ? a?.isScrollable : b?.isScrollable) ?? false,
    );
  }

  /// Convert [ZeroTabBarStyle] to theme data divider material [TabBarTheme]
  TabBarTheme toTabBarTheme() => TabBarTheme(
        dividerColor: Colors.transparent,
        indicatorColor: indicatorColor,
        labelColor: activeColor,
        unselectedLabelColor: inactiveColor,
        labelStyle: labelStyle,
        unselectedLabelStyle: labelStyle?.copyWith(color: inactiveColor),
        labelPadding: labelPadding,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('indicatorColor', indicatorColor))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding))
      ..add(
          DiagnosticsProperty<EdgeInsetsGeometry>('labelPadding', labelPadding))
      ..add(DoubleProperty('iconSize', iconSize))
      ..add(DiagnosticsProperty<TextStyle>('labelStyle', labelStyle))
      ..add(DiagnosticsProperty<bool>('isScrollable', isScrollable));
  }
}
