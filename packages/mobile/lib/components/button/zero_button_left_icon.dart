import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

import '../../types/button_radius_type.dart';
import './zero_button_style.dart';
import 'button_animating.dart';

/// ZeroButton created based on [ElevatedButton] and [TextButton] with some customizations
/// how to use this widget is almost the same as [ElevatedButton], [TextButton], [OutlinedButton]
class ZeroButtonLIcon extends ElevatedButton {
  ZeroButtonLIcon({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    required ZeroButtonStyle style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
    super.statesController,
    required super.child,
  }) : super(
          style: style.toButtonStyle(),
        );

  static Widget primary({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButtonLIcon]
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [backgroundColor] is the background color for [ZeroButtonLIcon]
    /// if this value is null, the default background color will be used
    /// the default background color is [ZeroColors.primary6]
    Color backgroundColor = ZeroColors.primary6,

    /// [width] is the width for [ZeroButtonLIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonLIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonLIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonLIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonLIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonLIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    /// which is defined in [primaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButtonLIcon]
    ZeroButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    /// [primaryDefaultStyle] is the default style for [ZeroButton.primary]
    final ZeroButtonStyle primaryDefaultStyle = ZeroButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: ZeroColors.primary8,
      animatingColor: ZeroColors.primary3,
      elevation: 0,
      fixedSize: (width != null) ? Size(width, height ?? buttonSizeType.defaultButtonHeight) : null,
      padding: buttonSizeType.padding,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadiusSize(buttonRadiusType),
      ),
    );

    /// if [style] is not null, merge [style] with [primaryDefaultStyle]
    /// combine customizations from [style] with default style [primaryDefaultStyle]
    style = style?.merge(primaryDefaultStyle) ?? primaryDefaultStyle;

    /// [updateAnimating] is the callback function to update the state of [ZeroButtonLIcon]
    /// this function will be called when [ZeroButtonLIcon] is pressed
    /// this function will be called from [_ButtonAnimating] widget
    late Function updateAnimating;

    /// [animatingColor] is the color that will be used for [ZeroButtonLIcon] when it is pressed
    /// this value will be used as [backgroundColor] for [_ButtonAnimating] widget
    Color animatingColor = style.animatingColor ?? ZeroColors.transparent;
    return isDisabled
        ? disabled(
            text: text,
            icon: icon,
            textStyle: textStyle,
            width: width,
            height: height,
            buttonSizeType: buttonSizeType,
            buttonRadiusType: buttonRadiusType,
          )
        : ButtonAnimating(
            callback: (void Function() update) {
              updateAnimating = update;
            },
            buttonRadiusType: buttonRadiusType,
            height: height ?? buttonSizeType.defaultButtonHeight,
            animatingColor: animatingColor,
            child: ZeroButtonLIcon(
              key: key,
              onPressed: () {
                updateAnimating();
                onPressed();
              },
              onLongPress: onLongPress,
              style: style,
              focusNode: focusNode,
              autofocus: autofocus,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon.color == null
                        ? Icon(
                            icon.icon as IconData,
                            color: ZeroColors.white,
                          )
                        : icon,
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: textStyle ??
                          TextStyle(
                            fontSize: buttonSizeType.fontSize,
                            color: ZeroColors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  static Widget secondary({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButtonLIcon]
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [backgroundColor] is the background color for [ZeroButtonLIcon]
    /// if this value is null, the default background color will be used
    /// the default background color is [ZeroColors.primary6]
    Color backgroundColor = ZeroColors.white,

    /// [selectedBorderColor] is the border color for [ZeroButtonLIcon]
    Color borderColor = ZeroColors.neutral5,

    /// [width] is the width for [ZeroButtonLIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonLIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonLIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonLIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonLIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonLIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    /// which is defined in [secondaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButtonLIcon]
    ZeroButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    /// [secondaryDefaultStyle] is the default style for [ZeroButton.secondary]
    final ZeroButtonStyle secondaryDefaultStyle = ZeroButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: ZeroColors.neutral6,
      animatingColor: ZeroColors.primary3,
      elevation: 0,
      fixedSize: (width != null) ? Size(width, height ?? buttonSizeType.defaultButtonHeight) : null,
      padding: buttonSizeType.padding,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: 1),
        borderRadius: buttonRadiusSize(buttonRadiusType),
      ),
    );

    /// if [style] is not null, merge [style] with [secondaryDefaultStyle]
    /// combine customizations from [style] with default style [secondaryDefaultStyle]
    style = style?.merge(secondaryDefaultStyle) ?? secondaryDefaultStyle;

    /// [updateAnimating] is the callback function to update the state of [ZeroButtonLIcon]
    late Function updateAnimating;

    /// [animatingColor] is the color that will be used for [ZeroButtonLIcon] when it is pressed
    Color animatingColor = style.animatingColor ?? ZeroColors.transparent;

    return isDisabled
        ? disabled(
            text: text,
            icon: icon,
            textStyle: textStyle,
            width: width,
            height: height,
            buttonSizeType: buttonSizeType,
            buttonRadiusType: buttonRadiusType,
          )
        : ButtonAnimating(
            callback: (void Function() update) {
              updateAnimating = update;
            },
            buttonRadiusType: buttonRadiusType,
            height: height ?? buttonSizeType.defaultButtonHeight,
            animatingColor: animatingColor,
            child: ZeroButtonLIcon(
              key: key,
              onPressed: () {
                updateAnimating();
                onPressed();
              },
              onLongPress: onLongPress,
              style: style,
              focusNode: focusNode,
              autofocus: autofocus,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon.color == null
                        ? Icon(
                            icon.icon as IconData,
                            color: ZeroColors.neutral10,
                          )
                        : icon,
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: textStyle ??
                          TextStyle(
                            fontSize: buttonSizeType.fontSize,
                            color: ZeroColors.neutral10,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  static Widget text({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButtonLIcon]
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [backgroundColor] is the background color for [ZeroButtonLIcon]
    /// if this value is null, the default background color will be used
    /// the default background color is [ZeroColors.transparentWhite]
    Color backgroundColor = ZeroColors.transparentWhite,

    /// [width] is the width for [ZeroButtonLIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonLIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonLIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonLIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonLIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonLIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    /// which is defined in [secondaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButtonLIcon]
    ZeroButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    /// [secondaryDefaultStyle] is the default style for [ZeroButton.secondary]
    final ZeroButtonStyle secondaryDefaultStyle = ZeroButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: ZeroColors.neutral6,
      elevation: 0,
      fixedSize: (width != null) ? Size(width, height ?? buttonSizeType.defaultButtonHeight) : null,
      padding: buttonSizeType.padding,
      shape: RoundedRectangleBorder(
        borderRadius: buttonRadiusSize(buttonRadiusType),
      ),
    );

    /// if [style] is not null, merge [style] with [secondaryDefaultStyle]
    /// combine customizations from [style] with default style [secondaryDefaultStyle]
    style = style?.merge(secondaryDefaultStyle) ?? secondaryDefaultStyle;

    return isDisabled
        ? disabled(
            text: text,
            icon: icon,
            textStyle: textStyle,
            width: width,
            height: height,
            buttonSizeType: buttonSizeType,
            buttonRadiusType: buttonRadiusType,
            style: ZeroButtonStyle(
              backgroundColor: ZeroColors.neutral3,
              foregroundColor: ZeroColors.transparentWhite,
              elevation: 0,
              fixedSize: (width != null) ? Size(width, height ?? buttonSizeType.defaultButtonHeight) : null,
              padding: buttonSizeType.padding,
              shape: RoundedRectangleBorder(
                borderRadius: buttonRadiusSize(buttonRadiusType),
              ),
            ),
          )
        : SizedBox(
            height: height ?? buttonSizeType.defaultButtonHeight,
            child: ZeroButtonLIcon(
              key: key,
              onPressed: onPressed,
              onLongPress: onLongPress,
              style: style,
              focusNode: focusNode,
              autofocus: autofocus,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon.color == null
                        ? Icon(
                            icon.icon as IconData,
                            color: ZeroColors.neutral10,
                          )
                        : icon,
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: textStyle ??
                          TextStyle(
                            fontSize: buttonSizeType.fontSize,
                            color: ZeroColors.neutral10,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  static Widget disabled({
    Key? key,

    /// [text] is the text that will be displayed on the button
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonLIcon]
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButtonLIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonLIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonLIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonLIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonLIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonLIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [style] for customizing button style
    /// if this value is null, the default style will be used
    ZeroButtonStyle? style,
  }) {
    /// [textStyle] is the style for [Text] widget inside [ZeroButtonLIcon]
    /// if this value is null, the default style will be used
    textStyle ??= TextStyle(
      fontSize: buttonSizeType.fontSize,
      color: ZeroColors.neutral7,
    );

    /// [disabledDefaultStyle] is the default style for [ZeroButton.disabled]
    final ZeroButtonStyle disabledDefaultStyle = ZeroButtonStyle(
      backgroundColor: ZeroColors.neutral3,
      foregroundColor: ZeroColors.transparentWhite,
      elevation: 0,
      fixedSize: (width != null) ? Size(width, height ?? buttonSizeType.defaultButtonHeight) : null,
      padding: buttonSizeType.padding,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: ZeroColors.neutral5),
        borderRadius: buttonRadiusSize(buttonRadiusType),
      ),
    );

    /// [style] is the style for [ZeroButtonLIcon]
    style = style?.merge(disabledDefaultStyle) ?? disabledDefaultStyle;

    /// [animatingColor] is the color that will be used for [ZeroButtonLIcon] when it is pressed
    Color animatingColor = style.animatingColor ?? ZeroColors.transparent;
    return ButtonAnimating(
      callback: (void Function() update) {
        // do nothing
      },
      buttonRadiusType: buttonRadiusType,
      height: height ?? buttonSizeType.defaultButtonHeight,
      animatingColor: animatingColor,
      child: ZeroButtonLIcon(
        key: key,
        onPressed: () {
          // do nothing
        },
        style: style,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon.color == null
                  ? Icon(
                      icon.icon as IconData,
                      color: textStyle.color,
                    )
                  : icon,
              const SizedBox(width: 8),
              Text(
                text,
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ZeroButtonStyle is the style for [ZeroButtonLIcon]
  /// styleFrom is the function to create [ButtonStyle] from [ZeroButtonStyle]
  /// [ZeroButtonStyle] is the style for [ZeroButtonLIcon]
  static ZeroButtonStyle styleFrom({
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
      animatingColor: animatingColor,
    );
  }
}
