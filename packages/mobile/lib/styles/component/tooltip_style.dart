import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroTooltipStyle with Diagnosticable {
  /// Sets the background color of the tooltip
  final Color? backgroundColor;

  /// Automatically background color [lightBackgroundColor] when brightness is [Brightness.light]
  ///
  /// If [backgroundColor] is null, then [lightBackgroundColor] can work,
  /// else it will use the color of [backgroundColor]
  final Color? lightBackgroundColor;

  /// Automatically background color [darkBackgroundColor] when brightness is [Brightness.dark]
  ///
  /// If [backgroundColor] is null, then [darkBackgroundColor] can work,
  /// else it will use the color of [backgroundColor]
  final Color? darkBackgroundColor;

  /// The text style label of the tooltip
  final TextStyle? textStyle;

  /// The border color of tooltip
  final Color? borderColor;

  /// [duration] is the duration that the tooltip will show
  /// the default duration is 2 seconds
  final Duration? duration;

  const ZeroTooltipStyle({
    this.backgroundColor,
    this.lightBackgroundColor,
    this.darkBackgroundColor,
    this.textStyle,
    this.borderColor,
    this.duration,
  });

  /// A default value style of [ZeroTooltipStyle]
  static ZeroTooltipStyle fallback({
    Color? lightColor,
    Color? darkColor,
    Color? borderColor,
  }) =>
      ZeroTooltipStyle(
        lightBackgroundColor: lightColor ?? ZeroColors.white,
        darkBackgroundColor: darkColor ?? ZeroColors.neutral[10],
        textStyle: const TextStyle(fontSize: 12),
        borderColor: borderColor ?? ZeroColors.neutral[2],
        duration: const Duration(seconds: 2),
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroTooltipStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroTooltipStyle copyWith({
    Color? backgroundColor,
    Color? lightBackgroundColor,
    Color? darkBackgroundColor,
    TextStyle? textStyle,
    Color? borderColor,
    Duration? duration,
  }) {
    return ZeroTooltipStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      lightBackgroundColor: lightBackgroundColor ?? this.lightBackgroundColor,
      darkBackgroundColor: darkBackgroundColor ?? this.darkBackgroundColor,
      textStyle: textStyle ?? this.textStyle,
      borderColor: borderColor ?? this.borderColor,
      duration: duration ?? this.duration,
    );
  }

  ZeroTooltipStyle merge(ZeroTooltipStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      lightBackgroundColor: other.lightBackgroundColor,
      darkBackgroundColor: other.darkBackgroundColor,
      textStyle: textStyle?.merge(other.textStyle) ?? other.textStyle,
      borderColor: other.borderColor,
      duration: other.duration,
    );
  }

  static ZeroTooltipStyle lerp(
      ZeroTooltipStyle? a, ZeroTooltipStyle? b, double t) {
    return ZeroTooltipStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      lightBackgroundColor:
          Color.lerp(a?.lightBackgroundColor, b?.lightBackgroundColor, t),
      darkBackgroundColor:
          Color.lerp(a?.darkBackgroundColor, b?.darkBackgroundColor, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      borderColor: Color.lerp(a?.borderColor, b?.backgroundColor, t),
      duration: t < 0.5 ? a?.duration : b?.duration,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('lightBackgroundColor', lightBackgroundColor))
      ..add(ColorProperty('darkBackgroundColor', darkBackgroundColor))
      ..add(ColorProperty('borderColor', borderColor));
  }
}
