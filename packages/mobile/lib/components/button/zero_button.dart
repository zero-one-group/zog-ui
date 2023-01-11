import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/types/button_size_type.dart';

import '../../types/button_radius_type.dart';

class ZeroButton extends ElevatedButton {
  const ZeroButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  }) : super();

  static ZeroButton primary({
    Key? key,
    required String text,
    Color foregroundColor = ZeroColors.white,
    Color backgroundColor = ZeroColors.primary,
    double? width,
    double? height,
    ButtonSizeType buttonSizeType = ButtonSizeType.medium,
    ButtonRadiusType buttonRadiusType = ButtonRadiusType.rectangle,
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle style = const ButtonStyle(),
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    backgroundColor = isDisabled ? const Color(0xFFF5F5F5) : backgroundColor;
    foregroundColor = isDisabled ? const Color(0xFF8C8C8C) : foregroundColor;
    return ZeroButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: style.merge(
        styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          fixedSize: (width != null && height != null) ? Size(width, height) : null,
          padding: _paddingSize(buttonSizeType),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: isDisabled ? foregroundColor : Colors.transparent),
            borderRadius: _buttonRadiusType(buttonRadiusType),
          ),
        ),
      ),
      focusNode: focusNode,
      autofocus: autofocus,
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
          fontSize: _fontSize(buttonSizeType),
        ),
      ),
    );
  }

  static ZeroButton secondary({
    Key? key,
    required String text,
    Color foregroundColor = ZeroColors.dark,
    double? width,
    double? height,
    ButtonSizeType buttonSizeType = ButtonSizeType.medium,
    ButtonRadiusType buttonRadiusType = ButtonRadiusType.rectangle,
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,
    ButtonStyle style = const ButtonStyle(),
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    final Color backgroundColor = isDisabled ? ZeroColors.disabled : ZeroColors.transparent;
    foregroundColor = isDisabled ? ZeroColors.grey : foregroundColor;
    return ZeroButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: style.merge(
        styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          fixedSize: (width != null && height != null) ? Size(width, height) : null,
          padding: _paddingSize(buttonSizeType),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: foregroundColor),
            borderRadius: _buttonRadiusType(buttonRadiusType),
          ),
        ),
      ),
      focusNode: focusNode,
      autofocus: autofocus,
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
          fontSize: _fontSize(buttonSizeType),
        ),
      ),
    );
  }

  static BorderRadius _buttonRadiusType(ButtonRadiusType buttonType) {
    switch (buttonType) {
      case ButtonRadiusType.rectangle:
        return const BorderRadius.all(Radius.circular(0));
      case ButtonRadiusType.curved:
        return const BorderRadius.all(Radius.circular(8));
      case ButtonRadiusType.rounded:
        return const BorderRadius.all(Radius.circular(24));
    }
  }

  static EdgeInsets _paddingSize(ButtonSizeType size) {
    switch (size) {
      case ButtonSizeType.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 4);
      case ButtonSizeType.medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 6);
      case ButtonSizeType.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 8);
    }
  }

  static double _fontSize(ButtonSizeType size) {
    switch (size) {
      case ButtonSizeType.small:
        return 12.0;
      case ButtonSizeType.medium:
        return 14.0;
      case ButtonSizeType.large:
        return 16.0;
    }
  }

  static ButtonStyle styleFrom({
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
  }) {
    final Color? foreground = foregroundColor;
    final Color? disabledForeground = disabledForegroundColor;
    final MaterialStateProperty<Color?>? foregroundColorProp = (foreground == null && disabledForeground == null)
        ? null
        : MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return foreground;
            }
            return disabledForeground;
          });
    final MaterialStateProperty<Color?>? backgroundColorProp = (backgroundColor == null && disabledBackgroundColor == null)
        ? null
        : disabledBackgroundColor == null
            ? ButtonStyleButton.allOrNull<Color?>(backgroundColor)
            : MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return backgroundColor;
                }
                return disabledBackgroundColor;
              });
    final MaterialStateProperty<Color?>? overlayColor = (foreground == null)
        ? null
        : MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return foreground;
            }
          });

    return ButtonStyle(
      textStyle: ButtonStyleButton.allOrNull<TextStyle>(textStyle),
      foregroundColor: foregroundColorProp,
      backgroundColor: backgroundColorProp,
      overlayColor: overlayColor,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      surfaceTintColor: ButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      elevation: ButtonStyleButton.allOrNull<double>(elevation),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: ButtonStyleButton.allOrNull<Size>(maximumSize),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
    );
  }
}
