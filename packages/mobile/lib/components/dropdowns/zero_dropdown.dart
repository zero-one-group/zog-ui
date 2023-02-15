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

enum DropdownVariant {
  /// Dropdown must be decorated as [TextformField]. When selected, the [InputDecorationType] must be provided
  form,

  /// Dropdown has only icon to be tapped on. No need for [InputDecorationType]
  icon
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

  /// If set, this will override `suffixIcon` that is defined in [InputDecoration]
  final Widget? icon;

  /// [ZeroDropdownMenuItem]'s height, the default value is as per set on [ZeroTextfieldSize.small] height
  final double? itemHeight;

  /// [ZeroDropdownMenuItem]'s width, the default value is equal to the screen's width
  final double? dropdownWidth;

  /// Types that are also used on [ZeroTextField] to provide default styling parameters
  /// based on the selected type: [ZeroTextField.outline], [ZeroTextField.rounded], [ZeroTextField.filled],
  /// or [ZeroTextField.underline]
  ///
  /// Default value: [ZeroTextField.outline]
  final InputDecorationType? inputDecorationType;

  /// Indicates whether it is a form [ZeroDropdownButton] or an icon one.
  final DropdownVariant? variant;

  /// Default value: [ZeroTextfieldSize.small]
  final ZeroTextfieldSize textfieldSize;

  /// List containing only all the values, not the [ZeroDropdownMenuItem]
  final List<T> items;

  /// List containing only the selected values, not the [ZeroDropdownMenuItem]
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

  final Function(bool isOpen)? onMenuStateChange;

  /// If `false`, the width of the dropdown will be larger than the dropdown button
  final bool? alignedDropdown;

  ZeroDropdown._(
      {Key? key,
      required this.onChanged,
      required this.items,
      this.inputDecorationType,
      this.menuItemBuilder,
      this.selectedMenuItemBuilder,
      this.textfieldSize = ZeroTextfieldSize.small,
      this.selectedItems = const [],
      this.labelText,
      this.helperText,
      this.hintText,
      this.errorText,
      this.labelStyle,
      this.errorStyle,
      this.helperStyle,
      this.icon,
      this.itemHeight,
      this.dropdownWidth,
      this.enabled,
      this.focusNode,
      required this.enableMultipleItems,
      this.multipleItemsVariant = MultipleItemsVariant.plain,
      this.value,
      this.selectedItemsStyle = SelectedItemsStyle.text,
      this.variant = DropdownVariant.form,
      this.alignedDropdown = true,
      this.onMenuStateChange}) {
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
    double? dropdownWidth,
    bool? alignedDropdown,
    T? value,
    Widget Function(T)? menuItemBuilder,
    Widget Function(T)? selectedMenuItemBuilder,
    InputDecorationType inputDecorationType = InputDecorationType.outline,
    ZeroTextfieldSize? textfieldSize,
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
        icon: suffixIcon,
        itemHeight: itemHeight,
        dropdownWidth: dropdownWidth,
        alignedDropdown: alignedDropdown,
        textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
        enableMultipleItems: false,
        menuItemBuilder: menuItemBuilder,
        selectedMenuItemBuilder: selectedMenuItemBuilder,
        variant: DropdownVariant.form,
      );

  /// Constructor to create dropdown with only icon as the button. No Input Decoration needed
  factory ZeroDropdown.icon({
    Key? key,
    required Function(dynamic) onChanged,
    required List<T> items,
    Widget? icon,

    /// The dimension (widht and height) of the Icon. If null, it defaults to [TextfieldSize.small.height]
    double? size,
    double? dropdownWidth,
    T? value,
    Widget Function(T)? menuItemBuilder,
    Widget Function(T)? selectedMenuItemBuilder,
  }) =>
      ZeroDropdown._(
        key: key,
        inputDecorationType: InputDecorationType.underline,
        onChanged: onChanged,
        items: items,
        enableMultipleItems: false,
        menuItemBuilder: menuItemBuilder,
        icon: icon,
        dropdownWidth: dropdownWidth,
        selectedMenuItemBuilder: selectedMenuItemBuilder,
        itemHeight: size ?? ZeroTextfieldSize.small.height,
        variant: DropdownVariant.icon,
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
          double? dropdownWidth,
          bool? alignedDropdown,
          T? value,
          Widget Function(T)? menuItemBuilder,
          Widget Function(T)? selectedMenuItemBuilder,
          InputDecorationType inputDecorationType = InputDecorationType.outline,
          MultipleItemsVariant? multipleItemsVariant,
          ZeroTextfieldSize textfieldSize = ZeroTextfieldSize.small,
          SelectedItemsStyle selectedItemsStyle = SelectedItemsStyle.text,
          Function(bool isOpen)? onMenuStateChange}) =>
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
        icon: suffixIcon,
        itemHeight: itemHeight ?? textfieldSize.height,
        dropdownWidth: dropdownWidth,
        alignedDropdown: alignedDropdown,
        selectedItems: selectedItems,
        textfieldSize: textfieldSize,
        enableMultipleItems: true,
        menuItemBuilder: menuItemBuilder,
        selectedMenuItemBuilder: selectedMenuItemBuilder,
        multipleItemsVariant:
            multipleItemsVariant ?? MultipleItemsVariant.plain,
        selectedItemsStyle: selectedItemsStyle,
        onMenuStateChange: onMenuStateChange,
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
    if (widget.value != null) {
      _selectedItems.add(widget.value as T);
    }

    return Theme(
        data: context.theme
            .copyWith(
                inputDecorationType: widget.inputDecorationType,
                textfieldSize: widget.textfieldSize)
            .toThemeData(),
        child: widget.variant == DropdownVariant.form
            ? _buildDropdownForm()
            : _buildDropdownIconOnly());
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            _selectedItems.join(', '),
            style: widget.labelStyle,
            overflow: TextOverflow.ellipsis,
            maxLines:
                1, // TODO: Revisit later check whether this limit is necessary
          ),
        );

      case SelectedItemsStyle.chip:
        return Row(
            children: _selectedItems
                .map((value) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: context.theme.primaryColor.lightest,
                          borderRadius: BorderRadius.circular(
                              widget.textfieldSize.roundedRadius)),
                      child: Text(
                        value.toString(),
                      ),
                    ))
                .toList());

      case SelectedItemsStyle.chipInverted:
        return Row(
            children: _selectedItems
                .map((value) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          color: ZeroColors.white,
                          borderRadius: BorderRadius.circular(
                              widget.textfieldSize.roundedRadius)),
                      child: Text(
                        value.toString(),
                      ),
                    ))
                .toList());
    }
  }

  /// Dropdown with form decoration
  Widget _buildDropdownForm() {
    return Theme(
      data: context.theme.toThemeData().copyWith(
              buttonTheme: ButtonTheme.of(context).copyWith(
            alignedDropdown: widget.alignedDropdown,
          )),
      child: ZeroDropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
            helperText: widget.helperText,
            hintText: widget.hintText,
            labelText: widget.labelText,
            contentPadding: widget.textfieldSize.contentPadding,
            alignLabelWithHint: false,
            fillColor: context.theme.primaryColor.lightest,
            filled:
                widget.selectedItemsStyle == SelectedItemsStyle.chipInverted),
        icon: widget.icon,
        items: widget.items.map((item) {
          return ZeroDropdownMenuItem<T>(
            value: item,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected = _selectedItems.contains(item);
                return Container(
                  height: widget.itemHeight ?? widget.textfieldSize.height,
                  color: Colors.transparent,
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
        selectedItemBuilder: (context) {
          return widget.items
              .map(
                (item) => _buildSelectedItem(item),
              )
              .toList();
        },
      ),
    );
  }

  /// Dropdown with icon widget as the button
  Widget _buildDropdownIconOnly() {
    return DropdownButton2(
      isExpanded: false,
      buttonPadding: EdgeInsets.zero,
      customButton: SizedBox(
          width: widget.itemHeight ?? widget.textfieldSize.height,
          height: widget.itemHeight ?? widget.textfieldSize.height,
          child: widget.icon),
      dropdownPadding: EdgeInsets.zero,
      buttonHighlightColor: context.theme.primaryColor.lightest,
      itemHighlightColor: context.theme.primaryColor.lightest,
      selectedItemHighlightColor: context.theme.primaryColor,
      buttonHeight: widget.itemHeight ?? widget.textfieldSize.height,
      dropdownWidth: widget.dropdownWidth ?? double.infinity,
      items: widget.items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final isSelected = _selectedItems.contains(item);
              return SizedBox(
                width: double.infinity,
                height: widget.itemHeight ?? widget.textfieldSize.height,
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
    );
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
          ? context.theme.primaryColor.lightest
          : context.theme.scaffoldBackgroundColor,
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
