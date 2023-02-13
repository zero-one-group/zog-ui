import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// basic switch widget component with two states [true] and [false]
/// there are properties to customize the icon and colors of the switch
/// [activeIcon] and [inactiveIcon] are used to customize the icon of the switch
/// [activeColor] and [inactiveColor] are used to customize the background color of the switch
/// [activeThumbColor] and [inactiveThumbColor] are used to customize the thumb color of the switch

class ZeroSwitch extends StatelessWidget {
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
  /// it returns the current state of the switch which is [true] or [false] as a parameter
  /// is required
  final Function(bool) onChanged;

  final bool value;

  /// disable the switch
  final bool isDisabled;

  /// custom icon of the switch when it is [true]
  final Icon? activeIcon;

  /// custom icon of the switch when it is [false]
  final Icon? inactiveIcon;

  ZeroSwitch({
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
            _inactiveLine(theme),
            _activeLine(theme),
            _thumb(theme),
          ],
        ),
      ),
    );
  }

  // inactive line
  Widget _inactiveLine(ZeroThemeData theme) {
    Color inactiveLineColor;
    if (isDisabled) {
      inactiveLineColor = theme.disabledBackgroundColor;
    } else {
      inactiveLineColor = inactiveColor ?? ZeroColors.neutral[7];
    }
    return Container(
      width: _thumbSize * 1.5,
      height: _thumbSize / 1.5,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: inactiveLineColor,
      ),
    );
  }

  // active line
  Widget _activeLine(ZeroThemeData theme) {
    Color activeLineColor;
    if (isDisabled) {
      activeLineColor = theme.disabledBackgroundColor;
    } else {
      activeLineColor = activeColor ?? theme.primaryColor.light;
    }
    return AnimatedContainer(
      alignment: Alignment.centerLeft,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: value ? _thumbSize * 1.5 : _thumbSize / 1.5,
      height: _thumbSize / 1.5,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: activeLineColor,
      ),
    );
  }

  // thumb
  Widget _thumb(ZeroThemeData theme) {
    Color thumbColor;
    Icon? icon;
    if (value) {
      thumbColor = activeThumbColor ?? theme.primaryColor;
      icon = activeIcon != null
          ? Icon(
              activeIcon?.icon,
              color: activeIcon?.color ?? ZeroColors.neutral[10],
              size: activeIcon?.size ?? 15,
            )
          : null;
      if (isDisabled) thumbColor = theme.disabledColor;
    } else {
      thumbColor = inactiveThumbColor ?? ZeroColors.neutral[1];
      icon = inactiveIcon != null
          ? Icon(
              inactiveIcon?.icon,
              color: inactiveIcon?.color ?? ZeroColors.neutral[10],
              size: inactiveIcon?.size ?? 15,
            )
          : null;
      if (isDisabled) thumbColor = theme.disabledColor;
    }
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: !value ? 0 - _thumbSize / 3 : _thumbSize / 1.25,
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
          child: Container(
            alignment: Alignment.center,
            child: icon,
          ),
        ),
      ),
    );
  }
}
