import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// [ZeroCheckbox] based on [Checkbox] widget with additional properties [isDisabled] and [size]
/// how to use [ZeroCheckbox] is same as using a [Checkbox] widget
class ZeroCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
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

  final ZeroCheckboxStyle? style;

  const ZeroCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.tristate = false,
    this.materialTapTargetSize,
    this.visualDensity,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.size = ZeroSizeType.medium,
    this.isDisabled = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.checkboxStyle;
    final adaptiveStyle = themeStyle.merge(style);
    final borderColor =
        isDisabled ? adaptiveStyle.disabledColor : adaptiveStyle.inactiveColor;

    return Transform.scale(
      key: key,
      scale: _checkboxScale(size),
      child: Checkbox(
        key: key,
        value: value,
        onChanged: isDisabled ? null : onChanged,
        tristate: tristate,
        activeColor: isDisabled
            ? adaptiveStyle.disabledColor
            : adaptiveStyle.activeColor,
        fillColor: isDisabled
            ? MaterialStateProperty.all(
                adaptiveStyle.disabledColor?.withOpacity(0.5),
              )
            : MaterialStateProperty.all(adaptiveStyle.activeColor),
        checkColor: adaptiveStyle.checkColor,
        materialTapTargetSize: materialTapTargetSize,
        visualDensity: visualDensity,
        mouseCursor: mouseCursor,
        focusNode: focusNode,
        autofocus: autofocus,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent),
          borderRadius: adaptiveStyle.borderRadius ?? BorderRadius.zero,
        ),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: adaptiveStyle.borderSize ?? 1,
        ),
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
