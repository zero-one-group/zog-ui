import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// [ZeroRadioGroup] is a custom radio button that can be used to select one option from a set.
/// this widget is based on zero ui design system
class ZeroRadioGroup<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T>? onChanged;
  final ZeroRadioStyle? style;
  final ZeroSizeType size;
  final bool isDisabled;

  /// [customSelected] is a boolean that determines whether the selected radio button is a circle with border or a circle with a dot
  final bool customSelected;

  const ZeroRadioGroup({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.style,
    this.size = ZeroSizeType.medium,
    this.isDisabled = false,
    this.customSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.radioStyle;
    final adaptiveStyle = themeStyle.merge(style);

    final selected = value == groupValue;

    return InkWell(
      onTap: isDisabled
          ? null
          : () {
              onChanged?.call(value);
            },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: customSelected
          ? _customSelectedCircleColor(selected: selected, style: adaptiveStyle)
          : _defaultSelectedCircleColor(
              selected: selected, style: adaptiveStyle),
    );
  }

  /// [_customSelectedCircleColor] is a function that returns a circle with border when [customSelected] is true
  Widget _customSelectedCircleColor({
    required bool selected,
    required ZeroRadioStyle style,
  }) {
    final disabledColor = style.disabledColor?.withOpacity(0.4);
    final activeColor = selected ? style.activeColor : style.inactiveColor;
    final color =
        (isDisabled ? disabledColor : activeColor) ?? ZeroColors.neutral;
    return Container(
      width: _sizeOutline(size),
      height: _sizeOutline(size),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: color,
          width: _widthBorderCustom(size),
        ),
      ),
    );
  }

  /// [_defaultSelectedCircleColor] is a function that returns a circle with a dot when [customSelected] is false
  Stack _defaultSelectedCircleColor({
    required bool selected,
    required ZeroRadioStyle style,
  }) {
    final disabledColor = style.disabledColor?.withOpacity(0.4);
    final activeColor = selected ? style.activeColor : style.inactiveColor;
    final color =
        (isDisabled ? disabledColor : activeColor) ?? ZeroColors.neutral;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: _sizeOutline(size),
          height: _sizeOutline(size),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: color,
              width: _widthBorder(size),
            ),
          ),
        ),
        selected
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _size(size),
                height: _size(size),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            : AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 0,
                height: 0,
              ),
      ],
    );
  }

  /// [_size] is a function that returns the size of the circle with a dot
  double _size(ZeroSizeType size) {
    switch (size) {
      case ZeroSizeType.small:
        return 8.0;
      case ZeroSizeType.medium:
        return 10.0;
      case ZeroSizeType.large:
        return 12.0;
    }
  }

  /// [_sizeOutline] is a function that returns the size of the circle with border
  double _sizeOutline(ZeroSizeType size) {
    switch (size) {
      case ZeroSizeType.small:
        return 16.0;
      case ZeroSizeType.medium:
        return 20.0;
      case ZeroSizeType.large:
        return 24.0;
    }
  }

  /// [_widthBorder] is a function that returns the width of the border
  double _widthBorder(ZeroSizeType size) {
    switch (size) {
      case ZeroSizeType.small:
        return 1.5;
      case ZeroSizeType.medium:
        return 2;
      case ZeroSizeType.large:
        return 2.5;
    }
  }

  /// [_widthBorderCustom] is a function that returns the width of the border when [customSelected] is true
  double _widthBorderCustom(ZeroSizeType size) {
    switch (size) {
      case ZeroSizeType.small:
        return 4.0;
      case ZeroSizeType.medium:
        return 5.0;
      case ZeroSizeType.large:
        return 6.0;
    }
  }
}
