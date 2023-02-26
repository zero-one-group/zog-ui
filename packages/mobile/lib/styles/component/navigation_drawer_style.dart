import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationDrawerStyle with Diagnosticable {
  /// Background of Drawer, by default use white/black by theme
  final Color? backgroundColor;

  /// Width of drawer
  ///
  /// By default width drawer is 300
  final double? width;

  /// The shape of the drawer.
  ///
  /// If this is null, use from [ZeroThemeData.drawerStyle.shape]
  final ShapeBorder? shape;

  /// The text style of [ZeroNavigationDrawerHeader]
  ///
  /// By default style use from [ZeroTypography.subtitle1]
  final TextStyle? headerTitleStyle;

  /// The title text style of [ZeroNavigationDrawerSection]
  ///
  /// By default style use from [ZeroTypography.subtitle2]
  final TextStyle? sectionTitleStyle;

  /// Set enable/disable seperator each section
  final bool separatorDrawer;

  const ZeroNavigationDrawerStyle({
    this.backgroundColor,
    this.width,
    this.shape,
    this.headerTitleStyle,
    this.sectionTitleStyle,
    this.separatorDrawer = true,
  });

  /// A default value style of [ZeroNavigationDrawerStyle]
  static ZeroNavigationDrawerStyle fallback({
    Color? backgroundColor,
    TextStyle? headerTitleStyle,
    TextStyle? sectionTitleStyle,
  }) =>
      ZeroNavigationDrawerStyle(
        backgroundColor: backgroundColor ?? Colors.white,
        headerTitleStyle: headerTitleStyle,
        sectionTitleStyle: sectionTitleStyle,
        separatorDrawer: true,
        width: 300,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16)),
        ),
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  /// A new instance of ZeroNavigationDrawerStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroNavigationDrawerStyle copyWith({
    Color? backgroundColor,
    TextStyle? headerTitleStyle,
    TextStyle? sectionTitleStyle,
    double? width,
    ShapeBorder? shape,
    bool? separatorDrawer,
  }) {
    return ZeroNavigationDrawerStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      headerTitleStyle: headerTitleStyle ?? this.headerTitleStyle,
      sectionTitleStyle: sectionTitleStyle ?? this.sectionTitleStyle,
      separatorDrawer: separatorDrawer ?? this.separatorDrawer,
      shape: shape ?? this.shape,
      width: width ?? this.width,
    );
  }

  ZeroNavigationDrawerStyle merge(ZeroNavigationDrawerStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      headerTitleStyle: headerTitleStyle?.merge(other.headerTitleStyle) ??
          other.headerTitleStyle,
      sectionTitleStyle: sectionTitleStyle?.merge(other.sectionTitleStyle) ??
          other.sectionTitleStyle,
      separatorDrawer: other.separatorDrawer,
      shape: other.shape,
      width: other.width,
    );
  }

  static ZeroNavigationDrawerStyle lerp(
      ZeroNavigationDrawerStyle? a, ZeroNavigationDrawerStyle? b, double t) {
    return ZeroNavigationDrawerStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      headerTitleStyle:
          TextStyle.lerp(a?.headerTitleStyle, b?.headerTitleStyle, t),
      sectionTitleStyle:
          TextStyle.lerp(a?.sectionTitleStyle, b?.sectionTitleStyle, t),
      separatorDrawer:
          (t < 0.5 ? a?.separatorDrawer : b?.separatorDrawer) ?? true,
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      width: t < 0.5 ? a?.width : b?.width,
    );
  }

  /// Convert [ZeroNavigationDrawerStyle] to theme data divider material [DrawerThemeData]
  DrawerThemeData toNavigationDrawerTheme() => DrawerThemeData(
        backgroundColor: backgroundColor,
        width: width,
        shape: shape,
        elevation: 0,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(DoubleProperty('width', width));
  }
}
