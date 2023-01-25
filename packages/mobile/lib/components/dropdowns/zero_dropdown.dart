import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/textfield/zero_textfield.dart';
import 'package:zero_ui_mobile/types/textfield/input_decoration_type.dart';

class ZeroDropdown<T> extends StatefulWidget {
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final String? errorText;

  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;

  /// If set, this will override `prefixIcon` that is defined in [InputDecoration]
  final Widget? prefixIcon;

  /// If set, this will override `suffixIcon` that is defined in [InputDecoration]
  final Widget? suffixIcon;

  final InputDecorationType inputDecorationType;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;

  final bool? enabled;
  final FocusNode? focusNode;

  const ZeroDropdown._(
      {Key? key,
      required this.inputDecorationType,
      required this.onChanged,
      required this.items,
      this.labelText,
      this.helperText,
      this.hintText,
      this.errorText,
      this.labelStyle,
      this.errorStyle,
      this.helperStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.enabled,
      this.focusNode});

  factory ZeroDropdown.outline({
    Key? key,
    required Function(dynamic) onChanged,
    required List<DropdownMenuItem<T>> items,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
  }) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: InputDecorationType.outline,
        onChanged: onChanged,
        items: items,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        helperText: helperText,
        helperStyle: helperStyle,
        errorText: errorText,
        errorStyle: errorStyle,
      );

  @override
  State<ZeroDropdown<T>> createState() => _ZeroDropdownState<T>();
}

class _ZeroDropdownState<T> extends State<ZeroDropdown<T>> {
  InputDecoration? decoration;

  @override
  void initState() {
    decoration = _getDecoration(widget.inputDecorationType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
      decoration: decoration,
      items: widget.items,
      onChanged: widget.onChanged,
    ));
  }

  InputDecoration? _getDecoration(InputDecorationType inputDecorationType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return ZeroTextField.outline(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;
      case InputDecorationType.round:
        return ZeroTextField.rounded(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;
      case InputDecorationType.fill:
        return ZeroTextField.fill(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;
      case InputDecorationType.underline:
        return ZeroTextField.underline(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;
    }
  }
}
