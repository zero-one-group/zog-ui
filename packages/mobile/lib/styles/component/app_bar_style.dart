import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroAppBarStyle with Diagnosticable {
  /// The background coolor of [ZeroAppBar]
  final Color? backgroundColor;

  /// The color of title and icons in [ZeroAppBar]
  final Color? foregroundColor;

  /// Set default style title of [ZeroAppBar]
  final TextStyle? titleStyle;

  /// Set height ZeroAppBar
  ///
  /// By default, when height is null height by size of [ZeroAppBar]
  final double? height;

  /// Set center title of [ZeroAppBar]
  final bool? centerTitle;

  /// Status bar icon brightness
  final Brightness? statusBarBrightness;

  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// This property controls the size of the shadow below the app bar if
  /// [shadowColor] is not null.
  final double? elevation;

  /// The color of the shadow below the app bar.
  final Color? shadowColor;

  /// spacing around title content on the horizontal axis
  final double? titleSpacing;

  const ZeroAppBarStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.titleStyle,
    this.height,
    this.centerTitle,
    this.statusBarBrightness,
    this.elevation,
    this.shadowColor,
    this.titleSpacing,
  });

  /// A default value style of [ZeroAppBarStyle]
  static ZeroAppBarStyle fallback({
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? titleStyle,
    Brightness? statusBarBrightness,
    double? titleSpacing,
  }) =>
      ZeroAppBarStyle(
        backgroundColor: backgroundColor ?? ZeroColors.white,
        foregroundColor: foregroundColor ?? ZeroColors.black,
        titleStyle: titleStyle,
        statusBarBrightness: statusBarBrightness ?? Brightness.light,
        titleSpacing: titleSpacing,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroAppBarStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroAppBarStyle copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    double? height,
    TextStyle? titleStyle,
    bool? centerTitle,
    Brightness? statusBarBrightness,
    double? elevation,
    Color? shadowColor,
    double? titleSpacing,
  }) {
    return ZeroAppBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      height: height ?? this.height,
      titleStyle: titleStyle ?? this.titleStyle,
      centerTitle: centerTitle ?? this.centerTitle,
      statusBarBrightness: statusBarBrightness ?? this.statusBarBrightness,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      titleSpacing: titleSpacing ?? titleSpacing,
    );
  }

  ZeroAppBarStyle merge(ZeroAppBarStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      foregroundColor: other.foregroundColor,
      height: other.height,
      titleStyle: titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      centerTitle: other.centerTitle,
      statusBarBrightness: other.statusBarBrightness,
      elevation: other.elevation,
      shadowColor: other.shadowColor,
      titleSpacing: other.titleSpacing,
    );
  }

  static ZeroAppBarStyle lerp(
      ZeroAppBarStyle? a, ZeroAppBarStyle? b, double t) {
    return ZeroAppBarStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      height: t < 0.5 ? a?.height : b?.height,
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      centerTitle: t < 0.5 ? a?.centerTitle : b?.centerTitle,
      statusBarBrightness:
          t < 0.5 ? a?.statusBarBrightness : b?.statusBarBrightness,
      elevation: t < 0.5 ? a?.elevation : b?.elevation,
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      titleSpacing: t < 0.5 ? a?.titleSpacing : b?.titleSpacing,
    );
  }

  /// Convert [ZeroAppBarStyle] to theme data divider material [AppBarTheme]
  AppBarTheme toAppBarTheme() => AppBarTheme(
        color: backgroundColor,
        foregroundColor: foregroundColor,
        titleTextStyle: titleStyle,
        elevation: elevation,
        shadowColor: shadowColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: statusBarBrightness,
        ),
        titleSpacing: titleSpacing,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(DoubleProperty('height', height))
      ..add(StringProperty('centerTitle', centerTitle.toString()))
      ..add(DiagnosticsProperty<TextStyle>('titleStyle', titleStyle))
      ..add(DiagnosticsProperty<Brightness>(
          'statusBarBrightness', statusBarBrightness))
      ..add(DoubleProperty('elevation', elevation))
      ..add(ColorProperty('shadowColor', shadowColor))
      ..add(DiagnosticsProperty<double>('titleSpacing', titleSpacing));
  }
}
