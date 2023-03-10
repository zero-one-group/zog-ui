import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// The typography applied to a [ZeroThemeData].
///
/// | Do                                                  | Don't                                                                             |
/// | :-------------------------------------------------- | :-------------------------------------------------------------------------------- |
/// | Pick one font for your UI.                          | Don't mix multiple fonts.                                                         |
/// | Use [body] for most text                            | Use "Caption" for primary action or any long strings.                             |
/// | Use "Base" for titles when space is constrained.    | Use "Header" or "Subheader" if text needs to wrap.                                |
/// | Keep to 50–60 letters per line for ease of reading. | Less than 20 characters or more than 60 characters per line is difficult to read. |
/// | Clip text, and wrap if multiple lines are enabled.  | Use ellipses to avoid visual clutter.                                             |
///
class ZeroTypography with Diagnosticable {
  /// The Heading 1 style
  final TextStyle? heading1;

  /// The Heading 2 style
  final TextStyle? heading2;

  /// The Heading 3 style
  final TextStyle? heading3;

  /// The Heading 4 style
  final TextStyle? heading4;

  /// The Heading 5 style
  final TextStyle? heading5;

  /// The Heading 6 style
  final TextStyle? heading6;

  /// The Subtitle 1 style
  final TextStyle? subtitle1;

  /// The Subtitle 2 style
  final TextStyle? subtitle2;

  /// The Body 1 style
  final TextStyle? body1;

  /// The Body 2 style
  ///
  /// This style using for default [Text] style widget form Material
  final TextStyle? body2;

  /// The Buttton text style
  ///
  /// This style use for [Button] text style
  final TextStyle? button;

  /// The caption text style
  final TextStyle? caption;

  /// The overline text style
  final TextStyle? overline;

  /// Creates a new [ZeroTypography]
  const ZeroTypography.raw({
    this.heading1,
    this.heading2,
    this.heading3,
    this.heading4,
    this.heading5,
    this.heading6,
    this.subtitle1,
    this.subtitle2,
    this.body1,
    this.body2,
    this.button,
    this.caption,
    this.overline,
  });

  /// The default typography according to a brightness or color.
  ///
  /// If [color] is null, [Colors.black] is used if [brightness] is light,
  /// otherwise [Colors.white] is used. If it's not null, [color] will be used.
  factory ZeroTypography.fromBrightness({
    Brightness? brightness,
    Color? color,
    String? fontFamily,
  }) {
    assert(
      brightness != null || color != null,
      'Either brightness or color must be provided',
    );

    // If color is null, brightness will not be null
    color ??=
        brightness == Brightness.light ? ZeroColors.black : ZeroColors.white;

    return ZeroTypography.raw(
      heading1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 56,
        color: color,
        fontFamily: fontFamily,
      ),
      heading2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 48,
        color: color,
        fontFamily: fontFamily,
      ),
      heading3: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 40,
        color: color,
        fontFamily: fontFamily,
      ),
      heading4: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 30,
        color: color,
        fontFamily: fontFamily,
      ),
      heading5: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 24,
        color: color,
        fontFamily: fontFamily,
      ),
      heading6: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: color,
        fontFamily: fontFamily,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color,
        fontFamily: fontFamily,
      ),
      subtitle2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
        fontFamily: fontFamily,
      ),
      body1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color,
        fontFamily: fontFamily,
      ),
      body2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
        fontFamily: fontFamily,
      ),
      button: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color,
        fontFamily: fontFamily,
      ),
      caption: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
        fontFamily: fontFamily,
      ),
      overline: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  /// It takes two `ZeroTypography` objects and a `double` value, and returns a new `ZeroTypography`
  /// object that is a blend of the two input objects
  static ZeroTypography lerp(ZeroTypography? a, ZeroTypography? b, double t) {
    return ZeroTypography.raw(
      heading1: TextStyle.lerp(a?.heading1, b?.heading1, t),
      heading2: TextStyle.lerp(a?.heading2, b?.heading2, t),
      heading3: TextStyle.lerp(a?.heading3, b?.heading3, t),
      heading4: TextStyle.lerp(a?.heading4, b?.heading4, t),
      heading5: TextStyle.lerp(a?.heading5, b?.heading5, t),
      heading6: TextStyle.lerp(a?.heading6, b?.heading6, t),
      subtitle1: TextStyle.lerp(a?.subtitle1, b?.subtitle1, t),
      subtitle2: TextStyle.lerp(a?.subtitle2, b?.subtitle2, t),
      body1: TextStyle.lerp(a?.body1, b?.body1, t),
      body2: TextStyle.lerp(a?.body2, b?.body2, t),
      overline: TextStyle.lerp(a?.overline, b?.overline, t),
      caption: TextStyle.lerp(a?.caption, b?.caption, t),
    );
  }

  /// Copy this with a new [ZeroTypography]
  ZeroTypography merge(ZeroTypography? typography) {
    if (typography == null) return this;

    return copyWith(
      heading1: typography.heading1,
      heading2: typography.heading2,
      heading3: typography.heading3,
      heading4: typography.heading4,
      heading5: typography.heading5,
      heading6: typography.heading6,
      subtitle1: typography.subtitle1,
      subtitle2: typography.subtitle2,
      body1: typography.body1,
      body2: typography.body2,
      overline: typography.overline,
      caption: typography.caption,
    );
  }

  ZeroTypography apply({
    String? fontFamily,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
  }) {
    return ZeroTypography.raw(
      heading1: heading1?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      heading2: heading2?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      heading3: heading3?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      heading4: heading4?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      heading5: heading5?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      heading6: heading6?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      subtitle1: subtitle1?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      subtitle2: subtitle2?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      body1: body1?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      body2: body2?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      overline: overline?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      caption: caption?.apply(
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
    );
  }

  TextTheme toTextTheme() {
    return TextTheme(
      bodyLarge: body1,
      bodyMedium: body2,
      titleMedium: subtitle1,
      titleSmall: subtitle2,
      labelLarge: button,
      bodySmall: caption,
      labelSmall: overline,
      headlineSmall: heading5,
      titleLarge: heading6,
      displayLarge: heading1,
      displayMedium: heading2,
      displaySmall: heading3,
      headlineMedium: heading4,
    );
  }

  ZeroTypography copyWith({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? button,
    TextStyle? caption,
    TextStyle? overline,
  }) {
    return ZeroTypography.raw(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      heading5: heading5 ?? this.heading5,
      heading6: heading6 ?? this.heading6,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      button: button ?? this.button,
      caption: caption ?? this.caption,
      overline: overline ?? this.overline,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<TextStyle>('heading1', heading1))
      ..add(DiagnosticsProperty<TextStyle>('heading2', heading2))
      ..add(DiagnosticsProperty<TextStyle>('heading3', heading3))
      ..add(DiagnosticsProperty<TextStyle>('heading4', heading4))
      ..add(DiagnosticsProperty<TextStyle>('heading5', heading5))
      ..add(DiagnosticsProperty<TextStyle>('heading6', heading6))
      ..add(DiagnosticsProperty<TextStyle>('subtitle1', subtitle1))
      ..add(DiagnosticsProperty<TextStyle>('subtitle2', subtitle2))
      ..add(DiagnosticsProperty<TextStyle>('body1', body1))
      ..add(DiagnosticsProperty<TextStyle>('body2', body2))
      ..add(DiagnosticsProperty<TextStyle>('overline', overline))
      ..add(DiagnosticsProperty<TextStyle>('caption', caption));
  }
}
