import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// A style for widget [ZeroChipFilled]
class ZeroChipFilledStyle with Diagnosticable {
  /// Background color of chip
  final Color? backgroundColor;

  /// Text style for label
  final TextStyle? textStyle;

  /// Color for cancelIcon
  final Color? iconColor;

  const ZeroChipFilledStyle({
    this.backgroundColor,
    this.textStyle,
    this.iconColor,
  });

  /// Get default value style of [ZeroChipFilled]
  static ZeroChipFilledStyle fallback({
    Color? backgroundColor,
    TextStyle? textStyle,
    Color? iconColor,
  }) =>
      ZeroChipFilledStyle(
        backgroundColor: backgroundColor ?? ZeroColors.neutral[4],
        iconColor: iconColor ?? ZeroColors.neutral,
        textStyle: textStyle ?? TextStyle(color: ZeroColors.neutral[10]),
      );

  /// `copyWith` is a function that returns a new instance of `ZeroChipFilledStyle` with the properties
  /// of the current instance, except for the ones that are passed as arguments to the function
  ZeroChipFilledStyle copyWith({
    Color? backgroundColor,
    TextStyle? textStyle,
    Color? iconColor,
  }) {
    return ZeroChipFilledStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textStyle: textStyle ?? this.textStyle,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  /// Merge style from other [ZeroChipFilledStyle]
  ZeroChipFilledStyle merge(ZeroChipFilledStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      iconColor: other.iconColor,
      textStyle: other.textStyle,
    );
  }

  static ZeroChipFilledStyle lerp(
      ZeroChipFilledStyle? a, ZeroChipFilledStyle? b, double t) {
    return ZeroChipFilledStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
    );
  }

  /// Convert this style to [ChipThemeData] from material design
  ChipThemeData toChipThemeData() => ChipThemeData(
        backgroundColor: backgroundColor,
        checkmarkColor: iconColor,
        elevation: 0,
        labelStyle: textStyle,
        pressElevation: 0,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('iconColor', iconColor));
  }
}

/// A style for widget [ZeroChipOutlined]
class ZeroChipOutlinedStyle with Diagnosticable {
  /// Border side color
  final Color? borderColor;

  /// Text style for label/content of [ZeroChipOutlined]
  final TextStyle? textStyle;

  /// Icon cancel color
  final Color? iconColor;

  const ZeroChipOutlinedStyle({
    this.borderColor,
    this.textStyle,
    this.iconColor,
  });

  /// Get default value style of [ZeroChipOutlined]
  static ZeroChipOutlinedStyle fallback({
    Color? borderColor,
    TextStyle? textStyle,
    Color? iconColor,
  }) =>
      ZeroChipOutlinedStyle(
        borderColor: borderColor ?? ZeroColors.neutral,
        iconColor: iconColor ?? ZeroColors.neutral,
        textStyle: textStyle ?? TextStyle(color: ZeroColors.neutral[10]),
      );

  /// `copyWith` is a function that returns a new instance of the current class with the given
  /// parameters
  ZeroChipOutlinedStyle copyWith({
    Color? borderColor,
    TextStyle? textStyle,
    Color? iconColor,
  }) {
    return ZeroChipOutlinedStyle(
      borderColor: borderColor ?? this.borderColor,
      textStyle: textStyle ?? this.textStyle,
      iconColor: iconColor ?? this.iconColor,
    );
  }

  /// If the other style is null, return this style. Otherwise, return a new style that is a copy of
  /// this style with the other style's properties merged in
  ZeroChipOutlinedStyle merge(ZeroChipOutlinedStyle? other) {
    if (other == null) return this;

    return copyWith(
      borderColor: other.borderColor,
      iconColor: other.iconColor,
      textStyle: other.textStyle,
    );
  }

  /// It takes two styles and a value between 0 and 1, and returns a style that is a mix of the two
  /// styles
  static ZeroChipOutlinedStyle lerp(
      ZeroChipOutlinedStyle? a, ZeroChipOutlinedStyle? b, double t) {
    return ZeroChipOutlinedStyle(
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('borderColor', borderColor))
      ..add(ColorProperty('iconColor', iconColor));
  }
}
