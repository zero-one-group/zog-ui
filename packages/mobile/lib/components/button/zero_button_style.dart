import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// [_ZeroButtonStyle] is the class that will be used to style [ZeroButton], [ZeroButtonRightIcon], [ZeroButtonLeftIcon], [ZeroButtonRightLeftIcon], [ZeroButtonIcon]
class ZeroButtonStyle {
  Color? foregroundColor;
  Color? backgroundColor;
  Color? disabledForegroundColor;
  Color? disabledBackgroundColor;
  Color? shadowColor;
  Color? surfaceTintColor;
  double? elevation;
  TextStyle? textStyle;
  EdgeInsetsGeometry? padding;
  Size? minimumSize;
  Size? fixedSize;
  Size? maximumSize;
  BorderSide? side;
  OutlinedBorder? shape;
  VisualDensity? visualDensity;
  MaterialTapTargetSize? tapTargetSize;
  Duration? animationDuration;
  bool? enableFeedback;
  AlignmentGeometry? alignment;
  InteractiveInkFeatureFactory? splashFactory;
  Color? animatingColor;

  ZeroButtonStyle({
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
      tapTargetSize: tapTargetSize,
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
      tapTargetSize: tapTargetSize,
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
      tapTargetSize: tapTargetSize,
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
    return ZeroButtonStyle(
      foregroundColor: foregroundColor ?? other.foregroundColor,
      backgroundColor: backgroundColor ?? other.backgroundColor,
      disabledForegroundColor:
          disabledForegroundColor ?? other.disabledForegroundColor,
      disabledBackgroundColor:
          disabledBackgroundColor ?? other.disabledBackgroundColor,
      shadowColor: shadowColor ?? other.shadowColor,
      surfaceTintColor: surfaceTintColor ?? other.surfaceTintColor,
      elevation: elevation ?? other.elevation,
      textStyle: textStyle ?? other.textStyle,
      padding: padding ?? other.padding,
      minimumSize: minimumSize ?? other.minimumSize,
      fixedSize: fixedSize ?? other.fixedSize,
      maximumSize: maximumSize ?? other.maximumSize,
      side: side ?? other.side,
      shape: shape ?? other.shape,
      visualDensity: visualDensity ?? other.visualDensity,
      tapTargetSize: tapTargetSize ?? other.tapTargetSize,
      animationDuration: animationDuration ?? other.animationDuration,
      enableFeedback: enableFeedback ?? other.enableFeedback,
      alignment: alignment ?? other.alignment,
      splashFactory: splashFactory ?? other.splashFactory,
      animatingColor: animatingColor ?? other.animatingColor,
    );
  }
}
