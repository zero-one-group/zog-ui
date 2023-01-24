import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

/// [ZeroRadioGroup] based on [Radio] widget with additional properties [isDisabled] and [size]
/// how to use [ZeroRadioGroup] is same as using a [Radio] widget
class ZeroRadioGroup extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final MouseCursor? mouseCursor;
  final bool toggleable;
  final Color? activeColor;
  final MaterialStateProperty<Color?>? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final bool autofocus;

  /// [size] of [ZeroRadioGroup] widget
  /// [ZeroSizeType.small] = 0.8
  /// [ZeroSizeType.medium] = 1.0
  /// [ZeroSizeType.large] = 1.2
  ///
  /// the widget will be scaled based on the [size] value using [Transform.scale] widget
  final ZeroSizeType size;

  /// [isDisabled] is a boolean value to disable the [ZeroRadioGroup] widget
  /// if [isDisabled] is true, the [ZeroRadioGroup] widget will be disabled and the [activeColor] will be [ZeroColors.neutral6]
  /// and the [onChanged] will not be called
  final bool isDisabled;

  const ZeroRadioGroup({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.size = ZeroSizeType.medium,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _radioScale(size),
      key: key,
      child: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: (value) {
          if (isDisabled) return;
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        toggleable: toggleable,
        mouseCursor: mouseCursor,
        activeColor: isDisabled ? ZeroColors.neutral6 : activeColor,
        fillColor: fillColor,
        focusColor: focusColor,
        hoverColor: hoverColor,
        overlayColor: overlayColor,
        splashRadius: splashRadius,
        materialTapTargetSize: materialTapTargetSize,
        visualDensity: visualDensity,
        focusNode: focusNode,
        autofocus: autofocus,
      ),
    );
  }
}

/// [_radioScale] is a function to scale the [ZeroRadioGroup] widget based on the [size] value
double _radioScale(ZeroSizeType size) {
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
