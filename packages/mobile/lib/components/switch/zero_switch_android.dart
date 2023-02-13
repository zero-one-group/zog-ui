import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// switch widget component adopted from android switch style
/// there are properties to customize the icon and colors of the switch
/// [activeIcon] and [inactiveIcon] are used to customize the icon of the switch
/// [activeColor] and [inactiveColor] are used to customize the background color of the switch
/// [activeThumbColor] and [inactiveThumbColor] are used to customize the thumb color of the switch

class ZeroSwitchAndroid extends StatelessWidget {
  /// background color of the switch when it is [true]
  /// default value is from [context.theme.primaryColor.light]
  final Color? activeColor;

  /// background color of the switch when it is [false]
  /// default value is [ZeroColors.neutral]
  final Color? inactiveColor;

  /// thumb color of the switch when it is [true]
  /// default value is from [context.theme.primaryColor]
  final Color? activeThumbColor;

  /// thumb color of the switch when it is [false]
  /// default value is [ZeroColors.neutral]
  final Color? inactiveThumbColor;

  /// callback function when the switch is tapped
  final Function(bool) onChanged;

  final bool value;

  /// disable the switch
  final bool isDisabled;

  /// custom icon of the switch when it is [true]
  final Icon? activeIcon;

  /// custom icon of the switch when it is [false]
  final Icon? inactiveIcon;

  ZeroSwitchAndroid({
    super.key,
    this.activeColor,
    this.inactiveColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    required this.onChanged,
    required this.value,
    this.isDisabled = false,
    this.activeIcon,
    this.inactiveIcon,
  });

  final double _thumbSize = 22;
  final _borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    final ZeroThemeData theme = context.theme;
    return InkWell(
      overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      onTap: () {
        if (isDisabled) return;
        onChanged(!value);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            _line(theme),
            _thumb(theme),
          ],
        ),
      ),
    );
  }

  // inactive line
  Widget _line(ZeroThemeData theme) {
    Color lineColor;
    Icon? icon;

    if (!value) {
      lineColor = inactiveColor ?? ZeroColors.neutral[7];
      icon = inactiveIcon != null
          ? Icon(
              inactiveIcon?.icon,
              color: inactiveIcon?.color ?? ZeroColors.neutral[10],
              size: inactiveIcon?.size ?? 15,
            )
          : null;
      if (isDisabled) lineColor = theme.disabledBackgroundColor;
    } else {
      lineColor = activeColor ?? theme.primaryColor.light;
      icon = activeIcon != null
          ? Icon(
              activeIcon?.icon,
              color: activeIcon?.color ?? ZeroColors.neutral[10],
              size: activeIcon?.size ?? 15,
            )
          : null;
      if (isDisabled) lineColor = theme.disabledColor;
    }

    return Container(
      width: _thumbSize * 2 + _thumbSize / 10,
      height: _thumbSize * 1.2,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: lineColor,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        alignment: value ? Alignment.centerLeft : Alignment.centerRight,
        child: icon,
      ),
    );
  }

  // thumb
  Widget _thumb(ZeroThemeData theme) {
    Color thumbColor;
    if (!value) {
      thumbColor = inactiveThumbColor ?? ZeroColors.neutral[1];
      if (isDisabled) thumbColor = theme.disabledColor;
    } else {
      thumbColor = activeThumbColor ?? theme.primaryColor;
      if (isDisabled) thumbColor = theme.disabledBackgroundColor;
    }
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: !value ? _thumbSize / 10 : _thumbSize,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: _borderRadius,
        ),
        elevation: 2,
        child: Container(
          width: _thumbSize,
          height: _thumbSize,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: thumbColor,
          ),
        ),
      ),
    );
  }
}
