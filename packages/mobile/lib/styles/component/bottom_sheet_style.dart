import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroBottomSheetStyle with Diagnosticable {
  /// The background coolor of bottom sheet
  final Color? backgroundColor;

  /// The color of the bottom sheet handle
  final Color? handleColor;

  /// Raise the bottom sheet handle, when [useHandle] is true
  final bool? useHandle;

  /// The Border radius of the bottom sheet
  final BorderRadiusGeometry? borderRadius;

  /// Border radius for the bottom sheet
  final Color? barierColor;

  final double? elevation;

  const ZeroBottomSheetStyle({
    this.backgroundColor,
    this.handleColor,
    this.useHandle,
    this.borderRadius,
    this.barierColor,
    this.elevation,
  });

  /// A default value style of [ZeroBottomSheetStyle]
  static ZeroBottomSheetStyle fallback({
    Color? backgroundColor,
    Color? handleColor,
  }) =>
      ZeroBottomSheetStyle(
        backgroundColor: backgroundColor ?? ZeroColors.white,
        handleColor: handleColor ?? ZeroColors.neutral[7],
        barierColor: null,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        useHandle: true,
        elevation: 10,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroBottomSheetStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroBottomSheetStyle copyWith({
    Color? backgroundColor,
    Color? handleColor,
    Color? barierColor,
    BorderRadiusGeometry? borderRadius,
    bool? useHandle,
    double? elevation,
  }) {
    return ZeroBottomSheetStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      handleColor: handleColor ?? this.handleColor,
      barierColor: barierColor ?? this.barierColor,
      borderRadius: borderRadius ?? this.borderRadius,
      useHandle: useHandle ?? this.useHandle,
      elevation: elevation ?? this.elevation,
    );
  }

  ZeroBottomSheetStyle merge(ZeroBottomSheetStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      handleColor: other.handleColor,
      barierColor: other.barierColor,
      borderRadius: other.borderRadius,
      useHandle: other.useHandle,
      elevation: other.elevation,
    );
  }

  static ZeroBottomSheetStyle lerp(
      ZeroBottomSheetStyle? a, ZeroBottomSheetStyle? b, double t) {
    return ZeroBottomSheetStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      handleColor: Color.lerp(a?.handleColor, b?.handleColor, t),
      barierColor: Color.lerp(a?.barierColor, b?.barierColor, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
      useHandle: t < 0.5 ? a?.useHandle : b?.useHandle,
      elevation: t < 0.5 ? a?.elevation : b?.elevation,
    );
  }

  /// Convert [ZeroBottomSheetStyle] to theme data bottom sheet material [BottomSheetThemeData]
  BottomSheetThemeData toBottomSheetTheme() => BottomSheetThemeData(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        modalBarrierColor: barierColor,
        elevation: elevation,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('handleColor', handleColor))
      ..add(ColorProperty('barierColor', barierColor))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>(
          'borderRadius', borderRadius))
      ..add(DiagnosticsProperty<bool>('useHandle', useHandle))
      ..add(DoubleProperty('elevation', elevation));
  }
}
