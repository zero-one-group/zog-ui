import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/components/icons/zero_icons.dart';
import 'package:zog_ui/styles/colors.dart';

class ZeroSnackbarStyle with Diagnosticable {
  /// [backgroundColor] is the background color of the snackbar.
  final Color? backgroundColor;

  /// [duration] is the duration that the snackbar will be displayed, if duration is zero, the snackbar will not be dismissed automatically.
  ///
  /// By default duration is 2 seconds
  final Duration? duration;

  /// [textStyle] is the text style of the message.
  final TextStyle? textStyle;

  /// [closeIcon] widget close snackbar icon
  final Widget? closeIcon;

  /// [border] the border of snackbar
  final BorderSide? border;

  /// Padding for the content of the snackbar
  final EdgeInsetsGeometry? padding;

  /// Margin of the snackbar
  final EdgeInsetsGeometry? margin;

  /// The corners of this [snackbar] are rounded
  final BorderRadiusGeometry? borderRadius;

  /// The text style of action
  final TextStyle? actionStyle;

  final double? elevation;

  const ZeroSnackbarStyle({
    this.backgroundColor,
    this.duration,
    this.textStyle,
    this.closeIcon,
    this.border,
    this.padding,
    this.margin,
    this.borderRadius,
    this.actionStyle,
    this.elevation,
  });

  static ZeroSnackbarStyle fallback(
      {Color? backgroundColor, TextStyle? textStyle}) {
    return ZeroSnackbarStyle(
      backgroundColor: backgroundColor ?? ZeroColors.neutral[2],
      border: BorderSide.none,
      closeIcon: const Icon(ZeroIcons.close),
      duration: const Duration(seconds: 2),
      textStyle: textStyle ?? const TextStyle(fontSize: 14),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      borderRadius: BorderRadius.circular(4),
      elevation: 4,
    );
  }

  ZeroSnackbarStyle merge(ZeroSnackbarStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      border: other.border,
      closeIcon: other.closeIcon,
      duration: other.duration,
      textStyle: textStyle?.merge(other.textStyle) ?? other.textStyle,
      padding: other.padding,
      margin: other.margin,
      borderRadius: other.borderRadius,
      actionStyle: other.actionStyle,
      elevation: other.elevation,
    );
  }

  ZeroSnackbarStyle copyWith({
    Color? backgroundColor,
    Duration? duration,
    TextStyle? textStyle,
    Widget? closeIcon,
    BorderSide? border,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    TextStyle? actionStyle,
    double? elevation,
  }) =>
      ZeroSnackbarStyle(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        duration: duration ?? this.duration,
        textStyle: textStyle ?? this.textStyle,
        closeIcon: closeIcon ?? this.closeIcon,
        border: border ?? this.border,
        padding: padding ?? this.padding,
        margin: margin ?? this.margin,
        borderRadius: borderRadius ?? this.borderRadius,
        actionStyle: actionStyle ?? this.actionStyle,
        elevation: elevation ?? this.elevation,
      );

  static ZeroSnackbarStyle lerp(
      ZeroSnackbarStyle? a, ZeroSnackbarStyle? b, double t) {
    return ZeroSnackbarStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      duration: t < 0.5 ? a?.duration : b?.duration,
      border: BorderSide.lerp(
          a?.border ?? BorderSide.none, b?.border ?? BorderSide.none, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      closeIcon: t < 0.5 ? a?.closeIcon : b?.closeIcon,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
      actionStyle: TextStyle.lerp(a?.actionStyle, b?.actionStyle, t),
      elevation: t < 0.5 ? a?.elevation : b?.elevation,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty<Duration>('duration', duration))
      ..add(DiagnosticsProperty<TextStyle>('textStyle', textStyle))
      ..add(DiagnosticsProperty<Widget>('closeIcon', closeIcon))
      ..add(DiagnosticsProperty<BorderSide>('border', border))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding))
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin))
      ..add(DiagnosticsProperty<BorderRadiusGeometry>(
          'borderRadius', borderRadius))
      ..add(DiagnosticsProperty<TextStyle>('actionStyle', actionStyle))
      ..add(DoubleProperty('elevation', elevation));
  }
}

class ZeroSnackbarAlertStyle {
  /// [titleStyle] is the title text style of the message.
  final TextStyle? titleStyle;

  /// [duration] is the duration that the snackbar will be displayed, if duration is zero, the snackbar will not be dismissed automatically.
  ///
  /// By default duration is 2 seconds
  final Duration? duration;

  /// [subtitleStyle] is the text style of the message.
  final TextStyle? subtitleStyle;

  /// [border] the border of snackbar
  final BorderSide? border;

  /// Padding for the content of the snackbar
  final EdgeInsetsGeometry? padding;

  /// Margin of the snackbar
  final EdgeInsetsGeometry? margin;

  /// The corners of this [snackbar] are rounded
  final BorderRadiusGeometry? borderRadius;

  /// The icon size of snackbar alert type
  final double? iconSize;

  /// Background color
  final Color? color;

  /// Default style when variant is success
  final Color? defaultSuccessColor;

  /// Default style when variant is warning
  final Color? defaultWarningColor;

  /// Default style when variant is info
  final Color? defaultInfoColor;

  /// Default style when variant is danger
  final Color? defaultDangerColor;

  const ZeroSnackbarAlertStyle({
    this.titleStyle,
    this.border,
    this.borderRadius,
    this.duration,
    this.margin,
    this.padding,
    this.subtitleStyle,
    this.iconSize,
    this.color,
    this.defaultDangerColor,
    this.defaultWarningColor,
    this.defaultInfoColor,
    this.defaultSuccessColor,
  });

  static ZeroSnackbarAlertStyle fallback({
    TextStyle? subtitleStyle,
    TextStyle? titleStyle,
    Color? defaultDangerColor,
    Color? defaultWarningColor,
    Color? defaultInfoColor,
    Color? defaultSuccessColor,
  }) {
    return ZeroSnackbarAlertStyle(
      duration: const Duration(seconds: 2),
      titleStyle: titleStyle ??
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      subtitleStyle: subtitleStyle ?? const TextStyle(fontSize: 14),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      borderRadius: BorderRadius.circular(4),
      iconSize: 22,
      defaultDangerColor: defaultDangerColor ?? ZeroColors.dustRed,
      defaultWarningColor: defaultWarningColor ?? ZeroColors.sunriseYellow,
      defaultInfoColor: defaultInfoColor ?? ZeroColors.primary,
      defaultSuccessColor: defaultSuccessColor ?? ZeroColors.polarGreen,
    );
  }

  ZeroSnackbarAlertStyle merge(ZeroSnackbarAlertStyle? other) {
    if (other == null) return this;

    return copyWith(
      border: other.border,
      duration: other.duration,
      titleStyle: titleStyle?.merge(other.titleStyle) ?? other.titleStyle,
      subtitleStyle:
          subtitleStyle?.merge(other.subtitleStyle) ?? other.subtitleStyle,
      padding: other.padding,
      margin: other.margin,
      borderRadius: other.borderRadius,
      iconSize: other.iconSize,
      color: other.color,
      defaultDangerColor: defaultDangerColor,
      defaultWarningColor: defaultWarningColor,
      defaultInfoColor: defaultInfoColor,
      defaultSuccessColor: defaultSuccessColor,
    );
  }

  ZeroSnackbarAlertStyle copyWith({
    Duration? duration,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    BorderSide? border,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
    double? iconSize,
    Color? color,
    Color? defaultDangerColor,
    Color? defaultWarningColor,
    Color? defaultInfoColor,
    Color? defaultSuccessColor,
  }) =>
      ZeroSnackbarAlertStyle(
        duration: duration ?? this.duration,
        border: border ?? this.border,
        padding: padding ?? this.padding,
        margin: margin ?? this.margin,
        borderRadius: borderRadius ?? this.borderRadius,
        titleStyle: titleStyle ?? this.titleStyle,
        subtitleStyle: subtitleStyle ?? this.subtitleStyle,
        iconSize: iconSize ?? this.iconSize,
        color: color ?? this.color,
        defaultDangerColor: defaultDangerColor ?? this.defaultDangerColor,
        defaultWarningColor: defaultWarningColor ?? this.defaultWarningColor,
        defaultInfoColor: defaultInfoColor ?? this.defaultInfoColor,
        defaultSuccessColor: defaultSuccessColor ?? this.defaultSuccessColor,
      );

  static ZeroSnackbarAlertStyle lerp(
      ZeroSnackbarAlertStyle? a, ZeroSnackbarAlertStyle? b, double t) {
    return ZeroSnackbarAlertStyle(
      duration: t < 0.5 ? a?.duration : b?.duration,
      border: BorderSide.lerp(
          a?.border ?? BorderSide.none, b?.border ?? BorderSide.none, t),
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      subtitleStyle: TextStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
      iconSize: t < 0.5 ? a?.iconSize : b?.iconSize,
      color: Color.lerp(a?.color, b?.color, t),
      defaultDangerColor:
          Color.lerp(a?.defaultDangerColor, b?.defaultDangerColor, t),
      defaultWarningColor:
          Color.lerp(a?.defaultWarningColor, b?.defaultWarningColor, t),
      defaultInfoColor: Color.lerp(a?.defaultInfoColor, b?.defaultInfoColor, t),
      defaultSuccessColor:
          Color.lerp(a?.defaultSuccessColor, b?.defaultSuccessColor, t),
    );
  }
}

class ZeroSnackbarStyleSet with Diagnosticable {
  final ZeroSnackbarStyle? snackbar;
  final ZeroSnackbarAlertStyle? alert;

  const ZeroSnackbarStyleSet({
    this.snackbar,
    this.alert,
  });

  static ZeroSnackbarStyleSet fallback({
    TextStyle? textStyle,
    TextStyle? titleStyle,
    Color? snackbarBackgroundColor,
    Color? defaultDangerColor,
    Color? defaultWarningColor,
    Color? defaultInfoColor,
    Color? defaultSuccessColor,
  }) {
    return ZeroSnackbarStyleSet(
      snackbar: ZeroSnackbarStyle.fallback(
        textStyle: textStyle,
        backgroundColor: snackbarBackgroundColor,
      ),
      alert: ZeroSnackbarAlertStyle.fallback(
        subtitleStyle: textStyle,
        titleStyle: titleStyle,
        defaultDangerColor: defaultDangerColor,
        defaultWarningColor: defaultWarningColor,
        defaultInfoColor: defaultInfoColor,
        defaultSuccessColor: defaultSuccessColor,
      ),
    );
  }

  ZeroSnackbarStyleSet copyWith({
    ZeroSnackbarStyle? snackbar,
    ZeroSnackbarAlertStyle? alert,
  }) {
    return ZeroSnackbarStyleSet(
      snackbar: snackbar ?? this.snackbar,
      alert: alert ?? this.alert,
    );
  }

  ZeroSnackbarStyleSet merge(ZeroSnackbarStyleSet? other) {
    if (other == null) return this;

    return copyWith(
      snackbar: snackbar?.merge(other.snackbar) ?? other.snackbar,
      alert: alert?.merge(other.alert) ?? other.alert,
    );
  }

  static ZeroSnackbarStyleSet lerp(
      ZeroSnackbarStyleSet? a, ZeroSnackbarStyleSet? b, double t) {
    return ZeroSnackbarStyleSet(
      snackbar: ZeroSnackbarStyle.lerp(a?.snackbar, b?.snackbar, t),
      alert: ZeroSnackbarAlertStyle.lerp(a?.alert, b?.alert, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<ZeroSnackbarStyle>('snackbar', snackbar))
      ..add(DiagnosticsProperty<ZeroSnackbarAlertStyle>('alert', alert));
  }
}
