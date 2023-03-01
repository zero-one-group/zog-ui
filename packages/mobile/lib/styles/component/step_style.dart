import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../zog_ui.dart';

class ZeroStepStyle with Diagnosticable {
  final Color? inactiveColor;
  final Color? activeColor;
  final Color? errorColor;
  final Color? iconColor;
  final TextStyle? indexTextStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? contentTextStyle;
  final TextStyle? labelTextStyle;

  const ZeroStepStyle({
    this.inactiveColor,
    this.activeColor,
    this.errorColor,
    this.iconColor,
    this.indexTextStyle,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.contentTextStyle,
    this.labelTextStyle,
  });

  static ZeroStepStyle fallback({
    Color? inactiveColor,
    Color? activeColor,
    Color? errorColor,
    Color? iconColor,
    TextStyle? indexTextStyle,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? contentTextStyle,
    TextStyle? labelTextStyle,
  }) =>
      ZeroStepStyle(
        inactiveColor: inactiveColor ?? ZeroColors.neutral,
        activeColor: activeColor ?? ZeroColors.primary,
        errorColor: errorColor ?? ZeroColors.danger,
        iconColor: iconColor ?? ZeroColors.white,
        indexTextStyle: indexTextStyle ??
            const TextStyle(
              color: ZeroColors.white,
              fontSize: 12,
            ),
        titleTextStyle: titleTextStyle ??
            const TextStyle(
              color: ZeroColors.neutral,
              fontSize: 14,
            ),
        subtitleTextStyle: subtitleTextStyle ??
            const TextStyle(
              color: ZeroColors.neutral,
              fontSize: 12,
            ),
        contentTextStyle: contentTextStyle ??
            const TextStyle(
              color: ZeroColors.neutral,
              fontSize: 12,
            ),
        labelTextStyle: labelTextStyle ??
            const TextStyle(
              color: ZeroColors.neutral,
              fontSize: 12,
            ),
      );

  ZeroStepStyle copyWith({
    Color? inactiveColor,
    Color? activeColor,
    Color? errorColor,
    Color? iconColor,
    TextStyle? indexTextStyle,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? contentTextStyle,
    TextStyle? labelTextStyle,
    double? stepSize,
  }) =>
      ZeroStepStyle(
        inactiveColor: inactiveColor ?? this.inactiveColor,
        activeColor: activeColor ?? this.activeColor,
        errorColor: errorColor ?? this.errorColor,
        iconColor: iconColor ?? this.iconColor,
        indexTextStyle: indexTextStyle ?? this.indexTextStyle,
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,
        contentTextStyle: contentTextStyle ?? this.contentTextStyle,
        labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      );

  ZeroStepStyle merge(ZeroStepStyle? style) {
    if (style == null) return this;
    return copyWith(
      inactiveColor: style.inactiveColor,
      activeColor: style.activeColor,
      errorColor: style.errorColor,
      iconColor: style.iconColor,
      indexTextStyle: style.indexTextStyle,
      titleTextStyle: style.titleTextStyle,
      subtitleTextStyle: style.subtitleTextStyle,
      contentTextStyle: style.contentTextStyle,
      labelTextStyle: style.labelTextStyle,
    );
  }

  static ZeroStepStyle lerp(
    ZeroStepStyle? a,
    ZeroStepStyle? b,
    double t,
  ) =>
      ZeroStepStyle(
        inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
        activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
        errorColor: Color.lerp(a?.errorColor, b?.errorColor, t),
        iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
        indexTextStyle: TextStyle.lerp(a?.indexTextStyle, b?.indexTextStyle, t),
        titleTextStyle: TextStyle.lerp(a?.titleTextStyle, b?.titleTextStyle, t),
        subtitleTextStyle:
            TextStyle.lerp(a?.subtitleTextStyle, b?.subtitleTextStyle, t),
        contentTextStyle:
            TextStyle.lerp(a?.contentTextStyle, b?.contentTextStyle, t),
        labelTextStyle: TextStyle.lerp(a?.labelTextStyle, b?.labelTextStyle, t),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('inactiveColor', inactiveColor));
    properties.add(ColorProperty('activeColor', activeColor));
    properties.add(ColorProperty('errorColor', errorColor));
    properties.add(ColorProperty('iconColor', iconColor));
    properties
        .add(DiagnosticsProperty<TextStyle>('indexTextStyle', indexTextStyle));
    properties
        .add(DiagnosticsProperty<TextStyle>('titleTextStyle', titleTextStyle));
    properties.add(
        DiagnosticsProperty<TextStyle>('subtitleTextStyle', subtitleTextStyle));
    properties.add(
        DiagnosticsProperty<TextStyle>('contentTextStyle', contentTextStyle));
    properties
        .add(DiagnosticsProperty<TextStyle>('labelTextStyle', labelTextStyle));
  }
}
