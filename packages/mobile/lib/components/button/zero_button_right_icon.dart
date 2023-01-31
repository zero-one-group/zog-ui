import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import 'button_animating.dart';

/// ZeroButton created based on [ElevatedButton] and [TextButton] with some customizations
/// how to use this widget is almost the same as [ElevatedButton], [TextButton], [OutlinedButton]
class ZeroButtonRIcon extends ElevatedButton {
  ZeroButtonRIcon({
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
    /// this value will be used as text value for [Text] widget inside [ZeroButtonRIcon]
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonRIcon]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButtonRIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonRIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonRIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonRIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonRIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonRIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButtonRIcon]
    /// if this value is null, the default style will be used
    /// which is defined in [primaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButtonRIcon]
    ZeroButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    return Builder(builder: (context) {
      final theme = context.theme;
      final buttonStyle = theme.primaryButtonStyle;

      /// [primaryDefaultStyle] is the default style for [ZeroButton.primary]
      final ZeroButtonStyle primaryDefaultStyle = buttonStyle.merge(
        ZeroButtonStyle(
          backgroundColor: buttonStyle.backgroundColor ?? theme.primaryColor,
          elevation: 0,
          fixedSize: (width != null)
              ? Size(width, height ?? buttonSizeType.defaultButtonHeight)
              : null,
          padding: buttonSizeType.padding,
          shape: RoundedRectangleBorder(
            borderRadius: buttonRadiusSize(buttonRadiusType),
          ),
        ),
      );

      /// if [style] is not null, merge [style] with [primaryDefaultStyle]
      /// combine customizations from [style] with default style [primaryDefaultStyle]
      final adaptiveStyle = primaryDefaultStyle.merge(style);

      /// [updateAnimating] is the callback function to update the state of [ZeroButtonRIcon]
      /// this function will be called when [ZeroButtonRIcon] is pressed
      /// this function will be called from [_ButtonAnimating] widget
      late Function updateAnimating;

      /// [animatingColor] is the color that will be used for [ZeroButtonRIcon] when it is pressed
      /// this value will be used as [backgroundColor] for [_ButtonAnimating] widget
      final animatingColor = buttonStyle.animatingColor ??
          adaptiveStyle.animatingColor ??
          ZeroColors.transparent;
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
              child: ZeroButtonRIcon(
                key: key,
                onPressed: () {
                  updateAnimating();
                  onPressed();
                },
                onLongPress: onLongPress,
                style: adaptiveStyle,
                focusNode: focusNode,
                autofocus: autofocus,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        style: textStyle ??
                            TextStyle(
                              fontSize: buttonSizeType.fontSize,
                              color: ZeroColors.white,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        icon.icon,
                        color: icon.color ?? ZeroColors.white,
                        size: buttonSizeType.iconSize,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  static Widget secondary({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButtonRIcon]
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonRIcon]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [selectedBorderColor] is the border color for [ZeroButtonRIcon]
    Color? borderColor,

    /// [width] is the width for [ZeroButtonRIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonRIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonRIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonRIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonRIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonRIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButtonRIcon]
    /// if this value is null, the default style will be used
    /// which is defined in [secondaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButtonRIcon]
    ZeroButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    return Builder(builder: (context) {
      final theme = context.theme;
      final buttonStyle = theme.secondaryButtonStyle;
      final adaptiveBorderColor = borderColor ?? theme.dividerColor;

      /// [secondaryDefaultStyle] is the default style for [ZeroButton.secondary]
      final ZeroButtonStyle secondaryDefaultStyle = buttonStyle.merge(
        ZeroButtonStyle(
          backgroundColor: buttonStyle.backgroundColor,
          foregroundColor:
              buttonStyle.foregroundColor ?? theme.disabledBackgroundColor,
          animatingColor:
              buttonStyle.animatingColor ?? theme.primaryColor.lighter,
          elevation: 0,
          fixedSize: (width != null)
              ? Size(width, height ?? buttonSizeType.defaultButtonHeight)
              : null,
          padding: buttonSizeType.padding,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: adaptiveBorderColor,
              width: 1,
            ),
            borderRadius: buttonRadiusSize(buttonRadiusType),
          ),
        ),
      );

      /// if [style] is not null, merge [style] with [secondaryDefaultStyle]
      /// combine customizations from [style] with default style [secondaryDefaultStyle]
      final adaptiveStyle = secondaryDefaultStyle.merge(style);

      /// [updateAnimating] is the callback function to update the state of [ZeroButtonRIcon]
      late Function updateAnimating;

      /// [animatingColor] is the color that will be used for [ZeroButtonRIcon] when it is pressed
      final animatingColor = style?.animatingColor ??
          buttonStyle.animatingColor ??
          Colors.transparent;
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
              child: ZeroButtonRIcon(
                key: key,
                onPressed: () {
                  updateAnimating();
                  onPressed();
                },
                onLongPress: onLongPress,
                style: adaptiveStyle,
                focusNode: focusNode,
                autofocus: autofocus,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        style: textStyle ??
                            TextStyle(
                              fontSize: buttonSizeType.fontSize,
                              color: theme.solidTextColor,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        icon.icon,
                        color: icon.color ?? theme.solidTextColor,
                        size: buttonSizeType.iconSize,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  static Widget text({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButtonRIcon]
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonRIcon]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButtonRIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonRIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonRIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonRIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonRIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonRIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButtonRIcon]
    /// if this value is null, the default style will be used
    /// which is defined in [secondaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButtonRIcon]
    ZeroButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
  }) {
    return Builder(builder: (context) {
      final theme = context.theme;
      final buttonStyle = theme.secondaryButtonStyle;

      /// [secondaryDefaultStyle] is the default style for [ZeroButton.secondary]
      final ZeroButtonStyle secondaryDefaultStyle = buttonStyle.merge(
        ZeroButtonStyle(
          foregroundColor: buttonStyle.foregroundColor ?? ZeroColors.neutral,
          elevation: 0,
          fixedSize: (width != null)
              ? Size(width, height ?? buttonSizeType.defaultButtonHeight)
              : null,
          padding: buttonSizeType.padding,
          shape: RoundedRectangleBorder(
            borderRadius: buttonRadiusSize(buttonRadiusType),
          ),
        ),
      );

      /// if [style] is not null, merge [style] with [secondaryDefaultStyle]
      /// combine customizations from [style] with default style [secondaryDefaultStyle]
      final adaptiveStyle = secondaryDefaultStyle.merge(style);
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
                elevation: 0,
                fixedSize: (width != null)
                    ? Size(width, height ?? buttonSizeType.defaultButtonHeight)
                    : null,
                padding: buttonSizeType.padding,
                shape: RoundedRectangleBorder(
                  borderRadius: buttonRadiusSize(buttonRadiusType),
                ),
              ),
            )
          : SizedBox(
              height: height ?? buttonSizeType.defaultButtonHeight,
              child: ZeroButtonRIcon(
                key: key,
                onPressed: onPressed,
                onLongPress: onLongPress,
                style: adaptiveStyle,
                focusNode: focusNode,
                autofocus: autofocus,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        style: textStyle ??
                            TextStyle(
                              fontSize: buttonSizeType.fontSize,
                              color: theme.solidTextColor,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        icon.icon,
                        color: icon.color ?? theme.solidTextColor,
                        size: buttonSizeType.iconSize,
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }

  static Widget disabled({
    Key? key,

    /// [text] is the text that will be displayed on the button
    required String text,
    required Icon icon,

    /// [textStyle] is the style for [Text] widget inside [ZeroButtonRIcon]
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButtonRIcon]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButtonRIcon]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButtonRIcon]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButtonRIcon] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButtonRIcon] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButtonRIcon] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [style] for customizing button style
    /// if this value is null, the default style will be used
    ZeroButtonStyle? style,
  }) {
    return Builder(builder: (context) {
      final theme = context.theme;

      /// [disabledDefaultStyle] is the default style for [ZeroButton.disabled]
      final ZeroButtonStyle disabledDefaultStyle = ZeroButtonStyle(
        backgroundColor: theme.disabledBackgroundColor,
        foregroundColor: ZeroColors.transparentWhite,
        elevation: 0,
        fixedSize: (width != null)
            ? Size(width, height ?? buttonSizeType.defaultButtonHeight)
            : null,
        padding: buttonSizeType.padding,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: theme.disabledColor.withOpacity(0.5),
            width: 1,
          ),
          borderRadius: buttonRadiusSize(buttonRadiusType),
        ),
      );

      /// [style] is the style for [ZeroButtonRIcon]
      final adaptiveButtonStyle = disabledDefaultStyle.merge(style);

      /// [animatingColor] is the color that will be used for [ZeroButtonRIcon] when it is pressed
      final animatingColor =
          adaptiveButtonStyle.animatingColor ?? ZeroColors.transparent;

      return ButtonAnimating(
        callback: (void Function() update) {
          // do nothing
        },
        buttonRadiusType: buttonRadiusType,
        height: height ?? buttonSizeType.defaultButtonHeight,
        animatingColor: animatingColor,
        child: ZeroButtonRIcon(
          key: key,
          onPressed: () {
            // do nothing
          },
          style: adaptiveButtonStyle,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: textStyle?.copyWith(color: theme.disabledColor) ??
                      TextStyle(
                        fontSize: buttonSizeType.fontSize,
                        color: theme.disabledColor,
                      ),
                ),
                const SizedBox(width: 8),
                Icon(
                  icon.icon,
                  color: icon.color ?? theme.disabledColor,
                  size: buttonSizeType.iconSize,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  /// ZeroButtonStyle is the style for [ZeroButtonRIcon]
  /// styleFrom is the function to create [ButtonStyle] from [ZeroButtonStyle]
  /// [ZeroButtonStyle] is the style for [ZeroButtonRIcon]
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
