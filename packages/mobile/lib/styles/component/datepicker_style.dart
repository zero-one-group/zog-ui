import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroCalendarPickerStyle with Diagnosticable {
  /// Creates a theme that can be used for [ZeroCalendarPickerStyle] or
  /// [ZeroThemeData.datePickerStyle.calendar].
  const ZeroCalendarPickerStyle({
    this.headerTextStyle,
    this.dayTextStyle,
    this.enabledDayColor,
    this.disabledDayColor,
    this.selectedDayColor,
    this.selectedDayBackground,
    this.highlightColor,
    this.todayColor,
    this.controlColor,
    this.inactiveControlColor,
    this.monthListTileStyle,
    this.yearListTileStyle,
    this.monthLeftIcon,
    this.yearLeftIcon,
  });

  /// Used to configure the [TextStyle]s for the text in the header.  /// Used to configure the [TextStyle]s for the text in the header.
  ///
  /// If this is null, the date picker defaults to the overall theme's
  /// [ZeroTypography.bodySmall] and with color [ColorScheme.onSurface].
  final TextStyle? headerTextStyle;

  ///
  /// If this is null, the date picker defaults to the overall theme's
  /// [ZeroTypography.labelSmall] and with color [ColorScheme.onSurface].
  final TextStyle? dayTextStyle;

  /// If this is null the color defaults to [ColorScheme.onSurface.withOpacity(0.87)]
  final Color? enabledDayColor;

  /// If this is null the color defaults to [ColorScheme.onSurface.withOpacity(0.38);]
  final Color? disabledDayColor;

  /// If this is null the color defaults to [ColorScheme.onPrimary]
  final Color? selectedDayColor;

  /// If this is null the color defaults to [ColorScheme.onPrimary]
  final Color? selectedDayBackground;

  /// If this is null the color defaults to [ColorScheme.primary.withOpacity(0.12)]
  final Color? highlightColor;

  /// If this is null the color defaults to [ColorScheme.primary]
  final Color? todayColor;

  /// The active color of the control to select year and month.
  /// If this is null the color defaults to [ColorScheme.onSurface]
  final Color? controlColor;

  /// The inactive color of the control to select year and month.
  /// If this is null the color defaults to [context.theme.disabledColor]
  final Color? inactiveControlColor;

  /// [ZeroListTileStyle] for month list.
  /// If null, it defaults to default styles of [ZeroListTileStyle.fallback()]
  final ZeroListTileStyle? monthListTileStyle;

  /// [ZeroListTileStyle] for month list.
  /// If null, it defaults to default styles of [ZeroListTileStyle.fallback()]
  final ZeroListTileStyle? yearListTileStyle;

  /// Widget to indicate that a particular month item is selected. It defaults to [Icon(Icons.check)]
  final Widget? monthLeftIcon;

  /// Widget to indicate that a particular year item is selected. It defaults to [Icon(Icons.check)]
  final Widget? yearLeftIcon;

  /// Creates a copy of this object with the given fields replaced with the
  /// new values.
  ZeroCalendarPickerStyle copyWith(
      {TextStyle? headerTextStyle,
      TextStyle? dayTextStyle,
      Color? enabledDayColor,
      Color? disabledDayColor,
      Color? selectedDayColor,
      Color? selectedDayBackground,
      Color? highlightColor,
      Color? todayColor,
      Color? controlColor,
      Color? inactiveControlColor,
      ZeroListTileStyle? monthListTileStyle,
      ZeroListTileStyle? yearListTileStyle,
      Widget? monthLeftIcon,
      Widget? yearLeftIcon}) {
    return ZeroCalendarPickerStyle(
        headerTextStyle: headerTextStyle ?? this.headerTextStyle,
        dayTextStyle: dayTextStyle ?? this.dayTextStyle,
        enabledDayColor:
            enabledDayColor ?? enabledDayColor ?? this.enabledDayColor,
        disabledDayColor: disabledDayColor ?? this.disabledDayColor,
        selectedDayBackground:
            selectedDayBackground ?? this.selectedDayBackground,
        selectedDayColor: selectedDayColor ?? this.selectedDayColor,
        highlightColor: highlightColor ?? this.highlightColor,
        todayColor: todayColor ?? this.todayColor,
        controlColor: controlColor ?? this.controlColor,
        inactiveControlColor: inactiveControlColor ?? this.inactiveControlColor,
        monthListTileStyle: monthListTileStyle ?? this.monthListTileStyle,
        yearListTileStyle: yearListTileStyle ?? this.yearListTileStyle,
        monthLeftIcon: monthLeftIcon ?? this.monthLeftIcon,
        yearLeftIcon: yearLeftIcon ?? this.yearLeftIcon);
  }

  /// Linearly interpolate between two date picker themes.
  ///
  /// The argument `t` must not be null.
  static ZeroCalendarPickerStyle lerp(
      ZeroCalendarPickerStyle? a, ZeroCalendarPickerStyle? b, double t) {
    return ZeroCalendarPickerStyle(
      dayTextStyle: TextStyle.lerp(a?.dayTextStyle, b?.dayTextStyle, t),
      headerTextStyle:
          TextStyle.lerp(a?.headerTextStyle, b?.headerTextStyle, t),
      enabledDayColor: Color.lerp(a?.enabledDayColor, b?.enabledDayColor, t),
      disabledDayColor: Color.lerp(a?.disabledDayColor, b?.disabledDayColor, t),
      selectedDayBackground:
          Color.lerp(a?.selectedDayBackground, b?.selectedDayBackground, t),
      selectedDayColor: Color.lerp(a?.selectedDayColor, b?.selectedDayColor, t),
      todayColor: Color.lerp(a?.todayColor, b?.todayColor, t),
      highlightColor: Color.lerp(a?.highlightColor, b?.highlightColor, t),
      controlColor: Color.lerp(a?.controlColor, b?.controlColor, t),
      inactiveControlColor:
          Color.lerp(a?.inactiveControlColor, b?.inactiveControlColor, t),
      monthListTileStyle: ZeroListTileStyle.lerp(
          a?.monthListTileStyle, b?.monthListTileStyle, t),
      yearListTileStyle:
          ZeroListTileStyle.lerp(a?.yearListTileStyle, b?.yearListTileStyle, t),
      monthLeftIcon: t < 0.5 ? a?.monthLeftIcon : b?.monthLeftIcon,
      yearLeftIcon: t < 0.5 ? a?.yearLeftIcon : b?.yearLeftIcon,
    );
  }

  ZeroCalendarPickerStyle merge(ZeroCalendarPickerStyle? other) {
    if (other == null) return this;

    return copyWith(
      headerTextStyle: other.headerTextStyle,
      dayTextStyle: other.dayTextStyle,
      enabledDayColor: other.enabledDayColor,
      disabledDayColor: other.disabledDayColor,
      selectedDayBackground: other.selectedDayBackground,
      selectedDayColor: other.selectedDayColor,
      highlightColor: other.highlightColor,
      todayColor: other.todayColor,
      controlColor: other.controlColor,
      inactiveControlColor: other.inactiveControlColor,
      monthListTileStyle: other.monthListTileStyle,
      yearListTileStyle: other.yearListTileStyle,
      monthLeftIcon: other.monthLeftIcon,
      yearLeftIcon: other.yearLeftIcon,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ZeroCalendarPickerStyle &&
        other.enabledDayColor == enabledDayColor &&
        other.disabledDayColor == disabledDayColor &&
        other.selectedDayBackground == selectedDayBackground &&
        other.todayColor == todayColor &&
        other.highlightColor == highlightColor &&
        other.controlColor == controlColor &&
        other.inactiveControlColor == inactiveControlColor &&
        other.headerTextStyle == headerTextStyle &&
        other.dayTextStyle == dayTextStyle &&
        other.monthListTileStyle == monthListTileStyle &&
        other.yearListTileStyle == yearListTileStyle &&
        other.monthLeftIcon == monthLeftIcon &&
        other.yearLeftIcon == yearLeftIcon;
  }

  @override
  int get hashCode => Object.hash(
        enabledDayColor,
        disabledDayColor,
        selectedDayBackground,
        todayColor,
        highlightColor,
        controlColor,
        inactiveControlColor,
        headerTextStyle,
        dayTextStyle,
        monthListTileStyle,
        yearListTileStyle,
        monthLeftIcon,
        yearLeftIcon,
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        ColorProperty('enabledDayColor', enabledDayColor, defaultValue: null));
    properties.add(ColorProperty('disabledDayColor', disabledDayColor,
        defaultValue: null));
    properties.add(ColorProperty('selectedDayColor', selectedDayColor,
        defaultValue: null));
    properties.add(
        ColorProperty('highlightColor', highlightColor, defaultValue: null));
    properties.add(ColorProperty('todayColor', todayColor, defaultValue: null));
    properties.add(ColorProperty('selectedDayBackground', selectedDayBackground,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'headerTextStyle', headerTextStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>('dayTextStyle', dayTextStyle,
        defaultValue: null));
  }
}

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
///
/// TODO: separate styles between picker body and header
class ZeroDatePickerStyle with Diagnosticable {
  /// Creates a theme that can be used for [ZeroDatePickerStyle] or
  /// [ZeroThemeData.datePickerStyle].
  const ZeroDatePickerStyle({
    this.headerBackgroundColor,
    this.pickerBackgroundColor,
    this.dateTextStyle,
    this.entryModeIconColor,
    this.helpTextStyle,
    this.shape,
    this.textfieldStyle,
    this.elevation,
    this.insetPadding,
    this.calendarStyle,
  });

  /// The background color of the header part.
  ///
  /// If this is null, the date picker defaults to the overall theme's
  /// [ColorScheme.background].
  final Color? headerBackgroundColor;

  /// The background color of the picker part.
  ///
  /// If this is null, the date picker defaults to the overall theme's
  /// [ColorScheme.background].
  final Color? pickerBackgroundColor;

  final TextStyle? dateTextStyle;

  /// The color of the entry mode [IconButton].
  ///
  /// If this is null, the date picker defaults to:
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.onSurface.withOpacity(
  ///   Theme.of(context).colorScheme.brightness == Brightness.dark ? 1.0 : 0.6,
  /// )
  /// ```
  final Color? entryModeIconColor;

  /// Used to configure the [TextStyle]s for the helper text in the header.
  ///
  /// If this is null, the date picker defaults to the overall theme's
  /// [ZeroTypography.labelSmall].
  final TextStyle? helpTextStyle;

  /// The shape of the [Dialog] that the date picker is presented in.
  ///
  /// If this is null, the date picker defaults to
  /// `RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))`.
  final ShapeBorder? shape;

  /// The input decoration theme for the [TextField]s in the date picker.
  ///
  /// If this is null, the date picker provides its own defaults.
  final ZeroTextfieldStyle? textfieldStyle;

  /// The elevation of the [ZeroDatePickerDialog]
  final double? elevation;

  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  final EdgeInsets? insetPadding;

  /// Style for [ZeroCalendarDatePicker]
  final ZeroCalendarPickerStyle? calendarStyle;

  /// Creates a copy of this object with the given fields replaced with the
  /// new values.
  ZeroDatePickerStyle copyWith({
    Color? headerBackgroundColor,
    Color? pickerBackgroundColor,
    Color? entryModeIconColor,
    TextStyle? dateTextStyle,
    TextStyle? helpTextStyle,
    ShapeBorder? shape,
    ZeroTextfieldStyle? textfieldStyle,
    double? elevation,
    EdgeInsets? insetPadding,
    ZeroCalendarPickerStyle? calendarStyle,
  }) {
    return ZeroDatePickerStyle(
        headerBackgroundColor:
            headerBackgroundColor ?? this.headerBackgroundColor,
        pickerBackgroundColor:
            pickerBackgroundColor ?? this.pickerBackgroundColor,
        entryModeIconColor: entryModeIconColor ?? this.entryModeIconColor,
        helpTextStyle: helpTextStyle ?? this.helpTextStyle,
        dateTextStyle: dateTextStyle ?? this.dateTextStyle,
        shape: shape ?? this.shape,
        textfieldStyle: textfieldStyle ?? this.textfieldStyle,
        elevation: elevation ?? this.elevation,
        insetPadding: insetPadding ?? this.insetPadding,
        calendarStyle: calendarStyle ?? this.calendarStyle);
  }

  /// Linearly interpolate between two date picker themes.
  ///
  /// The argument `t` must not be null.
  static ZeroDatePickerStyle lerp(
      ZeroDatePickerStyle? a, ZeroDatePickerStyle? b, double t) {
    return ZeroDatePickerStyle(
        headerBackgroundColor:
            Color.lerp(a?.headerBackgroundColor, b?.headerBackgroundColor, t),
        pickerBackgroundColor:
            Color.lerp(a?.pickerBackgroundColor, b?.pickerBackgroundColor, t),
        entryModeIconColor:
            Color.lerp(a?.entryModeIconColor, b?.entryModeIconColor, t),
        helpTextStyle: TextStyle.lerp(a?.helpTextStyle, b?.helpTextStyle, t),
        dateTextStyle: TextStyle.lerp(a?.dateTextStyle, b?.dateTextStyle, t),
        shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
        textfieldStyle: t < 0.5 ? a?.textfieldStyle : b?.textfieldStyle,
        calendarStyle: ZeroCalendarPickerStyle.lerp(
            a?.calendarStyle, b?.calendarStyle, t));
  }

  @override
  int get hashCode => Object.hash(pickerBackgroundColor, entryModeIconColor,
      helpTextStyle, shape, textfieldStyle, elevation, insetPadding);

  static ZeroDatePickerStyle fallback(
      {Color? headerBackgroundColor,
      Color? pickerBackgroundColor,
      Color? entryModeIconColor,
      TextStyle? helpTextStyle,
      TextStyle? dateTextStyle,
      ShapeBorder? shape,
      ZeroTextfieldStyle? textfieldStyle,
      double? elevation,
      EdgeInsets? insetPadding,
      ZeroCalendarPickerStyle? calendarStyle}) {
    return ZeroDatePickerStyle(
        headerBackgroundColor: headerBackgroundColor,
        pickerBackgroundColor: pickerBackgroundColor,
        entryModeIconColor: entryModeIconColor,
        helpTextStyle: helpTextStyle,
        dateTextStyle: dateTextStyle,
        shape: shape,
        textfieldStyle: textfieldStyle,
        elevation: elevation,
        insetPadding: insetPadding,
        calendarStyle: calendarStyle);
  }

  ZeroDatePickerStyle merge(ZeroDatePickerStyle? other) {
    if (other == null) return this;

    return copyWith(
      headerBackgroundColor: other.headerBackgroundColor,
      pickerBackgroundColor: other.pickerBackgroundColor,
      entryModeIconColor: other.entryModeIconColor,
      helpTextStyle: other.helpTextStyle,
      dateTextStyle: other.dateTextStyle,
      shape: other.shape,
      textfieldStyle: other.textfieldStyle,
      elevation: other.elevation,
      insetPadding: other.insetPadding,
      calendarStyle: other.calendarStyle,
    );
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
        other.headerBackgroundColor == headerBackgroundColor &&
        other.pickerBackgroundColor == pickerBackgroundColor &&
        other.entryModeIconColor == entryModeIconColor &&
        other.helpTextStyle == helpTextStyle &&
        other.dateTextStyle == dateTextStyle &&
        other.shape == shape &&
        other.elevation == elevation &&
        other.textfieldStyle == textfieldStyle &&
        other.insetPadding == insetPadding &&
        other.calendarStyle == calendarStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('headerBackgroundColor', headerBackgroundColor,
        defaultValue: null));
    properties.add(ColorProperty('pickerBackgroundColor', pickerBackgroundColor,
        defaultValue: null));
    properties.add(ColorProperty('entryModeIconColor', entryModeIconColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'helpTextStyle', helpTextStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'dateTextStyle', dateTextStyle,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<ZeroTextfieldStyle>(
        'textfieldStyle', textfieldStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty<ZeroCalendarPickerStyle>(
        'calendarStyle', calendarStyle,
        defaultValue: null));
  }
}
