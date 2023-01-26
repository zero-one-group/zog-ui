import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
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
  final List<T> items;
  final List<T> selectedItems;

  final T? value;

  final Function(T?)? onChanged;

  final bool? enabled;
  final FocusNode? focusNode;

  const ZeroDropdown._(
      {Key? key,
      required this.inputDecorationType,
      required this.onChanged,
      required this.items,
      this.selectedItems = const [],
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
      this.focusNode,
      this.value});

  factory ZeroDropdown.outline({
    Key? key,
    required Function(dynamic) onChanged,
    required List<T> items,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<T> selectedItems = const [],
    T? value,
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
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        selectedItems: selectedItems,
      );
  factory ZeroDropdown.rounded({
    Key? key,
    required Function(dynamic) onChanged,
    required List<T> items,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<T> selectedItems = const [],
    T? value,
  }) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: InputDecorationType.round,
        onChanged: onChanged,
        items: items,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        helperText: helperText,
        helperStyle: helperStyle,
        errorText: errorText,
        errorStyle: errorStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        selectedItems: selectedItems,
      );
  factory ZeroDropdown.fill({
    Key? key,
    required Function(dynamic) onChanged,
    required List<T> items,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<T>? selectedItems,
    T? value,
  }) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: InputDecorationType.fill,
        onChanged: onChanged,
        items: items,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        helperText: helperText,
        helperStyle: helperStyle,
        errorText: errorText,
        errorStyle: errorStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      );
  factory ZeroDropdown.underline({
    Key? key,
    required Function(dynamic) onChanged,
    required List<T> items,
    String? labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    Widget? prefixIcon,
    Widget? suffixIcon,
    List<T>? selectedItems,
    T? value,
  }) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: InputDecorationType.underline,
        onChanged: onChanged,
        items: items,
        labelText: labelText,
        labelStyle: labelStyle,
        hintText: hintText,
        helperText: helperText,
        helperStyle: helperStyle,
        errorText: errorText,
        errorStyle: errorStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      );

  @override
  State<ZeroDropdown<T>> createState() => _ZeroDropdownState<T>();
}

class _ZeroDropdownState<T> extends State<ZeroDropdown<T>> {
  InputDecoration? decoration;
  final List<DropdownMenuItem<T>> _items = [];

  @override
  void initState() {
    decoration = _getDecoration(widget.inputDecorationType);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: decoration,
      isExpanded: true,
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          //disable default onTap to avoid closing menu when selecting an item
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = widget.selectedItems.contains(item);
              return InkWell(
                onTap: () {
                  isSelected
                      ? widget.selectedItems.remove(item)
                      : widget.selectedItems.add(item);
                  //This rebuilds the StatefulWidget to update the button's text
                  setState(() {});
                  menuSetState(() {});
                },
                child: SizedBox(
                  height: double.infinity,
                  child: Row(
                    children: [
                      isSelected
                          ? const Icon(Icons.check_box_outlined)
                          : const Icon(Icons.check_box_outline_blank),
                      const SizedBox(width: 16),
                      Text(
                        item.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
      value: widget.selectedItems.isEmpty ? null : widget.selectedItems.last,
      onChanged: (value) {},
      itemPadding: EdgeInsets.zero,
      selectedItemBuilder: (context) {
        return widget.items.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.selectedItems.join(', '),
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            );
          },
        ).toList();
      },
    );
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

class ZeroDropdownMenuItem<T> extends DropdownMenuItem {
  final bool selected;

  const ZeroDropdownMenuItem(
      {super.key,
      required super.child,
      super.enabled,
      super.alignment,
      super.onTap,
      super.value,
      this.selected = false});
}
