import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// [ZeroDropdownMenu] is built on top of [DropdownButtonFormField2] and [ZeroTextField]
/// This uses decoration taken from [InputDecorationType].
class ZeroDropdownMenu<T> extends StatelessWidget {
  final String? labelText;
  final String? helperText;
  final String? hintText;
  final String? errorText;

  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;

  /// If set, this will override `suffixIcon` that is defined in [InputDecoration]
  final Widget? trailingIcon;

  /// Icon placed before the label
  final Widget? leadingIcon;

  /// [ZeroDropdownMenuItem]'s height, the default value is as per set on [ZeroTextfieldSize.small] height
  final double? menuHeight;

  /// [ZeroDropdownMenuItem]'s width, the default value is equal to the screen's width
  final double? width;

  /// Types that are also used on [ZeroTextField] to provide default styling parameters
  /// based on the selected type: [ZeroTextField.outline], [ZeroTextField.rounded], [ZeroTextField.filled],
  /// or [ZeroTextField.underline]
  ///
  /// Default value: [ZeroTextField.outline]
  final InputDecorationType? inputDecorationType;

  /// Default value: [ZeroTextfieldSize.small]
  final ZeroTextfieldSize textfieldSize;

  /// List containing only the selected values, not the [ZeroDropdownMenuItem]
  final List<T> selectedItems;

  /// The value of the last selected item.
  /// If [enableMultipleItems] is true, then the value
  ///  would be the last [selectedItems] element
  final T? value;

  final Function(T?)? onSelected;

  final bool? enabled;

  final FocusNode? focusNode;

  /// If `false`, the width of the dropdown will be larger than the dropdown button
  final bool? alignedDropdown;

  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  final bool enableFilter;

  final bool enableSearch;

  /// List containing only all the values, not the [ZeroDropdownMenuItem]
  final List<T>? items;

  /// List containing only all the [ZeroDropdownMenuEntry]
  final List<ZeroDropdownMenuEntry<T>>? entries;

  /// The [ZeroMenuStyle] that defines the visual attributes of the menu.
  ///
  /// The default width of the menu is set to the width of the text field.
  final ZeroMenuStyle? menuStyle;

  ZeroDropdownMenu(
      {super.key,
      required this.onSelected,
      this.items,
      this.inputDecorationType,
      this.textfieldSize = ZeroTextfieldSize.small,
      this.selectedItems = const [],
      this.labelText,
      this.helperText,
      this.hintText,
      this.errorText,
      this.labelStyle,
      this.errorStyle,
      this.helperStyle,
      this.leadingIcon,
      this.trailingIcon,
      this.menuHeight,
      this.width,
      this.enabled,
      this.focusNode,
      this.value,
      this.alignedDropdown = true,
      this.controller,
      this.enableFilter = true,
      this.enableSearch = true,
      this.entries,
      this.menuStyle}) {
    if (items != null) {
      assert(entries == null,
          'Only items or entries alone must be provided at the same time');
    }
    if (entries != null) {
      assert(items == null,
          'Only items or entries alone must be provided at the same time');
    }
  }

  @override
  Widget build(BuildContext context) {
    late InputDecorationTheme inputDecorationTheme;

    switch (inputDecorationType) {
      case InputDecorationType.outline:
        inputDecorationTheme =
            context.theme.textfieldStyleSet.outline.toInputDecorationTheme();
        break;
      case InputDecorationType.rounded:
        inputDecorationTheme =
            context.theme.textfieldStyleSet.rounded.toInputDecorationTheme();
        break;
      case InputDecorationType.fill:
        inputDecorationTheme =
            context.theme.textfieldStyleSet.filled.toInputDecorationTheme();
        break;
      case InputDecorationType.underline:
        inputDecorationTheme =
            context.theme.textfieldStyleSet.underline.toInputDecorationTheme();
        break;
      default:
        inputDecorationTheme =
            context.theme.textfieldStyleSet.mainStyle.toInputDecorationTheme();
    }

    inputDecorationTheme = inputDecorationTheme.copyWith(
      isDense: false,
      contentPadding: textfieldSize.contentPadding.copyWith(
          top: 16, bottom: 16), // TODO: Revisit and investigate further
      alignLabelWithHint: true,
    );

    return CustomDropdownMenu<T>(
      leadingIcon: leadingIcon,
      label: labelText != null
          ? Text(
              labelText!,
              style: labelStyle,
            )
          : null,
      hintText: hintText,
      enabled: enabled ?? true,
      width: width,
      menuStyle: menuStyle,
      textStyle: labelStyle,
      trailingIcon: trailingIcon,
      inputDecorationTheme: inputDecorationTheme,
      menuHeight: menuHeight,
      enableFilter: enableFilter,
      onSelected: onSelected,
      controller: controller,
      dropdownMenuEntries: entries ??
          items!.map((item) {
            return ZeroDropdownMenuEntry<T>(
              value: item,
              label: item.toString(),
            );
          }).toList(),
    );
  }
}
