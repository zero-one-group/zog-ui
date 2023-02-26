import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

const double _kThumbSize = 22;
final _kBorderRadius = BorderRadius.circular(20);

/// basic switch widget component with two states [true] and [false]
/// there are properties to customize the icon and colors of the switch
class ZeroSwitch extends StatelessWidget {
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

  const ZeroSwitch({
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
    final themeStyle = theme.switchStyle.basic;
    final adaptiveStyle = themeStyle.merge(style);

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
            _InactiveLine(
              style: adaptiveStyle,
              isDisabled: isDisabled,
              isActive: value,
            ),
            _ActiveLine(
              style: adaptiveStyle,
              isActive: value,
              isDisabled: isDisabled,
            ),
            _Thumb(
              isActive: value,
              isDisabled: isDisabled,
              style: adaptiveStyle,
              activeIcon: activeIcon,
              inactiveIcon: inactiveIcon,
            ),
          ],
        ),
      ),
    );
  }
}

class _InactiveLine extends StatelessWidget {
  const _InactiveLine({
    required this.style,
    required this.isDisabled,
    required this.isActive,
  });

  final ZeroSwitchStyle style;
  final bool isDisabled;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final switchStyleSet = context.theme.switchStyle;
    final size = style.thumbSize ?? _kThumbSize;
    final color = isDisabled
        ? switchStyleSet.disabledColor
        : isActive
            ? style.activeColor
            : style.inactiveColor;

    return Container(
      width: size * 1.5,
      height: size / 1.5,
      decoration: BoxDecoration(
        borderRadius: _kBorderRadius,
        color: color,
      ),
    );
  }
}

class _ActiveLine extends StatelessWidget {
  const _ActiveLine({
    required this.style,
    required this.isDisabled,
    required this.isActive,
  });
  final ZeroSwitchStyle style;
  final bool isDisabled;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final switchStyleSet = context.theme.switchStyle;
    final color = isDisabled
        ? switchStyleSet.disabledColor
        : isActive
            ? style.activeColor
            : style.inactiveColor;
    final size = style.thumbSize ?? _kThumbSize;

    return AnimatedContainer(
      alignment: Alignment.centerLeft,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: isActive ? size * 1.5 : size / 1.5,
      height: size / 1.5,
      decoration: BoxDecoration(
        borderRadius: _kBorderRadius,
        color: color,
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({
    required this.style,
    required this.isActive,
    required this.isDisabled,
    this.activeIcon,
    this.inactiveIcon,
  });

  final ZeroSwitchStyle style;
  final bool isActive;
  final bool isDisabled;
  final Icon? activeIcon;
  final Icon? inactiveIcon;

  @override
  Widget build(BuildContext context) {
    final enableColor =
        isActive ? style.activeThumbColor : style.inactiveThumbColor;
    const disableColor = Colors.white;
    final color = isDisabled ? disableColor : enableColor;
    final size = style.thumbSize ?? _kThumbSize;

    return IconTheme(
      data: IconThemeData(
        color: ZeroColors.neutral[10],
        size: 15,
      ),
      child: AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        left: !isActive ? 0 - size / 3 : size / 1.25,
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
              color: color,
            ),
            child: Container(
              alignment: Alignment.center,
              child: isActive ? activeIcon : inactiveIcon,
            ),
          ),
        ),
      ),
    );
  }
}
