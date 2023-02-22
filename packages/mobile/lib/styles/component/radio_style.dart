import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroRadioStyle with Diagnosticable {
  /// Border color when the radio is checked
  ///
  /// By default [activeColor] is [ZeroThemeData.primaryColor]
  final Color? activeColor;

  /// Border color when the radio is unchecked
  final Color? inactiveColor;

  /// Border/background color when radio is disabled
  final Color? disabledColor;

  const ZeroRadioStyle({
    this.activeColor,
    this.inactiveColor,
    this.disabledColor,
  });

  /// A default value style of [ZeroRadioStyle]
  static ZeroRadioStyle fallback({
    Color? activeColor,
    Color? inactiveColor,
    Color? disabledColor,
  }) =>
      ZeroRadioStyle(
        activeColor: activeColor ?? ZeroColors.primary,
        disabledColor: disabledColor ?? ZeroColors.neutral[8],
        inactiveColor: inactiveColor ?? ZeroColors.neutral[7],
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroRadioStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroRadioStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? disabledColor,
  }) {
    return ZeroRadioStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  ZeroRadioStyle merge(ZeroRadioStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      disabledColor: other.disabledColor,
      inactiveColor: other.inactiveColor,
    );
  }

  static ZeroRadioStyle lerp(ZeroRadioStyle? a, ZeroRadioStyle? b, double t) {
    return ZeroRadioStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      disabledColor: Color.lerp(a?.disabledColor, b?.disabledColor, t),
    );
  }

  /// Convert [ZeroRadioStyle] to theme data radio material [RadioThemeData]
  RadioThemeData toRadioTheme() {
    Color fillColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return activeColor ?? Colors.transparent;
      }
      if (states.contains(MaterialState.disabled)) {
        return disabledColor ?? Colors.transparent;
      }
      return inactiveColor ?? Colors.transparent;
    }

    return RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(fillColor),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('disabledColor', disabledColor));
  }
}
