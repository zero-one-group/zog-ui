import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// [ZeroCheckbox] based on [Checkbox] widget with additional properties [isDisabled] and [size]
/// how to use [ZeroCheckbox] is same as using a [Checkbox] widget
class ZeroCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final Color? activeColor;
  final Color? checkColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool autofocus;

  /// [size] of [ZeroCheckbox] widget
  /// [ZeroSizeType.small] = 0.8
  /// [ZeroSizeType.medium] = 1.0
  /// [ZeroSizeType.large] = 1.2
  ///
  /// the widget will be scaled based on the [size] value using [Transform.scale] widget
  final ZeroSizeType size;

  /// [isDisabled] is a boolean value to disable the [ZeroCheckbox] widget
  /// if [isDisabled] is true, the [ZeroCheckbox] widget will be disabled and the [activeColor] will be [ZeroColors.neutral]
  /// and the [onChanged] will not be called
  final bool isDisabled;

  const ZeroCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.activeColor,
    this.checkColor,
    this.materialTapTargetSize,
    this.visualDensity,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.size = ZeroSizeType.medium,
    this.isDisabled = false,
  });
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      key: key,
      scale: _checkboxScale(size),
      child: Checkbox(
        key: key,
        value: value,
        onChanged: isDisabled ? (_) {} : onChanged,
        tristate: tristate,
        activeColor: isDisabled ? ZeroColors.neutral : activeColor,
        checkColor: checkColor,
        materialTapTargetSize: materialTapTargetSize,
        visualDensity: visualDensity,
        mouseCursor: mouseCursor,
        focusNode: focusNode,
        autofocus: autofocus,
      ),
    );
  }
}

/// [ZeroCheckbox] based on [Checkbox] widget with additional properties [isDisabled] and [size]
double _checkboxScale(ZeroSizeType size) {
  switch (size) {
    case ZeroSizeType.small:
      return .8;
    case ZeroSizeType.medium:
      return 1.0;
    case ZeroSizeType.large:
      return 1.2;
    default:
      return 1;
  }
}
