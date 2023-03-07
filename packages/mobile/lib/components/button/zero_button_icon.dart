import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

enum _ZeroButtonIconType {
  primary,
  secondary,
  disabled;

  /// Get state current type is primary or not
  ///
  /// If primary return true, otherwise return false
  bool get isPrimary => this == _ZeroButtonIconType.primary;

  /// Get state current type is secondary or not
  ///
  /// If secondary return true, otherwise return false
  bool get isSecondary => this == _ZeroButtonIconType.secondary;
}

class ZeroButtonIcon extends StatelessWidget {
  /// The child icon of button
  ///
  /// As usually [icon] use widget [Icon]
  final Widget icon;

  /// Callback when button tap/pressed
  final VoidCallback? onPressed;

  /// Allow to cutomize style by preferences
  final ZeroButtonIconStyle? style;

  /// Size of button
  final ZeroButtonSize size;

  /// Local type button primary, secondary, or disabeld
  final _ZeroButtonIconType _type;

  /// Border radius of [ZeroButtonIcon]
  final ZeroButtonRadiusType borderRadiusType;

  /// Build button icon with primary style
  ///
  /// By default when [onPressed] is null, automatically style is disabled
  const ZeroButtonIcon.primary({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.style,
    this.size = ZeroButtonSize.medium,
    this.borderRadiusType = ZeroButtonRadiusType.rectangle,
  })  : _type = _ZeroButtonIconType.primary,
        super(key: key);

  /// Build button icon with secondary style
  ///
  /// By default when [onPressed] is null, automatically style is disabled
  const ZeroButtonIcon.secondary({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.style,
    this.size = ZeroButtonSize.medium,
    this.borderRadiusType = ZeroButtonRadiusType.rectangle,
  })  : _type = _ZeroButtonIconType.secondary,
        super(key: key);

  /// Build disabled button
  ///
  /// This button can't tap/pressed
  const ZeroButtonIcon.disabled({
    Key? key,
    required this.icon,
    this.style,
    this.size = ZeroButtonSize.medium,
    this.borderRadiusType = ZeroButtonRadiusType.rectangle,
  })  : onPressed = null,
        _type = _ZeroButtonIconType.disabled,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeStyle = theme.buttonIconStyle;
    ZeroButtonIconStyle? localStyle;

    switch (_type) {
      case _ZeroButtonIconType.primary:
        localStyle = themeStyle.primaryStyle;
        break;
      case _ZeroButtonIconType.secondary:
        localStyle = themeStyle.secondaryStyle;
        break;
      default:
        localStyle = themeStyle.primaryStyle;
    }
    final isDisabled = onPressed == null;

    final adaptiveStyle =
        (localStyle ?? ZeroButtonIconStyle.fallback()).merge(style);
    final backgroundColor = isDisabled
        ? theme.disabledBackgroundColor
        : _type.isPrimary
            ? adaptiveStyle.color
            : Colors.transparent;

    final iconColor = isDisabled
        ? (themeStyle.disabledColor ?? theme.disabledColor)
        : (_type.isPrimary
            ? adaptiveStyle.iconColor ?? Colors.white
            : adaptiveStyle.iconColor ??
                adaptiveStyle.color ??
                theme.primaryColor);

    final borderColor = isDisabled
        ? theme.dividerColor
        : _type.isSecondary
            ? iconColor
            : null;

    final isRounded = borderRadiusType == ZeroButtonRadiusType.rounded;

    return Material(
      color: backgroundColor,
      elevation: 0,
      type: isRounded ? MaterialType.circle : MaterialType.canvas,
      shape: isRounded
          ? null
          : RoundedRectangleBorder(
              side: borderColor != null
                  ? BorderSide(color: borderColor)
                  : BorderSide.none,
              borderRadius: borderRadiusType != ZeroButtonRadiusType.rectangle
                  ? borderRadiusType.borderRadius
                  : BorderRadius.zero,
            ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadiusType.borderRadius,
        child: SizedBox(
          width: size.getSize(themeStyle),
          height: size.getSize(themeStyle),
          child: IconTheme(
            data: IconThemeData(
              size: (adaptiveStyle.iconSize ?? 16) +
                  size.iconSizeCorrection(themeStyle),
              color: iconColor,
            ),
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
