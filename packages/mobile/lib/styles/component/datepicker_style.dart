import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// Defines the visual properties of the widget displayed with [showZeroDatePicker].
///
/// Descendant widgets obtain the current [ZeroDatePickerStyle] object using
/// `context.theme.datePickerStyle`. Instances of [ZeroDatePickerStyle]
/// can be customized with [ZeroDatePickerStyle.copyWith].
///
/// Typically a [ZeroDatePickerStyle] is specified as part of the overall
/// [ZeroTheme] with [ZeroThemeData.datePickerTheme].
///
/// All [ZeroDatePickerStyle] properties are `null` by default. When null,
/// [showZeroDatePicker] will provide its own defaults.
class ZeroDatePickerStyle with Diagnosticable {
  /// Creates a theme that can be used for [ZeroDatePickerStyle] or
  /// [ZeroThemeData.datePickerStyle].
  const ZeroDatePickerStyle({
    this.backgroundColor,
    this.dateTextStyle,
    this.entryModeIconColor,
    this.helpTextStyle,
    this.shape,
    this.textfieldStyle,
    this.elevation = 0,
  });

  /// The background color of a time picker.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ColorScheme.background].
  final Color? backgroundColor;

  final TextStyle? dateTextStyle;

  /// The color of the entry mode [IconButton].
  ///
  /// If this is null, the time picker defaults to:
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.onSurface.withOpacity(
  ///   Theme.of(context).colorScheme.brightness == Brightness.dark ? 1.0 : 0.6,
  /// )
  /// ```
  final Color? entryModeIconColor;

  /// Used to configure the [TextStyle]s for the helper text in the header.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ZeroTypography.labelSmall].
  final TextStyle? helpTextStyle;

  /// The shape of the [Dialog] that the time picker is presented in.
  ///
  /// If this is null, the time picker defaults to
  /// `RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))`.
  final ShapeBorder? shape;

  /// The input decoration theme for the [TextField]s in the time picker.
  ///
  /// If this is null, the time picker provides its own defaults.
  final ZeroTextfieldStyle? textfieldStyle;

  /// The elevation of the [ZeroDatePickerDialog]
  final double elevation;

  /// Creates a copy of this object with the given fields replaced with the
  /// new values.
  ZeroDatePickerStyle copyWith({
    Color? backgroundColor,
    Color? entryModeIconColor,
    TextStyle? helpTextStyle,
    ShapeBorder? shape,
    ZeroTextfieldStyle? textfieldStyle,
  }) {
    return ZeroDatePickerStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      entryModeIconColor: entryModeIconColor ?? this.entryModeIconColor,
      helpTextStyle: helpTextStyle ?? this.helpTextStyle,
      shape: shape ?? this.shape,
      textfieldStyle: textfieldStyle ?? this.textfieldStyle,
    );
  }

  /// Linearly interpolate between two time picker themes.
  ///
  /// The argument `t` must not be null.
  static ZeroDatePickerStyle lerp(
      ZeroDatePickerStyle? a, ZeroDatePickerStyle? b, double t) {
    // Workaround since BorderSide's lerp does not allow for null arguments.

    return ZeroDatePickerStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      entryModeIconColor:
          Color.lerp(a?.entryModeIconColor, b?.entryModeIconColor, t),
      helpTextStyle: TextStyle.lerp(a?.helpTextStyle, b?.helpTextStyle, t),
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      textfieldStyle: t < 0.5 ? a?.textfieldStyle : b?.textfieldStyle,
    );
  }

  @override
  int get hashCode => Object.hash(
        backgroundColor,
        entryModeIconColor,
        helpTextStyle,
        shape,
        textfieldStyle,
      );

  static ZeroDatePickerStyle fallback({
    Color? backgroundColor,
    Color? entryModeIconColor,
    TextStyle? helpTextStyle,
    ShapeBorder? shape,
    ZeroTextfieldStyle? textfieldStyle,
  }) {
    return ZeroDatePickerStyle(
        backgroundColor: backgroundColor,
        entryModeIconColor: entryModeIconColor,
        helpTextStyle: helpTextStyle,
        shape: shape,
        textfieldStyle: textfieldStyle);
  }

  ZeroDatePickerStyle merge(ZeroDatePickerStyle? other) {
    if (other == null) return this;

    return copyWith(
        backgroundColor: other.backgroundColor,
        entryModeIconColor: other.entryModeIconColor,
        helpTextStyle: other.helpTextStyle,
        shape: other.shape,
        textfieldStyle: other.textfieldStyle);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ZeroDatePickerStyle &&
        other.backgroundColor == backgroundColor &&
        other.entryModeIconColor == entryModeIconColor &&
        other.helpTextStyle == helpTextStyle &&
        other.shape == shape &&
        other.textfieldStyle == textfieldStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        ColorProperty('backgroundColor', backgroundColor, defaultValue: null));
    properties.add(ColorProperty('entryModeIconColor', entryModeIconColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'helpTextStyle', helpTextStyle,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<ZeroTextfieldStyle>(
        'textfieldStyle', textfieldStyle,
        defaultValue: null));
  }
}
