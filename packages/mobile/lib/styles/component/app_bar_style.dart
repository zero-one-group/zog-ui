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

  /// A list of shadows cast by this box behind the app bar.
  final List<BoxShadow>? shadows;

  const ZeroAppBarStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.titleStyle,
    this.height,
    this.centerTitle,
    this.statusBarBrightness,
    this.shadows,
  });

  /// A default value style of [ZeroAppBarStyle]
  static ZeroAppBarStyle fallback({
    Color? backgroundColor,
    Color? foregroundColor,
    TextStyle? titleStyle,
    Brightness? statusBarBrightness,
  }) =>
      ZeroAppBarStyle(
        backgroundColor: backgroundColor ?? ZeroColors.white,
        foregroundColor: foregroundColor ?? ZeroColors.black,
        titleStyle: titleStyle,
        statusBarBrightness: statusBarBrightness ?? Brightness.light,
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
    List<BoxShadow>? shadows,
  }) {
    return ZeroAppBarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      height: height ?? this.height,
      titleStyle: titleStyle ?? this.titleStyle,
      centerTitle: centerTitle ?? this.centerTitle,
      statusBarBrightness: statusBarBrightness ?? this.statusBarBrightness,
      shadows: shadows ?? this.shadows,
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
      shadows: other.shadows,
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
      shadows: t < 0.5 ? a?.shadows : b?.shadows,
    );
  }

  /// Convert [ZeroAppBarStyle] to theme data divider material [AppBarTheme]
  AppBarTheme toAppBarTheme() => AppBarTheme(
        color: backgroundColor,
        foregroundColor: foregroundColor,
        titleTextStyle: titleStyle,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: statusBarBrightness,
        ),
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
      ..add(DiagnosticsProperty<List<BoxShadow>>('shadows', shadows));
  }
}
