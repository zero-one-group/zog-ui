import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

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

  /// The border size of checkbox
  final double? borderSize;

  const ZeroCheckboxStyle({
    this.activeColor,
    this.inactiveColor,
    this.disabledColor,
    this.checkColor,
    this.borderRadius,
    this.borderSize,
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
        borderSize: 2,
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
    double? borderSize,
  }) {
    return ZeroCheckboxStyle(
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      disabledColor: disabledColor ?? this.disabledColor,
      checkColor: checkColor ?? this.checkColor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderSize: borderSize ?? this.borderSize,
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
      borderSize: other.borderSize,
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
      borderSize: t < 0.5 ? a?.borderSize : b?.borderSize,
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
      side: BorderSide(
        color: inactiveColor ?? Colors.transparent,
        width: borderSize ?? 1,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('activeColor', activeColor))
      ..add(ColorProperty('inactiveColor', inactiveColor))
      ..add(ColorProperty('disabledColor', disabledColor))
      ..add(ColorProperty('checkColor', checkColor))
      ..add(DoubleProperty('borderSize', borderSize));
  }
}
