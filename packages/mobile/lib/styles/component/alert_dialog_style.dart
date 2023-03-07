import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ZeroAlertDialogStyle with Diagnosticable {
  final TextStyle? titleTextStyle;
  final TextStyle? contentTextStyle;
  final Color? barrierColor;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? iconPadding;
  final double elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? iconColor;
  final AlignmentGeometry? alignment;
  final ShapeBorder? shape;

  const ZeroAlertDialogStyle({
    this.titleTextStyle,
    this.contentTextStyle,
    this.barrierColor,
    this.actionsPadding,
    this.titlePadding,
    this.contentPadding,
    this.iconPadding,
    this.elevation = 4,
    this.backgroundColor,
    this.shadowColor,
    this.iconColor,
    this.alignment,
    this.shape,
  });

  static ZeroAlertDialogStyle fallback({
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    Color? barrierColor,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? iconPadding,
    double elevation = 4,
    Color? backgroundColor,
    Color? shadowColor,
    Color? iconColor,
    AlignmentGeometry? alignment,
    ShapeBorder? shape,
  }) =>
      ZeroAlertDialogStyle(
        titleTextStyle: titleTextStyle,
        contentTextStyle: contentTextStyle,
        barrierColor: barrierColor ?? Colors.black54,
        actionsPadding: actionsPadding ??
            const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        titlePadding: titlePadding,
        contentPadding: contentPadding,
        iconPadding: iconPadding,
        elevation: elevation,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        iconColor: iconColor,
        alignment: alignment,
        shape: shape,
      );

  ZeroAlertDialogStyle copyWith({
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    Color? barrierColor,
    EdgeInsetsGeometry? actionsPadding,
    EdgeInsetsGeometry? titlePadding,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsetsGeometry? iconPadding,
    double? elevation,
    Color? backgroundColor,
    Color? shadowColor,
    Color? iconColor,
    AlignmentGeometry? alignment,
    ShapeBorder? shape,
  }) =>
      ZeroAlertDialogStyle(
        titleTextStyle: titleTextStyle ?? this.titleTextStyle,
        contentTextStyle: contentTextStyle ?? this.contentTextStyle,
        barrierColor: barrierColor ?? this.barrierColor,
        actionsPadding: actionsPadding ?? this.actionsPadding,
        titlePadding: titlePadding ?? this.titlePadding,
        contentPadding: contentPadding ?? this.contentPadding,
        iconPadding: iconPadding ?? this.iconPadding,
        elevation: elevation ?? this.elevation,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        shadowColor: shadowColor ?? this.shadowColor,
        iconColor: iconColor ?? this.iconColor,
        alignment: alignment ?? this.alignment,
        shape: shape ?? this.shape,
      );

  ZeroAlertDialogStyle merge(ZeroAlertDialogStyle? style) {
    if (style == null) return this;
    return copyWith(
      titleTextStyle:
          titleTextStyle?.merge(style.titleTextStyle) ?? style.titleTextStyle,
      contentTextStyle: contentTextStyle?.merge(style.contentTextStyle) ??
          style.contentTextStyle,
      barrierColor: style.barrierColor,
      actionsPadding: style.actionsPadding,
      titlePadding: style.titlePadding,
      contentPadding: style.contentPadding,
      iconPadding: style.iconPadding,
      elevation: style.elevation,
      backgroundColor: style.backgroundColor,
      shadowColor: style.shadowColor,
      iconColor: style.iconColor,
      alignment: style.alignment,
      shape: style.shape,
    );
  }

  static ZeroAlertDialogStyle lerp(
          ZeroAlertDialogStyle? a, ZeroAlertDialogStyle? b, double t) =>
      ZeroAlertDialogStyle(
        titleTextStyle: TextStyle.lerp(a?.titleTextStyle, b?.titleTextStyle, t),
        contentTextStyle:
            TextStyle.lerp(a?.contentTextStyle, b?.contentTextStyle, t),
        barrierColor: Color.lerp(a?.barrierColor, b?.barrierColor, t),
        actionsPadding:
            EdgeInsetsGeometry.lerp(a?.actionsPadding, b?.actionsPadding, t),
        titlePadding:
            EdgeInsetsGeometry.lerp(a?.titlePadding, b?.titlePadding, t),
        contentPadding:
            EdgeInsetsGeometry.lerp(a?.contentPadding, b?.contentPadding, t),
        iconPadding: EdgeInsetsGeometry.lerp(a?.iconPadding, b?.iconPadding, t),
        elevation: t < 0.5 ? a?.elevation ?? 4 : b?.elevation ?? 4,
        backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
        shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
        iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
        alignment: AlignmentGeometry.lerp(a?.alignment, b?.alignment, t),
        shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>(
        'titleTextStyle', titleTextStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'contentTextStyle', contentTextStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty<Color>('barrierColor', barrierColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'actionsPadding', actionsPadding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'titlePadding', titlePadding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'contentPadding', contentPadding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'iconPadding', iconPadding,
        defaultValue: null));
    properties.add(DoubleProperty('elevation', elevation, defaultValue: null));
    properties.add(DiagnosticsProperty<Color>(
        'backgroundColor', backgroundColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<Color>('shadowColor', shadowColor,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<Color>('iconColor', iconColor, defaultValue: null));
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'alignment', alignment,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
  }
}
