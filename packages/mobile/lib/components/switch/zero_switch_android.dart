import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

const double _kThumbSize = 22;
final _kBorderRadius = BorderRadius.circular(20);

/// switch widget component adopted from android switch style
class ZeroSwitchAndroid extends StatelessWidget {
  /// Allow to custom style, by preferences
  ///
  /// This style will override global theme
  final ZeroSwitchStyle? style;

  /// callback function when the switch is tapped
  final ValueChanged<bool> onChanged;

  /// initial state of the switch when it is created
  final bool value;

  /// disable the switch
  final bool isDisabled;

  /// custom icon of the switch when it is [true]
  final Icon? activeIcon;

  /// custom icon of the switch when it is [false]
  final Icon? inactiveIcon;

  const ZeroSwitchAndroid({
    super.key,
    this.style,
    required this.onChanged,
    this.value = false,
    this.isDisabled = false,
    this.activeIcon,
    this.inactiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeStyle = theme.switchStyle.android;
    final adaptiveStyle = themeStyle?.merge(style);

    return InkWell(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        return Colors.transparent;
      }),
      onTap: isDisabled
          ? null
          : () {
              onChanged(!value);
            },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            _Line(
              isActive: value,
              isDisabled: isDisabled,
              style: adaptiveStyle,
              activeIcon: activeIcon,
              inactiveIcon: inactiveIcon,
            ),
            _Thumb(
              isActive: value,
              isDisabled: isDisabled,
              style: adaptiveStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({
    required this.isActive,
    required this.isDisabled,
    required this.style,
  });

  final bool isActive;
  final bool isDisabled;
  final ZeroSwitchStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final thumbEnableColor = isActive
        ? (style?.activeThumbColor ?? theme.primaryColor)
        : (style?.inactiveThumbColor ?? theme.disabledColor);
    final thumbDisabledColor = ZeroColors.neutral[1];
    final thumbColor = isDisabled ? thumbDisabledColor : thumbEnableColor;

    final size = style?.thumbSize ?? _kThumbSize;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: !isActive ? size / 10 : size,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: _kBorderRadius,
        ),
        elevation: 2,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: _kBorderRadius,
            color: thumbColor,
          ),
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({
    required this.isActive,
    required this.isDisabled,
    required this.style,
    this.activeIcon,
    this.inactiveIcon,
  });

  final bool isActive;
  final ZeroSwitchStyle? style;
  final bool isDisabled;
  final Icon? activeIcon;
  final Icon? inactiveIcon;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final switchStyleSet = theme.switchStyle;
    final enableColor = isActive ? style?.activeColor : style?.inactiveColor;
    final disableColor = switchStyleSet.disabledColor;

    final color = isDisabled ? disableColor : enableColor;
    final size = style?.thumbSize ?? _kThumbSize;

    return IconTheme(
      data: IconThemeData(
        color: ZeroColors.neutral[10],
        size: 15,
      ),
      child: Container(
        width: size * 2 + size / 10,
        height: size * 1.2,
        decoration: BoxDecoration(
          borderRadius: _kBorderRadius,
          color: color,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          alignment: isActive ? Alignment.centerLeft : Alignment.centerRight,
          child: isActive ? activeIcon : inactiveIcon,
        ),
      ),
    );
  }
}
