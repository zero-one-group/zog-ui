import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

const double _kThumbSize = 22;
final _kBorderRadius = BorderRadius.circular(20);

/// switch widget component adapted to iOS switch style
/// there are properties to customize the icon and colors of the switch
class ZeroSwitchIOS extends StatelessWidget {
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

  const ZeroSwitchIOS({
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
    final themeStyle = theme.switchStyle.iOS;
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
            _Line(
              style: adaptiveStyle,
              isActive: value,
              isDisabled: isDisabled,
            ),
            _Thumb(
              style: adaptiveStyle,
              isActive: value,
              isDisabled: isDisabled,
            ),
          ],
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({
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
    final enableColor = isActive ? style.activeColor : style.inactiveColor;
    final disableColor = switchStyleSet.disabledColor;
    final color = isDisabled ? disableColor : enableColor;

    return Container(
      width: size * 1.8 + size / 20,
      height: size * 1.1,
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
  });

  final ZeroSwitchStyle style;
  final bool isActive;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final size = style.thumbSize ?? _kThumbSize;
    final enableColor =
        isActive ? style.activeThumbColor : style.inactiveThumbColor;
    final disableColor = ZeroColors.neutral[1];
    final color = isDisabled ? disableColor : enableColor;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: !isActive ? size / 20 : size * 1.8 - size,
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
        ),
      ),
    );
  }
}
