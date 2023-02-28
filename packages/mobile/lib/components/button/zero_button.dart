import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// ZeroButton created based on [ElevatedButton] and [TextButton] with some customizations
/// how to use this widget is almost the same as [ElevatedButton], [TextButton], [OutlinedButton]
///
/// [ZeroButton] has 3 types:
/// - [ZeroButton.primary] is the default button type
/// - [ZeroButton.secondary] is the secondary button type
/// - [ZeroButton.disabled] is the disabled button type
///
/// [ZeroButton] has 2 size types:
/// - [ZeroSizeType.small] is the small button size type
/// - [ZeroSizeType.medium] is the medium button size type
/// - [ZeroSizeType.large] is the large button size type
///
/// [ZeroButton] has 2 radius types:
/// - [ZeroButtonRadiusType.rounded] is the rounded button radius type
/// - [ZeroButtonRadiusType.rectangle] is the rectangle button radius type
///
/// this button is customizable with [ZeroButtonStyle] or [ZeroButton.styleFrom({...}).toButtonStyle()] which is based on [ButtonStyle]

class ZeroButton extends ElevatedButton {
  ZeroButton._({
    super.key,
    required super.onPressed,
    super.onLongPress,
    required ZeroButtonStyle style,
    super.focusNode,
    super.autofocus = false,
    required super.child,
  }) : super(
          style: style.toButtonStyle(),
        );

  static Widget primary({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButton]
    required String text,

    /// [textStyle] is the style for [Text] widget inside [ZeroButton]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButton]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButton]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButton]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButton] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButton] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButton] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButton]
    /// if this value is null, the default style will be used
    /// which is defined in [primaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButton]
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
          elevation: 0,
          backgroundColor: buttonStyle.backgroundColor ?? theme.primaryColor,
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

      return isDisabled
          ? disabled(
              text: text,
              textStyle: textStyle,
              width: width,
              height: height,
              buttonSizeType: buttonSizeType,
              buttonRadiusType: buttonRadiusType,
            )
          : ZeroButton._(
              key: key,
              onPressed: onPressed,
              onLongPress: onLongPress,
              style: adaptiveStyle,
              focusNode: focusNode,
              autofocus: autofocus,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  text,
                  style: theme.typography.button?.merge(
                    textStyle?.copyWith(color: Colors.white) ??
                        TextStyle(
                          fontSize: buttonSizeType.fontSize,
                          color: ZeroColors.white,
                        ),
                  ),
                ),
              ),
            );
    });
  }

  static Widget secondary({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButton]
    required String text,

    /// [textStyle] is the style for [Text] widget inside [ZeroButton]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [selectedBorderColor] is the border color for [ZeroButton]
    Color? borderColor,

    /// [width] is the width for [ZeroButton]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButton]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButton]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButton] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButton] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButton] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButton]
    /// if this value is null, the default style will be used
    /// which is defined in [secondaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButton]
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

      return isDisabled
          ? disabled(
              text: text,
              textStyle: textStyle,
              width: width,
              height: height,
              buttonSizeType: buttonSizeType,
              buttonRadiusType: buttonRadiusType,
            )
          : ZeroButton._(
              key: key,
              onPressed: onPressed,
              onLongPress: onLongPress,
              style: adaptiveStyle,
              focusNode: focusNode,
              autofocus: autofocus,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  text,
                  style: theme.typography.button?.merge(
                    textStyle ??
                        TextStyle(
                          fontSize: buttonSizeType.fontSize,
                        ),
                  ),
                ),
              ),
            );
    });
  }

  static Widget text({
    Key? key,

    /// [text] is the text that will be displayed on the button
    /// this value will be used as text value for [Text] widget inside [ZeroButton]
    required String text,

    /// [textStyle] is the style for [Text] widget inside [ZeroButton]
    /// if this value is null, the default style will be used
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButton]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButton]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButton]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButton] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButton] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButton] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [isDisabled] is the flag to determine if the button is disabled or not
    bool isDisabled = false,
    required VoidCallback onPressed,
    VoidCallback? onLongPress,

    /// [ZeroButtonStyle] is the style for [ZeroButton]
    /// if this value is null, the default style will be used
    /// which is defined in [secondaryDefaultStyle]
    ///
    /// [style] used for customizing [ZeroButton]
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
          animatingColor:
              buttonStyle.animatingColor ?? theme.primaryColor.lighter,
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
              textStyle: textStyle,
              width: width,
              height: height,
              buttonSizeType: buttonSizeType,
              buttonRadiusType: buttonRadiusType,
              style: ZeroButtonStyle(
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
              child: ZeroButton._(
                key: key,
                onPressed: onPressed,
                onLongPress: onLongPress,
                style: adaptiveStyle,
                focusNode: focusNode,
                autofocus: autofocus,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    text,
                    style: theme.typography.button?.merge(
                      textStyle ??
                          TextStyle(
                            fontSize: buttonSizeType.fontSize,
                          ),
                    ),
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

    /// [textStyle] is the style for [Text] widget inside [ZeroButton]
    TextStyle? textStyle,

    /// [width] is the width for [ZeroButton]
    /// if this value is null, widget will be sized to fit its contents
    double? width,

    /// [height] is the height for [ZeroButton]
    /// if this value is null, the default height get from [defaultButtonHeight] which is the value based on [buttonSizeType]
    double? height,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,

    /// [buttonRadiusType] is the type of radius for [ZeroButton]
    /// [ZeroButtonRadiusType.rectangle] is the type of radius for [ZeroButton] that has rectangle shape
    /// [ZeroButtonRadiusType.rounded] is the type of radius for [ZeroButton] that has rounded shape
    /// [ZeroButtonRadiusType.curved] is the type of radius for [ZeroButton] that has curved shape
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.rectangle,

    /// [style] for customizing button style
    /// if this value is null, the default style will be used
    ZeroButtonStyle? style,
  }) {
    return Builder(builder: (context) {
      final theme = context.theme;

      /// [textStyle] is the style for [Text] widget inside [ZeroButton]
      /// if this value is null, the default style will be used
      textStyle ??= TextStyle(
        fontSize: buttonSizeType.fontSize,
        color: theme.disabledColor,
      );

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

      /// [style] is the style for [ZeroButton]
      final adaptiveButtonStyle = disabledDefaultStyle.merge(style);

      return ZeroButton._(
        key: key,
        onPressed: () {
          // do nothing
        },
        style: adaptiveButtonStyle,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      );
    });
  }

  /// ZeroButtonStyle is the style for [ZeroButton]
  /// styleFrom is the function to create [ButtonStyle] from [ZeroButtonStyle]
  /// [ZeroButtonStyle] is the style for [ZeroButton]
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
