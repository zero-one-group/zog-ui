import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// switch widget component adapted to iOS switch style
/// there are properties to customize the icon and colors of the switch
/// [activeIcon] and [inactiveIcon] are used to customize the icon of the switch
/// [activeColor] and [inactiveColor] are used to customize the background color of the switch

class ZeroSwitchIOS extends StatelessWidget {
  /// background color of the switch when it is [true]
  /// default value is from [context.theme.primaryColor.dark]
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
  final Function(bool) onChanged;

  final bool value;

  /// disable the switch
  /// default value is [false]
  final bool isDisabled;

  ZeroSwitchIOS({
    super.key,
    this.activeColor,
    this.inactiveColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    required this.onChanged,
    required this.value,
    this.isDisabled = false,
  });

  final double _thumbSize = 28;

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
    if (!value) {
      lineColor = inactiveColor ?? ZeroColors.neutral[7];
      if (isDisabled) lineColor = theme.disabledColor;
    } else {
      lineColor = activeColor ?? theme.primaryColor;
      if (isDisabled) lineColor = theme.disabledColor;
    }

    return Container(
      width: _thumbSize * 1.8 + _thumbSize / 20,
      height: _thumbSize * 1.1,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: lineColor,
      ),
    );
  }

  // thumb
  Widget _thumb(ZeroThemeData theme) {
    Color thumbColor;
    if (!value) {
      thumbColor = activeThumbColor ?? ZeroColors.neutral[1];
      if (isDisabled) thumbColor = theme.disabledBackgroundColor;
    } else {
      thumbColor = inactiveThumbColor ?? ZeroColors.neutral[1];
      if (isDisabled) thumbColor = theme.disabledBackgroundColor;
    }
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: !value ? _thumbSize / 20 : _thumbSize * 1.8 - _thumbSize,
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
