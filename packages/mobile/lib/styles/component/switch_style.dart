import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroSwitchStyle with Diagnosticable {
  /// Background color on active state
  final Color? activeColor;

  /// Background color on inactive state
  final Color? inactiveColor;

  /// Thumb icon color when active
  final Color? activeThumbColor;

  /// Thumb icon color when inactive
  final Color? inactiveThumbColor;

  /// Size thumb
  final double? thumbSize;

  const ZeroSwitchStyle({
    this.activeColor,
    this.inactiveColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.thumbSize,
  });

  /// A default value style of [ZeroSwitchStyle]
  static ZeroSwitchStyle fallback({
    Color? activeColor,
    Color? inactiveColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    double? thumbSize,
  }) =>
      ZeroSwitchStyle(
        activeColor: activeColor ?? ZeroColors.primary,
        inactiveColor: inactiveColor ?? ZeroColors.neutral[7],
        thumbSize: thumbSize ?? 22,
        activeThumbColor: activeThumbColor ?? ZeroColors.primary,
        inactiveThumbColor: inactiveThumbColor ?? ZeroColors.neutral[1],
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroSwitchStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroSwitchStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    double? thumbSize,
  }) {
    return ZeroSwitchStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      activeThumbColor: activeThumbColor ?? this.activeThumbColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      thumbSize: thumbSize ?? this.thumbSize,
    );
  }

  ZeroSwitchStyle merge(ZeroSwitchStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      activeThumbColor: other.activeThumbColor,
      inactiveThumbColor: other.inactiveThumbColor,
      thumbSize: other.thumbSize,
    );
  }

  static ZeroSwitchStyle lerp(
      ZeroSwitchStyle? a, ZeroSwitchStyle? b, double t) {
    return ZeroSwitchStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      activeThumbColor: Color.lerp(a?.activeThumbColor, b?.activeThumbColor, t),
      inactiveThumbColor:
          Color.lerp(a?.inactiveThumbColor, b?.inactiveThumbColor, t),
      thumbSize: t < 0.5 ? a?.thumbSize : b?.thumbSize,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('activeThumbColor', activeThumbColor))
      ..add(ColorProperty('inactiveThumbColor', inactiveThumbColor))
      ..add(DoubleProperty('thumbSize', thumbSize));
  }
}

class ZeroSwitchStyleSet {
  final ZeroSwitchStyle basic;
  final ZeroSwitchStyle android;
  final ZeroSwitchStyle iOS;
  final Color disabledColor;

  const ZeroSwitchStyleSet({
    required this.basic,
    required this.android,
    required this.iOS,
    required this.disabledColor,
  });

  static ZeroSwitchStyleSet fallback({
    AccentColor? primaryColor,
    Color? inActiveColor,
    Color? inActiveIOSColor,
    Color? disabledColor,
  }) =>
      ZeroSwitchStyleSet(
        basic: ZeroSwitchStyle.fallback(
          activeThumbColor: primaryColor,
          inactiveThumbColor: ZeroColors.neutral[1],
          activeColor: primaryColor?.light,
          inactiveColor: inActiveColor ?? ZeroColors.neutral[7],
        ),
        android: ZeroSwitchStyle.fallback(
          activeThumbColor: primaryColor,
          inactiveThumbColor: ZeroColors.neutral[1],
          activeColor: primaryColor?.light,
          inactiveColor: inActiveColor ?? ZeroColors.neutral[7],
        ),
        iOS: ZeroSwitchStyle.fallback(
          thumbSize: 30,
          activeThumbColor: ZeroColors.neutral[1],
          inactiveThumbColor: ZeroColors.neutral[1],
          activeColor: primaryColor,
          inactiveColor: inActiveIOSColor ?? ZeroColors.neutral[5],
        ),
        disabledColor: disabledColor ?? ZeroColors.neutral[5],
      );

  ZeroSwitchStyleSet copyWith({
    ZeroSwitchStyle? basic,
    ZeroSwitchStyle? android,
    ZeroSwitchStyle? iOS,
    Color? disabledColor,
  }) {
    return ZeroSwitchStyleSet(
      basic: basic ?? this.basic,
      android: android ?? this.android,
      iOS: iOS ?? this.iOS,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  ZeroSwitchStyleSet merge(ZeroSwitchStyleSet? other) {
    if (other == null) return this;

    return copyWith(
      basic: basic.merge(other.basic),
      android: android.merge(other.android),
      iOS: iOS.merge(other.iOS),
      disabledColor: other.disabledColor,
    );
  }

  static ZeroSwitchStyleSet lerp(
      ZeroSwitchStyleSet? a, ZeroSwitchStyleSet? b, double t) {
    return ZeroSwitchStyleSet(
      basic: ZeroSwitchStyle.lerp(a?.basic, b?.basic, t),
      android: ZeroSwitchStyle.lerp(a?.android, b?.android, t),
      iOS: ZeroSwitchStyle.lerp(a?.iOS, b?.iOS, t),
      disabledColor: Color.lerp(a?.disabledColor, b?.disabledColor, t)!,
    );
  }
}
