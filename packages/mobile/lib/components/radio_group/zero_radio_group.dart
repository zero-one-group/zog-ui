import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// [ZeroRadioGroup] is a custom radio button that can be used to select one option from a set.
/// this widget is based on zero ui design system
class ZeroRadioGroup extends StatefulWidget {
  final String value;
  final String groupValue;
  final void Function(String)? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final ZeroSizeType size;
  final bool isDisabled;

  /// [customSelected] is a boolean that determines whether the selected radio button is a circle with border or a circle with a dot
  final bool customSelected;

  const ZeroRadioGroup({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor = ZeroColors.primary,
    this.inactiveColor = ZeroColors.neutral,
    this.size = ZeroSizeType.medium,
    this.isDisabled = false,
    this.customSelected = false,
  });

  @override
  State<ZeroRadioGroup> createState() => _ZeroRadioGroupState();
}

class _ZeroRadioGroupState extends State<ZeroRadioGroup> {
  bool selected = false;

  @override
  void initState() {
    super.initState();
    selected = widget.groupValue == widget.value;
  }

  @override
  void didUpdateWidget(covariant ZeroRadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    selected = widget.groupValue == widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.isDisabled) return;
        widget.onChanged?.call(widget.value);
      },
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      child: widget.customSelected
          ? _customSelectedCircleColor(
              selected: selected,
              widget: widget,
            )
          : _defaultSelectedCircleColor(
              selected: selected,
              widget: widget,
            ),
    );
  }
}

/// [_customSelectedCircleColor] is a function that returns a circle with border when [customSelected] is true
Widget _customSelectedCircleColor({
  required bool selected,
  required ZeroRadioGroup widget,
}) {
  return Container(
    width: _sizeOutline(widget.size),
    height: _sizeOutline(widget.size),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: widget.isDisabled
            ? ZeroColors.neutral
            : selected
                ? widget.activeColor
                : widget.inactiveColor,
        width: _widthBorderCustom(widget.size),
      ),
    ),
  );
}

/// [_defaultSelectedCircleColor] is a function that returns a circle with a dot when [customSelected] is false
Stack _defaultSelectedCircleColor({
  required bool selected,
  required ZeroRadioGroup widget,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: _sizeOutline(widget.size),
        height: _sizeOutline(widget.size),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: widget.isDisabled
                ? ZeroColors.neutral
                : selected
                    ? widget.activeColor
                    : widget.inactiveColor,
            width: _widthBorder(widget.size),
          ),
        ),
      ),
      selected
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _size(widget.size),
              height: _size(widget.size),
              decoration: BoxDecoration(
                color: widget.isDisabled
                    ? ZeroColors.neutral
                    : selected
                        ? widget.activeColor
                        : widget.inactiveColor,
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
