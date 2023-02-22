import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroSliderStyle with Diagnosticable {
  /// [activeColor] is the color of the active line of the slider
  ///
  /// By default use from theme [ZeroThemeData.primaryColor]
  final Color? activeColor;

  /// [inactiveColor] is the color of the inactive line of the slider
  /// when this value is null, the color will be [activeColor] with opacity 0.3
  ///
  /// By default use from theme [ZeroThemeData.primaryColor].withOpacity(0.3)
  final Color? inactiveColor;

  /// [tickColor] is the color of the ticks
  /// the default color is [ZeroColors.neutral8]
  final Color? tickColor;

  /// [thumbColor] is the color of the thumb of the slider
  /// when this value is null, the color will be [activeColor]
  final Color? thumbColor;

  /// [tickBehavior] is a boolean that indicates if the slider will snap to the ticks
  final bool? tickBehavior;

  /// [tooltipVariant] is the variant of the tooltip
  /// the default value is [ZeroTooltipVariant.rounded]
  /// the available variants are:
  /// 1. [ZeroTooltipVariant.rounded] - is the default variant of the tooltip
  /// 2. [ZeroTooltipVariant.custom] - is the custom variant of the tooltip
  /// 3. [ZeroTooltipVariant.none] - is the variant of the tooltip that doesn't show the tooltip
  final ZeroTooltipVariant? tooltipVariant;

  const ZeroSliderStyle({
    this.activeColor,
    this.inactiveColor,
    this.tickColor,
    this.thumbColor,
    this.tickBehavior,
    this.tooltipVariant,
  });

  /// A default value style of [ZeroSliderStyle]
  static ZeroSliderStyle fallback({
    Color? primaryColor,
    Color? thickColor,
    Color? thumbColor,
    bool? tickBehavior,
  }) =>
      ZeroSliderStyle(
        activeColor: primaryColor ?? ZeroColors.primary,
        inactiveColor: primaryColor?.withOpacity(0.3) ??
            ZeroColors.primary.withOpacity(0.3),
        tickColor: thickColor ?? primaryColor,
        tooltipVariant: ZeroTooltipVariant.rounded,
        thumbColor: thumbColor ?? primaryColor,
        tickBehavior: tickBehavior ?? false,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroSliderStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroSliderStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? tickColor,
    ZeroTooltipVariant? tooltipVariant,
    Color? thumbColor,
    bool? tickBehavior,
  }) {
    return ZeroSliderStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      tickColor: tickColor ?? this.tickColor,
      tooltipVariant: tooltipVariant ?? this.tooltipVariant,
      thumbColor: thumbColor ?? this.thumbColor,
      tickBehavior: tickBehavior ?? this.tickBehavior,
    );
  }

  ZeroSliderStyle merge(ZeroSliderStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      inactiveColor: other.inactiveColor,
      tooltipVariant: other.tooltipVariant,
      tickColor: other.tickColor,
      thumbColor: other.thumbColor,
      tickBehavior: other.tickBehavior,
    );
  }

  static ZeroSliderStyle lerp(
      ZeroSliderStyle? a, ZeroSliderStyle? b, double t) {
    return ZeroSliderStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      tickColor: Color.lerp(a?.tickColor, b?.tickColor, t),
      thumbColor: Color.lerp(a?.thumbColor, b?.thumbColor, t),
      tooltipVariant: t < 0.5 ? a?.tooltipVariant : b?.tooltipVariant,
      tickBehavior: t < 0.5 ? a?.tickBehavior : b?.tickBehavior,
    );
  }

  /// Convert [ZeroSliderStyle] to theme data divider material [SliderThemeData]
  SliderThemeData toSliderTheme() => SliderThemeData(
        activeTrackColor: activeColor,
        inactiveTrackColor: inactiveColor,
        thumbColor: thumbColor,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('tickColor', tickColor))
      ..add(ColorProperty('thumbColor', thumbColor))
      ..add(StringProperty('tickBehavior', tickBehavior.toString()));
  }
}
