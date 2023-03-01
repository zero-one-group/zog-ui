import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// [ZeroButtonStyle] is the class that will be used to style [ZeroButton], [ZeroButtonRightIcon], [ZeroButtonLeftIcon], [ZeroButtonRightLeftIcon], [ZeroButtonIcon]
class ZeroButtonStyle with Diagnosticable {
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? disabledForegroundColor;
  final Color? disabledBackgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final Size? fixedSize;
  final Size? maximumSize;
  final BorderSide? side;
  final OutlinedBorder? shape;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? tapTargetSize;
  final Duration? animationDuration;
  final bool? enableFeedback;
  final AlignmentGeometry? alignment;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? animatingColor;

  const ZeroButtonStyle({
    this.foregroundColor,
    this.backgroundColor,
    this.disabledForegroundColor,
    this.disabledBackgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.textStyle,
    this.padding,
    this.minimumSize,
    this.fixedSize,
    this.maximumSize,
    this.side,
    this.shape,
    this.visualDensity,
    this.tapTargetSize,
    this.animationDuration,
    this.enableFeedback,
    this.alignment,
    this.splashFactory,
    this.animatingColor,
  });

  /// [toButtonStyle] is the function that will be used to convert [ButtonStyle] for button styling
  ButtonStyle toButtonStyle() {
    return TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledForegroundColor,
      disabledForegroundColor: disabledBackgroundColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      elevation: elevation,
      textStyle: textStyle,
      padding: padding,
      minimumSize: minimumSize,
      fixedSize: fixedSize,
      maximumSize: maximumSize,
      side: side,
      shape: shape,
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }

  /// [primaryStyle] is the function that will be used to create [ZeroButtonStyle] with primary color
  static ZeroButtonStyle primaryStyle({
    ZeroSizeType? buttonSizeType,
    ZeroButtonRadiusType? buttonRadiusType,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? disabledForegroundColor,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    Color? animatingColor,
  }) {
    return ZeroButtonStyle(
      backgroundColor: backgroundColor ?? ZeroColors.primary,
      foregroundColor: foregroundColor ?? ZeroColors.primary[8],
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor ?? ZeroColors.primary[3],
      elevation: elevation ?? 0,
      textStyle: textStyle,
      padding: padding ?? buttonSizeType?.padding,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: buttonRadiusSize(
                buttonRadiusType ?? ZeroButtonRadiusType.rectangle),
          ),
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
      animatingColor: animatingColor ?? ZeroColors.primary[3],
    );
  }

  /// [secondaryStyle] is the function that will be used to create [ZeroButtonStyle] with secondary color
  static ZeroButtonStyle secondaryStyle({
    ZeroSizeType? buttonSizeType,
    ZeroButtonRadiusType? buttonRadiusType,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? disabledForegroundColor,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    Color? animatingColor,
  }) {
    return ZeroButtonStyle(
      backgroundColor: backgroundColor ?? ZeroColors.white,
      foregroundColor: foregroundColor ?? ZeroColors.neutral[10],
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor ?? ZeroColors.primary[3],
      elevation: elevation ?? 0,
      textStyle: textStyle,
      padding: padding ?? buttonSizeType?.padding,
      shape: shape ??
          RoundedRectangleBorder(
            borderRadius: buttonRadiusSize(
                buttonRadiusType ?? ZeroButtonRadiusType.rectangle),
            side: BorderSide(color: ZeroColors.neutral[5], width: 1),
          ),
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
      animatingColor: animatingColor ?? ZeroColors.primary[3],
    );
  }

  ZeroButtonStyle merge(ZeroButtonStyle? other) {
    if (other == null) {
      return this;
    }

    return copyWith(
      foregroundColor: other.foregroundColor,
      backgroundColor: other.backgroundColor,
      disabledForegroundColor: other.disabledForegroundColor,
      disabledBackgroundColor: other.disabledBackgroundColor,
      shadowColor: other.shadowColor,
      surfaceTintColor: other.surfaceTintColor,
      elevation: other.elevation,
      textStyle: textStyle?.merge(other.textStyle) ?? other.textStyle,
      padding: other.padding,
      minimumSize: other.minimumSize,
      fixedSize: other.fixedSize,
      maximumSize: other.maximumSize,
      side: other.side,
      shape: other.shape,
      visualDensity: other.visualDensity,
      tapTargetSize: other.tapTargetSize,
      animationDuration: other.animationDuration,
      enableFeedback: other.enableFeedback,
      alignment: other.alignment,
      splashFactory: other.splashFactory,
      animatingColor: other.animatingColor,
    );
  }

  ZeroButtonStyle copyWith({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? disabledForegroundColor,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    Color? animatingColor,
  }) {
    return ZeroButtonStyle(
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? this.disabledForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? this.disabledBackgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      elevation: elevation ?? this.elevation,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
      minimumSize: minimumSize ?? this.minimumSize,
      fixedSize: fixedSize ?? this.fixedSize,
      maximumSize: maximumSize ?? this.maximumSize,
      side: side ?? this.side,
      shape: shape ?? this.shape,
      visualDensity: visualDensity ?? this.visualDensity,
      tapTargetSize: tapTargetSize ?? this.tapTargetSize,
      animationDuration: animationDuration ?? this.animationDuration,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      alignment: alignment ?? this.alignment,
      splashFactory: splashFactory ?? this.splashFactory,
      animatingColor: animatingColor ?? this.animatingColor,
    );
  }

  static ZeroButtonStyle lerp(
      ZeroButtonStyle? a, ZeroButtonStyle? b, double t) {
    return ZeroButtonStyle(
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      disabledForegroundColor:
          Color.lerp(a?.disabledForegroundColor, b?.disabledForegroundColor, t),
      disabledBackgroundColor:
          Color.lerp(a?.disabledBackgroundColor, b?.disabledBackgroundColor, t),
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      surfaceTintColor: Color.lerp(a?.surfaceTintColor, b?.surfaceTintColor, t),
      elevation: t < 0.5 ? a?.elevation : b?.elevation,
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      minimumSize: Size.lerp(a?.minimumSize, b?.minimumSize, t),
      fixedSize: Size.lerp(a?.fixedSize, b?.fixedSize, t),
      maximumSize: Size.lerp(a?.maximumSize, b?.maximumSize, t),
      side: t < 0.5 ? a?.side : b?.side,
      shape: OutlinedBorder.lerp(a?.shape, b?.shape, t),
      visualDensity: t < 0.5 ? a?.visualDensity : b?.visualDensity,
      tapTargetSize: t < 0.5 ? a?.tapTargetSize : b?.tapTargetSize,
      animationDuration: t < 0.5 ? a?.animationDuration : b?.animationDuration,
      enableFeedback: t < 0.5 ? a?.enableFeedback : b?.enableFeedback,
      alignment: t < 0.5 ? a?.alignment : b?.alignment,
      splashFactory: t < 0.5 ? a?.splashFactory : b?.splashFactory,
      animatingColor: Color.lerp(a?.animatingColor, b?.animatingColor, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('foregroundColor', foregroundColor))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('disabledForegroundColor', disabledForegroundColor))
      ..add(ColorProperty('disabledBackgroundColor', disabledBackgroundColor))
      ..add(ColorProperty('shadowColor', shadowColor))
      ..add(ColorProperty('surfaceTintColor', surfaceTintColor))
      ..add(DoubleProperty('elevation', elevation))
      ..add(ColorProperty('animatingColor', animatingColor));
  }
}
