import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroCheckboxStyle with Diagnosticable {
  /// Border & background color when the checkbox is checked
  ///
  /// By default [activeColor] is [ZeroThemeData.primaryColor]
  final Color? activeColor;

  /// Border color when the checkbox is unchecked
  final Color? inactiveColor;

  /// Border/background color when checkbox is disabled
  final Color? disabledColor;

  final Color? checkColor;

  /// Border radius of checkbox
  final BorderRadius? borderRadius;

  const ZeroCheckboxStyle({
    this.activeColor,
    this.inactiveColor,
    this.disabledColor,
    this.checkColor,
    this.borderRadius,
  });

  /// A default value style of [ZeroCheckboxStyle]
  static ZeroCheckboxStyle fallback({
    Color? activeColor,
    Color? inactiveColor,
    Color? disabledColor,
    Color? checkColor,
    BorderRadius? borderRadius,
  }) =>
      ZeroCheckboxStyle(
        activeColor: activeColor ?? ZeroColors.primary,
        borderRadius: borderRadius ?? BorderRadius.circular(2),
        disabledColor: disabledColor ?? ZeroColors.neutral[8],
        inactiveColor: inactiveColor ?? ZeroColors.neutral[7],
        checkColor: checkColor ?? ZeroColors.white,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroCheckBoxStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroCheckboxStyle copyWith({
    Color? activeColor,
    Color? inactiveColor,
    Color? disabledColor,
    Color? checkColor,
    BorderRadius? borderRadius,
  }) {
    return ZeroCheckboxStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      disabledColor: disabledColor ?? this.disabledColor,
      checkColor: checkColor ?? this.checkColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  ZeroCheckboxStyle merge(ZeroCheckboxStyle? other) {
    if (other == null) return this;

    return copyWith(
      activeColor: other.activeColor,
      disabledColor: other.disabledColor,
      checkColor: other.checkColor,
      inactiveColor: other.inactiveColor,
      borderRadius: other.borderRadius,
    );
  }

  static ZeroCheckboxStyle lerp(
      ZeroCheckboxStyle? a, ZeroCheckboxStyle? b, double t) {
    return ZeroCheckboxStyle(
      activeColor: Color.lerp(a?.activeColor, b?.activeColor, t),
      inactiveColor: Color.lerp(a?.inactiveColor, b?.inactiveColor, t),
      disabledColor: Color.lerp(a?.disabledColor, b?.disabledColor, t),
      checkColor: Color.lerp(a?.checkColor, b?.checkColor, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }

  /// Convert [ZeroCheckboxStyle] to theme data checkbox material [CheckboxThemeData]
  CheckboxThemeData toCheckBoxTheme() {
    Color? checkStateColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) return checkColor;
      return Colors.transparent;
    }

    return CheckboxThemeData(
      fillColor: MaterialStateProperty.all(activeColor),
      checkColor: MaterialStateProperty.resolveWith(checkStateColor),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: inactiveColor ?? Colors.transparent),
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      side: BorderSide(color: inactiveColor ?? Colors.transparent),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('disabledColor', disabledColor))
      ..add(ColorProperty('checkColor', checkColor));
  }
}
