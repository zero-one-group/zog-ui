import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

// Examples can assume:
// late Widget child;
// late BuildContext context;
// late MenuStyle style;
// @immutable
// class MyAppHome extends StatelessWidget {
//   const MyAppHome({super.key});
//   @override
//   Widget build(BuildContext context) => const SizedBox();
// }

/// The visual properties that menus have in common.
///
/// Menus created by [MenuBar] and [MenuAnchor] and their themes have a
/// [ZeroMenuStyle] property which defines the visual properties whose default
/// values are to be overridden. The default values are defined by the
/// individual menu widgets and are typically based on overall theme's
/// [ThemeData.colorScheme] and [ThemeData.textTheme].
///
/// All of the [ZeroMenuStyle] properties are null by default.
///
/// Many of the [MenuStyle] properties are [MaterialStateProperty] objects which
/// resolve to different values depending on the menu's state. For example the
/// [Color] properties are defined with `MaterialStateProperty<Color>` and can
/// resolve to different colors depending on if the menu is pressed, hovered,
/// focused, disabled, etc.
///
/// These properties can override the default value for just one state or all of
/// them. For example to create a [SubmenuButton] whose background color is the
/// color scheme’s primary color with 50% opacity, but only when the menu is
/// pressed, one could write:
///
/// ```dart
/// SubmenuButton(
///   menuStyle: ZeroMenuStyle(
///     backgroundColor: MaterialStateProperty.resolveWith<Color?>(
///       (Set<MaterialState> states) {
///         if (states.contains(MaterialState.focused)) {
///           return Theme.of(context).colorScheme.primary.withOpacity(0.5);
///         }
///         return null; // Use the component's default.
///       },
///     ),
///   ),
///   menuChildren: const <Widget>[ /* ... */ ],
///   child: const Text('Fly me to the moon'),
/// ),
/// ```
///
/// In this case the background color for all other menu states would fall back
/// to the [SubmenuButton]'s default values. To unconditionally set the menu's
/// [backgroundColor] for all states one could write:
///
/// ```dart
/// const SubmenuButton(
///   menuStyle: ZeroMenuStyle(
///     backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
///   ),
///   menuChildren: <Widget>[ /* ... */ ],
///   child: Text('Let me play among the stars'),
/// ),
/// ```
///
/// To configure all of the application's menus in the same way, specify the
/// overall theme's `menuTheme`:
///
/// ```dart
/// ZeroApp(
///   theme: ZeroThemeData(
///     menuTheme: const MenuThemeData(
///       style: ZeroMenuStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)),
///     ),
///   ),
///   home: const MyAppHome(),
/// ),
/// ```
///
/// See also:
///
/// * [MenuAnchor], a widget which hosts cascading menus.
/// * [MenuBar], a widget which defines a menu bar of buttons hosting cascading
///   menus.
/// * [MenuButtonTheme], the theme for [SubmenuButton]s and [MenuItemButton]s.
/// * [ButtonStyle], a similar configuration object for button styles.
typedef ZeroMenuStyle = MenuStyle;

/// [ZeroDropdownMenu] is built on top of [DropdownButtonFormField2] and [ZeroTextField]
/// This uses decoration taken from [InputDecorationType].
class ZeroDropdownMenu<T> extends StatefulWidget {
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

  /// Indicates whether it is a form [ZeroDropdownButton] or an icon one.
  final DropdownVariant? variant;

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

  /// List containing only all the [DropdownMenuEntry]
  final List<DropdownMenuEntry<T>>? entries;

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
      this.variant = DropdownVariant.form,
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
  State<ZeroDropdownMenu<T>> createState() => _ZeroDropdownMenuState<T>();
}

class _ZeroDropdownMenuState<T> extends State<ZeroDropdownMenu<T>> {
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

    late InputDecorationTheme inputDecorationTheme;

    switch (widget.inputDecorationType) {
      case InputDecorationType.outline:
        inputDecorationTheme =
            context.theme.textfieldStyleSet.filled.toInputDecorationTheme();
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
      contentPadding: widget.textfieldSize.contentPadding.copyWith(
          top: 16, bottom: 16), // TODO: Revisit and investigate further
      alignLabelWithHint: true,
    );

    return DropdownMenu<T>(
      leadingIcon: widget.leadingIcon,
      label: widget.labelText != null
          ? Text(
              widget.labelText!,
              style: widget.labelStyle,
            )
          : null,
      hintText: widget.hintText,
      enabled: widget.enabled ?? true,
      width: widget.width,
      menuStyle: widget.menuStyle,
      textStyle: widget.labelStyle,
      trailingIcon: widget.trailingIcon,
      inputDecorationTheme: inputDecorationTheme,
      menuHeight: widget.menuHeight,
      enableFilter: widget.enableFilter,
      enableSearch: widget.enableSearch,
      onSelected: widget.onSelected,
      controller: widget.controller,
      initialSelection: widget.value,
      dropdownMenuEntries: widget.entries ??
          widget.items!.map((item) {
            return DropdownMenuEntry<T>(
              value: item,
              label: item.toString(),
              style: context.theme.textButtonStyle.toButtonStyle(),
            );
          }).toList(),
    );
  }
}
