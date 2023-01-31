import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum MultipleItemsVariant {
  /// Just text with no checkbox
  plain,

  /// Text and checkbox
  checkboxes,
}

/// Style variant of [ZeroDropdown]'s selected items
/// Only used when parameter `enableMultiItems` of [ZeroDropdown] is true.
enum SelectedItemsStyle {
  /// Just multiple texts separated by commas
  text,

  /// Texts inside capsule with fill color applied to the capsule while background color is white
  chip,

  /// Texts inside capsule with fill color applied to the background, while capsule color is white
  chipInverted,
  ;

  /// Only when [SelectedItemsStyle.chipInverted] selected, the dropdown must have the [InputDecoration]'s
  /// filled set `true`
  bool get isDropdownFilled => this == chipInverted;
}

/// [ZeroDropdown] is built on top of [DropdownButtonFormField2] and [ZeroTextField]
/// This uses decoration taken from [InputDecorationType].
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

  /// [DropdownMenuItem]'s height, the default value is as per set on [TextfieldSizeType.small] height
  final double? itemHeight;

  /// Types that are also used on [ZeroTextField] to provide default styling parameters
  /// based on the selected type: [ZeroTextField.outline], [ZeroTextField.rounded], [ZeroTextField.fill],
  /// or [ZeroTextField.underline]
  ///
  /// Default value: [ZeroTextField.outline]
  final InputDecorationType inputDecorationType;

  /// Default value: [TextfieldSizeType.small]
  final TextfieldSizeType textfieldSizeType;

  /// List containing only all the values, not the [DropdownMenuItem]
  final List<T> items;

  /// List containing only the selected values, not the [DropdownMenuItem]
  final List<T> selectedItems;

  /// The value of the last selected item.
  /// If [enableMultipleItems] is true, then the value
  ///  would be the last [selectedItems] element
  final T? value;

  final Function(T?)? onChanged;

  final bool? enabled;
  final FocusNode? focusNode;

  /// Default value: `false`
  /// If true, the dropdown menu item would become multi-selectable
  /// This, the dropdown would not be automatically closed when an item is checked/uncheck
  /// But rather user has to click outside or press back button
  final bool enableMultipleItems;

  /// Builder to build default menu item widget
  /// If not set, it will default to [_MenuItem]
  final Widget Function(T)? menuItemBuilder;

  /// Builder to build selected menu item widget
  /// If not set, it will default to [_MenuItem]
  final Widget Function(T)? selectedMenuItemBuilder;

  /// Variant on whether the Dropdown menu item contains only text or text with a checkbox
  /// values: [MultipleItemsVariant.plain] and [MultipleItemsVariant.checkboxes]
  final MultipleItemsVariant? multipleItemsVariant;

  /// Default value: [SelectedItemsStyle.text]
  /// Only used when parameter `enableMultiItems` of [ZeroDropdown] is true.
  final SelectedItemsStyle selectedItemsStyle;

  ZeroDropdown._(
      {Key? key,
      required this.inputDecorationType,
      required this.onChanged,
      required this.items,
      this.menuItemBuilder,
      this.selectedMenuItemBuilder,
      this.textfieldSizeType = TextfieldSizeType.small,
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
      this.itemHeight,
      this.enabled,
      this.focusNode,
      required this.enableMultipleItems,
      this.multipleItemsVariant = MultipleItemsVariant.plain,
      this.value,
      this.selectedItemsStyle = SelectedItemsStyle.text}) {
    if (menuItemBuilder != null || selectedMenuItemBuilder != null) {
      assert(selectedMenuItemBuilder != null && menuItemBuilder != null,
          "itemBuilder and selectedMenuItemBuilder must be provided together");
    }
  }

  factory ZeroDropdown({
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
    double? itemHeight,
    T? value,
    Widget Function(T)? menuItemBuilder,
    Widget Function(T)? selectedMenuItemBuilder,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    TextfieldSizeType? textfieldSizeType,
  }) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: inputDecorationType,
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
        itemHeight: itemHeight,
        textfieldSizeType: textfieldSizeType ?? TextfieldSizeType.large,
        enableMultipleItems: false,
        menuItemBuilder: menuItemBuilder,
        selectedMenuItemBuilder: selectedMenuItemBuilder,
      );

  factory ZeroDropdown.multiple(
          {Key? key,
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
          double? itemHeight,
          T? value,
          Widget Function(T)? menuItemBuilder,
          Widget Function(T)? selectedMenuItemBuilder,
          bool? enableMultipleItems,
          InputDecorationType inputDecorationType = InputDecorationType.outline,
          MultipleItemsVariant? multipleItemsVariant,
          TextfieldSizeType textfieldSizeType = TextfieldSizeType.small,
          SelectedItemsStyle selectedItemsStyle = SelectedItemsStyle.text}) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: inputDecorationType,
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
        itemHeight: itemHeight ?? textfieldSizeType.height,
        selectedItems: selectedItems,
        textfieldSizeType: textfieldSizeType,
        enableMultipleItems: true,
        menuItemBuilder: menuItemBuilder,
        selectedMenuItemBuilder: selectedMenuItemBuilder,
        multipleItemsVariant:
            multipleItemsVariant ?? MultipleItemsVariant.plain,
        selectedItemsStyle: selectedItemsStyle,
      );

  @override
  State<ZeroDropdown<T>> createState() => _ZeroDropdownState<T>();
}

class _ZeroDropdownState<T> extends State<ZeroDropdown<T>> {
  InputDecoration? decoration;
  final List<T> _selectedItems = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    decoration = _getDecoration(widget.inputDecorationType);

    if (widget.value != null) {
      _selectedItems.add(widget.value as T);
    }

    return DropdownButtonFormField2(
      decoration: decoration,
      isExpanded: false,
      buttonPadding: EdgeInsets.zero,
      icon: widget.suffixIcon != null
          ? const SizedBox.shrink()
          : null, // If suffixIcon provided, then hide the default icon
      dropdownPadding: EdgeInsets.zero,
      buttonHighlightColor: ZeroColors.primary[1],
      itemHighlightColor: ZeroColors.primary[1],
      selectedItemHighlightColor: ZeroColors.primary[7],
      buttonHeight: widget.itemHeight ?? widget.textfieldSizeType.height,
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = _selectedItems.contains(item);
              return SizedBox(
                width: double.infinity,
                height: widget.itemHeight,
                child: InkWell(
                    onTap: () =>
                        _updateSelectedItems(menuSetState, item, isSelected),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _MenuItem(
                          item: item,
                          isSelected: isSelected,
                          multipleItemsVariant: widget.multipleItemsVariant,
                          menuItemWidget: widget.menuItemBuilder?.call(item),
                          selectedMenuItemWidget:
                              widget.selectedMenuItemBuilder?.call(item),
                          onClick: () => _updateSelectedItems(
                              menuSetState, item, isSelected)),
                    )),
              );
            },
          ),
        );
      }).toList(),
      value: _selectedItems.isEmpty ? null : _selectedItems.last,
      onChanged: widget.onChanged,
      itemPadding: EdgeInsets.zero,
      selectedItemBuilder: (context) {
        return widget.items
            .map(
              (item) => _buildSelectedItem(item),
            )
            .toList();
      },
    );
  }

  InputDecoration? _getDecoration(InputDecorationType inputDecorationType) {
    InputDecoration? decoration;

    switch (inputDecorationType) {
      case InputDecorationType.outline:
        decoration = ZeroTextField.outline(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;
        return decoration?.copyWith(
            filled: widget.selectedItemsStyle.isDropdownFilled,
            fillColor: ZeroColors.primary[1]);

      case InputDecorationType.round:
        decoration = ZeroTextField.rounded(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;

        return decoration?.copyWith(
            filled: widget.selectedItemsStyle.isDropdownFilled,
            fillColor: ZeroColors.primary[1]);

      case InputDecorationType.fill:
        decoration = ZeroTextField.fill(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;

        return decoration;

      case InputDecorationType.underline:
        decoration = ZeroTextField.underline(
          labelText: widget.labelText,
          hintText: widget.hintText,
          helperText: widget.helperText,
          errorText: widget.errorText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ).decoration;

        return decoration?.copyWith(
            filled: widget.selectedItemsStyle.isDropdownFilled,
            fillColor: ZeroColors.primary[1]);
    }
  }

  void _updateSelectedItems(
      void Function(void Function()) menuSetState, T item, bool isSelected) {
    {
      if (!widget.enableMultipleItems) {
        _selectedItems.clear();
        _selectedItems.add(item);
        Navigator.pop(context);
      } else {
        isSelected ? _selectedItems.remove(item) : _selectedItems.add(item);
        _selectedItems.sort();
      }

      setState(() {});
      menuSetState(() {});
    }
  }

  /// Used in selectedItemBuilder parameter for [ZeroDropdown],
  /// to build selectedItem according to the [SelectedItemsStyle] value
  Widget _buildSelectedItem(T item) {
    switch (widget.selectedItemsStyle) {
      case SelectedItemsStyle.text:
        return Text(
          _selectedItems.join(', '),
          style: widget.labelStyle,
          overflow: TextOverflow.ellipsis,
          maxLines:
              1, // TODO: Revisit later check whether this limit is necessary
        );

      case SelectedItemsStyle.chip:
        return Row(
            children: _selectedItems
                .map((value) => Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: ZeroColors.primary[1], // TODO: make themeable
                          borderRadius: BorderRadius.circular(
                              widget.textfieldSizeType.roundedRadius)),
                      child: Text(
                        value.toString(),
                      ),
                    ))
                .toList());

      case SelectedItemsStyle.chipInverted:
        return Row(
            children: _selectedItems
                .map((value) => Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: ZeroColors.white, // TODO: make themeable
                          borderRadius: BorderRadius.circular(
                              widget.textfieldSizeType.roundedRadius)),
                      child: Text(
                        value.toString(),
                      ),
                    ))
                .toList());
    }
  }
}

class _MenuItem<T> extends StatelessWidget {
  final T item;
  final bool isSelected;
  final Function() onClick;
  final Widget? selectedMenuItemWidget;
  final Widget? menuItemWidget;
  final MultipleItemsVariant? multipleItemsVariant;

  _MenuItem(
      {required this.item,
      this.isSelected = false,
      required this.onClick,
      this.selectedMenuItemWidget,
      this.menuItemWidget,
      this.multipleItemsVariant = MultipleItemsVariant.plain}) {
    if (menuItemWidget != null || selectedMenuItemWidget != null) {
      assert(selectedMenuItemWidget != null && menuItemWidget != null,
          "if itemBuilder is set, then selectedMenuItemBuilder must be set too and vice versa");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (menuItemWidget != null) {
      return isSelected ? selectedMenuItemWidget! : menuItemWidget!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: isSelected
          ? ZeroColors.primary[1]
          : Colors.white, // TODO: Make more theme-able
      height: double.infinity,
      child: Row(
        children: [
          if (multipleItemsVariant == MultipleItemsVariant.checkboxes) ...[
            ZeroCheckbox(value: isSelected, onChanged: (value) => onClick),
            const SizedBox(width: 16)
          ],
          Text(
            item.toString(),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
