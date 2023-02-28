import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/styles/color_accent.dart';
import 'package:zog_ui/styles/colors.dart';

/// A basic class for button group styles
class ZeroButtonGroupStyle with Diagnosticable {
  /// A background color when the button item is active.
  /// For type [outlined][activeColor] as foregroundColor
  final Color? activeColor;

  /// A background color when the button item is non active.
  /// For type [outlined][inactiveColor] as foregroundColor
  final Color? inactiveColor;

  /// The button border color when it's active
  final Color? activeBorderColor;

  /// The button border color when it;s state is inactive
  final Color? inactiveBorderColor;

  /// Textstyle for text when the state button is active
  final TextStyle? activeTextStyle;

  /// Textstyle for text when the state button is inactive
  final TextStyle? inactiveTextStyle;

  /// Padding for each button item
  final EdgeInsetsGeometry? padding;

  const ZeroButtonGroupStyle({
    this.activeColor,
    this.inactiveColor,
    this.activeBorderColor,
    this.inactiveBorderColor,
    this.activeTextStyle,
    this.inactiveTextStyle,
    this.padding,
  });

  /// Copy the current instance with the new value given
  ZeroButtonGroupStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? activeBorderColor,
    Color? inactiveBorderColor,
    TextStyle? activeTextStyle,
    TextStyle? inactiveTextStyle,
    EdgeInsetsGeometry? padding,
  }) {
    return ZeroButtonGroupStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      activeBorderColor: activeBorderColor ?? this.activeBorderColor,
      inactiveBorderColor: inactiveBorderColor ?? this.inactiveBorderColor,
      activeTextStyle: activeTextStyle ?? this.activeTextStyle,
      inactiveTextStyle: inactiveTextStyle ?? this.inactiveTextStyle,
      padding: padding ?? this.padding,
    );
  }

  /// Merge two style of [ZeroButtonGroupStyle]
  ZeroButtonGroupStyle merge(ZeroButtonGroupStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      activeBorderColor: other.activeBorderColor,
      inactiveBorderColor: other.inactiveBorderColor,
      activeTextStyle: activeTextStyle?.merge(other.activeTextStyle) ??
          other.activeTextStyle,
      inactiveTextStyle: inactiveTextStyle?.merge(other.inactiveTextStyle) ??
          other.inactiveTextStyle,
      padding: other.padding,
    );
  }

  static ZeroButtonGroupStyle lerp(
      ZeroButtonGroupStyle? a, ZeroButtonGroupStyle? b, double t) {
    return ZeroButtonGroupStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      activeBorderColor:
          Color.lerp(a?.activeBorderColor, b?.activeBorderColor, t),
      inactiveBorderColor:
          Color.lerp(a?.inactiveBorderColor, b?.inactiveBorderColor, t),
      activeTextStyle:
          TextStyle.lerp(a?.activeTextStyle, b?.activeTextStyle, t),
      inactiveTextStyle:
          TextStyle.lerp(a?.inactiveTextStyle, b?.inactiveTextStyle, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('activeColor', activeColor));
    properties.add(ColorProperty('inactiveColor', inactiveColor));
    properties.add(ColorProperty('activeBorderColor', activeBorderColor));
    properties.add(ColorProperty('inactiveBorderColor', inactiveBorderColor));
  }
}

/// A button group style for a filled [ZeroButtonGroup].
class ZeroButtonGroupFilledStyle extends ZeroButtonGroupStyle {
  const ZeroButtonGroupFilledStyle({
    super.activeColor,
    super.inactiveColor,
    super.activeTextStyle,
    super.inactiveTextStyle,
    super.padding,
  });

  static ZeroButtonGroupFilledStyle fallback({
    AccentColor? primaryColor,
    TextStyle? textStyle,
  }) =>
      ZeroButtonGroupFilledStyle(
        activeColor: primaryColor?.light ?? ZeroColors.primary[5],
        inactiveColor: primaryColor ?? ZeroColors.primary,
        inactiveTextStyle: textStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.white,
            ),
        activeTextStyle: textStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.white,
            ),
      );
}

/// A button group style for a outlined [ZeroButtonGroup].
class ZeroButtonGroupOutlinedStyle extends ZeroButtonGroupStyle {
  const ZeroButtonGroupOutlinedStyle({
    Color? activeBackgroundColor,
    super.activeTextStyle,
    super.inactiveTextStyle,
    super.activeBorderColor,
    super.inactiveBorderColor,
    super.padding,
  }) : super(activeColor: activeBackgroundColor);

  static ZeroButtonGroupOutlinedStyle fallback({
    AccentColor? primaryColor,
    TextStyle? textStyle,
    Color? inactiveBorderColor,
  }) =>
      ZeroButtonGroupOutlinedStyle(
        activeBackgroundColor: primaryColor?.light ?? Colors.transparent,
        inactiveBorderColor: inactiveBorderColor ?? ZeroColors.neutral[5],
        activeBorderColor: primaryColor ?? ZeroColors.primary,
        inactiveTextStyle: textStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.neutral[10],
            ),
        activeTextStyle:
            textStyle?.copyWith(color: primaryColor ?? ZeroColors.primary) ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: primaryColor ?? ZeroColors.primary,
                ),
      );
}

/// A button group style for a text [ZeroButtonGroup].
class ZeroButtonGroupTextStyle extends ZeroButtonGroupStyle {
  const ZeroButtonGroupTextStyle({
    Color? activeBackgroundColor,
    super.activeTextStyle,
    super.inactiveTextStyle,
    super.padding,
  }) : super(activeColor: activeBackgroundColor);

  static ZeroButtonGroupTextStyle fallback({
    TextStyle? textStyle,
    Color? activeBackgroundColor,
  }) =>
      ZeroButtonGroupTextStyle(
        activeBackgroundColor: activeBackgroundColor ?? ZeroColors.neutral[3],
        inactiveTextStyle: textStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.neutral[10],
            ),
        activeTextStyle: textStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.neutral[10],
            ),
      );
}

/// A button group style for a underline [ZeroButtonGroup].
class ZeroButtonGroupUnderlineStyle extends ZeroButtonGroupStyle {
  const ZeroButtonGroupUnderlineStyle({
    super.activeColor,
    super.activeTextStyle,
    super.inactiveTextStyle,
    Color? underlineColor,
    super.padding,
  }) : super(activeBorderColor: underlineColor);

  static ZeroButtonGroupUnderlineStyle fallback({
    AccentColor? primaryColor,
    TextStyle? textStyle,
  }) =>
      ZeroButtonGroupUnderlineStyle(
        underlineColor: primaryColor ?? ZeroColors.primary,
        activeColor: primaryColor ?? ZeroColors.primary,
        inactiveTextStyle: textStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.neutral[10],
            ),
        activeTextStyle: textStyle?.copyWith(color: primaryColor) ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ZeroColors.neutral[10],
            ),
      );
}

class ZeroButtonGroupStyleSet {
  /// A button group style for filled
  ///
  /// Typically for filled styles use [ZeroButtonGroupFilledStyle]
  final ZeroButtonGroupStyle? filled;

  /// A button group style for outlined
  ///
  /// Typically for outlined styles use [ZeroButtonGroupOutlinedStyle]
  final ZeroButtonGroupStyle? outlined;

  /// A button group style for text
  ///
  /// Typically for text styles use [ZeroButtonGroupTextStyle]
  final ZeroButtonGroupStyle? text;

  /// A button group style for underline
  ///
  /// Typically for underline styles use [ZeroButtonGroupUnderlineStyle]
  final ZeroButtonGroupStyle? underline;

  const ZeroButtonGroupStyleSet({
    this.filled,
    this.outlined,
    this.text,
    this.underline,
  });

  static ZeroButtonGroupStyleSet fallback({
    AccentColor? primaryColor,
  }) =>
      ZeroButtonGroupStyleSet(
        filled: ZeroButtonGroupFilledStyle.fallback(primaryColor: primaryColor),
        outlined:
            ZeroButtonGroupOutlinedStyle.fallback(primaryColor: primaryColor),
        text: ZeroButtonGroupTextStyle.fallback(),
        underline:
            ZeroButtonGroupUnderlineStyle.fallback(primaryColor: primaryColor),
      );

  /// Copy the current instance with the new value given
  ZeroButtonGroupStyleSet copyWith({
    ZeroButtonGroupStyle? filled,
    ZeroButtonGroupStyle? outlined,
    ZeroButtonGroupStyle? text,
    ZeroButtonGroupStyle? underline,
  }) {
    return ZeroButtonGroupStyleSet(
      filled: filled ?? this.filled,
      outlined: outlined ?? this.outlined,
      text: text ?? this.text,
      underline: underline ?? this.underline,
    );
  }

  ZeroButtonGroupStyleSet merge(ZeroButtonGroupStyleSet? other) {
    if (other == null) return this;

    return copyWith(
      filled: filled?.merge(other.filled) ?? other.filled,
      outlined: outlined?.merge(other.outlined) ?? other.outlined,
      text: text?.merge(other.text) ?? other.text,
      underline: underline?.merge(other.underline) ?? other.underline,
    );
  }

  static ZeroButtonGroupStyleSet lerp(
      ZeroButtonGroupStyleSet? a, ZeroButtonGroupStyleSet? b, double t) {
    return ZeroButtonGroupStyleSet(
      filled: ZeroButtonGroupStyle.lerp(a?.filled, b?.filled, t),
      outlined: ZeroButtonGroupStyle.lerp(a?.outlined, b?.outlined, t),
      text: ZeroButtonGroupStyle.lerp(a?.text, b?.text, t),
      underline: ZeroButtonGroupStyle.lerp(a?.underline, b?.underline, t),
    );
  }
}
