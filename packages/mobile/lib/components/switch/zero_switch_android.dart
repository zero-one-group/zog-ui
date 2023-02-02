import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/utils/extensions/theme_extensions.dart';

import '../../styles/colors.dart';

/// switch widget component adopted from android switch style
/// there are properties to customize the icon and colors of the switch
/// [activeIcon] and [inactiveIcon] are used to customize the icon of the switch
/// [activeColor] and [inactiveColor] are used to customize the background color of the switch
/// [activeThumbColor] and [inactiveThumbColor] are used to customize the thumb color of the switch
class ZeroSwitchAndroid extends StatefulWidget {
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

  /// initial state of the switch when it is created
  final bool initialValue;

  /// disable the switch
  final bool isDisabled;

  /// custom icon of the switch when it is [true]
  final Icon? activeIcon;

  /// custom icon of the switch when it is [false]
  final Icon? inactiveIcon;

  const ZeroSwitchAndroid({
    super.key,
    this.activeColor,
    this.inactiveColor,
    this.activeThumbColor,
    this.inactiveThumbColor,
    required this.onChanged,
    this.initialValue = false,
    this.isDisabled = false,
    this.activeIcon,
    this.inactiveIcon,
  });

  @override
  State<ZeroSwitchAndroid> createState() => _ZeroSwitchAndroidState();
}

class _ZeroSwitchAndroidState extends State<ZeroSwitchAndroid> {
  final double _thumbSize = 22;
  bool _value = false;
  final _borderRadius = BorderRadius.circular(20);

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      onTap: () {
        if (widget.isDisabled) return;
        setState(() {
          _value = !_value;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            _line(),
            _thumb(),
          ],
        ),
      ),
    );
  }

  // inactive line
  Widget _line() {
    Color inactiveColor;
    Icon? icon;

    if (_value) {
      inactiveColor = widget.activeColor ?? context.theme.primaryColor.light;
      icon = widget.activeIcon != null
          ? Icon(
              widget.activeIcon?.icon,
              color: widget.activeIcon?.color ?? ZeroColors.neutral[10],
              size: widget.activeIcon?.size ?? 15,
            )
          : null;
      if (widget.isDisabled) inactiveColor = ZeroColors.neutral[5];
    } else {
      inactiveColor = widget.inactiveColor ?? ZeroColors.neutral[7];
      icon = widget.inactiveIcon != null
          ? Icon(
              widget.inactiveIcon?.icon,
              color: widget.inactiveIcon?.color ?? ZeroColors.neutral[10],
              size: widget.inactiveIcon?.size ?? 15,
            )
          : null;
      if (widget.isDisabled) inactiveColor = ZeroColors.neutral[3];
    }

    return Container(
      width: _thumbSize * 2 + _thumbSize / 10,
      height: _thumbSize * 1.2,
      decoration: BoxDecoration(
        borderRadius: _borderRadius,
        color: inactiveColor,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        alignment: _value ? Alignment.centerLeft : Alignment.centerRight,
        child: icon,
      ),
    );
  }

  // thumb
  Widget _thumb() {
    Color thumbColor;
    if (_value) {
      thumbColor = widget.activeThumbColor ?? context.theme.primaryColor;
      if (widget.isDisabled) thumbColor = ZeroColors.neutral[5];
    } else {
      thumbColor = widget.inactiveThumbColor ?? ZeroColors.neutral[1];
      if (widget.isDisabled) thumbColor = ZeroColors.neutral[3];
    }
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: !_value ? _thumbSize / 10 : _thumbSize,
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
