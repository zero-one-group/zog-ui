import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroButtonIconStyle with Diagnosticable {
  /// Background color the button if primary style
  /// Foreground color the button if secondary style
  final Color? color;

  /// Default icon color
  ///
  /// If this iconColor is null
  ///
  /// [iconColor] white when primary style
  /// [iconColor] is [color] when secondary style
  final Color? iconColor;

  /// Default icon size for larger size
  ///
  /// For medium and small sizes will be reduced by 2 for each of these [iconSize]
  final double? iconSize;

  const ZeroButtonIconStyle({
    this.color,
    this.iconColor,
    this.iconSize,
  });

  /// A default value style of [ZeroButtonIconStyle]
  static ZeroButtonIconStyle fallback({
    Color? color,
    Color? iconColor,
  }) =>
      ZeroButtonIconStyle(
        color: color ?? ZeroColors.primary,
        iconColor: iconColor,
        iconSize: 16,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroButtonIconStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroButtonIconStyle copyWith({
    Color? color,
    Color? iconColor,
    double? iconSize,
  }) {
    return ZeroButtonIconStyle(
      color: color ?? this.color,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  ZeroButtonIconStyle merge(ZeroButtonIconStyle? other) {
    if (other == null) return this;

    return copyWith(
      color: other.color,
      iconColor: other.iconColor,
      iconSize: other.iconSize,
    );
  }

  static ZeroButtonIconStyle lerp(
      ZeroButtonIconStyle? a, ZeroButtonIconStyle? b, double t) {
    return ZeroButtonIconStyle(
      color: Color.lerp(a?.color, b?.color, t),
      iconColor: t < 0.5 ? a?.iconColor : b?.iconColor,
      iconSize: t < 0.5 ? a?.iconSize : b?.iconSize,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('color', color))
      ..add(ColorProperty('iconColor', iconColor))
      ..add(DoubleProperty('iconSize', iconSize));
  }
}

class ZeroButtonIconStyleSet with Diagnosticable {
  final ZeroButtonIconStyle? primaryStyle;
  final ZeroButtonIconStyle? secondaryStyle;
  final double? largeSize;
  final double? mediumSize;
  final double? smallSize;
  final Color? disabledColor;

  const ZeroButtonIconStyleSet({
    this.primaryStyle,
    this.secondaryStyle,
    this.largeSize,
    this.mediumSize,
    this.smallSize,
    this.disabledColor,
  });

  static ZeroButtonIconStyleSet fallback({
    Color? primaryColor,
    Color? disabledColor,
  }) =>
      ZeroButtonIconStyleSet(
        largeSize: 40,
        mediumSize: 32,
        smallSize: 24,
        disabledColor: disabledColor ?? ZeroColors.neutral[7],
        primaryStyle: ZeroButtonIconStyle(
          color: primaryColor ?? ZeroColors.primary,
          iconColor: Colors.white,
          iconSize: 16,
        ),
        secondaryStyle: ZeroButtonIconStyle(
          color: Colors.transparent,
          iconColor: primaryColor ?? ZeroColors.primary,
          iconSize: 16,
        ),
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroButtonIconStyleSet with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroButtonIconStyleSet copyWith({
    ZeroButtonIconStyle? primaryStyle,
    ZeroButtonIconStyle? secondaryStyle,
    double? largeSize,
    double? mediumSize,
    double? smallSize,
    Color? disabledColor,
  }) {
    return ZeroButtonIconStyleSet(
      primaryStyle: primaryStyle ?? this.primaryStyle,
      secondaryStyle: secondaryStyle ?? this.secondaryStyle,
      largeSize: largeSize ?? this.largeSize,
      mediumSize: mediumSize ?? this.mediumSize,
      smallSize: smallSize ?? this.smallSize,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  ZeroButtonIconStyleSet merge(ZeroButtonIconStyleSet? other) {
    if (other == null) return this;

    return copyWith(
      primaryStyle: other.primaryStyle,
      secondaryStyle: other.secondaryStyle,
      largeSize: other.largeSize,
      mediumSize: other.mediumSize,
      smallSize: other.smallSize,
      disabledColor: other.disabledColor,
    );
  }

  static ZeroButtonIconStyleSet lerp(
      ZeroButtonIconStyleSet? a, ZeroButtonIconStyleSet? b, double t) {
    return ZeroButtonIconStyleSet(
      primaryStyle:
          ZeroButtonIconStyle.lerp(a?.primaryStyle, b?.primaryStyle, t),
      secondaryStyle:
          ZeroButtonIconStyle.lerp(a?.secondaryStyle, b?.secondaryStyle, t),
      disabledColor: Color.lerp(a?.disabledColor, b?.disabledColor, t),
      largeSize: t < 0.5 ? a?.largeSize : b?.largeSize,
      mediumSize: t < 0.5 ? a?.mediumSize : b?.mediumSize,
      smallSize: t < 0.5 ? a?.smallSize : b?.smallSize,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(DoubleProperty('largeSize', largeSize))
      ..add(DoubleProperty('mediumSize', mediumSize))
      ..add(DoubleProperty('smallSize', smallSize))
      ..add(ColorProperty('disabledColor', disabledColor));
  }
}
