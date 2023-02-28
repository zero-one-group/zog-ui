import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

import 'custom/button_group_item.dart';
import 'custom/underline_button_group.dart';

typedef ZeroButtonGroupCallback = Function(List<bool>);

enum ButtonItemType { labelsOnly, labelsAndIcons, iconsOnly }

class ZeroButtonGroup extends StatelessWidget {
  /// List of String representing the labels of each button
  /// Example: `[Icons.wheather, Icons.home, Icons.wallet]`
  final List<String>? labels;

  /// List of IconData representing the icon of each button
  /// Example: `[Icons.wheather, Icons.home, Icons.wallet]`
  final List<IconData>? icons;

  /// List of booleans representing the state of each button
  /// Example: `[false, true, false]`
  /// The number of elements must be the same as the number of either labels elements or icons elements
  final List<bool> selecteds;

  /// Whether or not the selected buton shows a leading icon indicating selection
  final bool withIcon;

  /// Required only when [withIcon] is true.
  final IconData? selectIcon;

  final bool? vertical;

  /// Large, Medium, Small
  final ZeroSizeType buttonSizeType;

  /// Rectangle, Curved, Rounded
  final ZeroButtonRadiusType buttonRadiusType;

  /// Default (Solid), Outline, Text, Underline
  final ButtonGroupType buttonGroupType;

  /// Labels only, Icons only, Labels with Icons
  final ButtonItemType buttonItemType;

  /// Defaults to false which means it shapes rectangle, not sqare
  final bool? square;

  // Defaults to `false`, if set true, it supports multiple items select
  final bool? multipleSelect;

  /// Allows custom styles for this widget,
  /// by overriding global styles of [ZeroThemeData.buttonGroupStyle]
  final ZeroButtonGroupStyle? style;

  /// The callback that is called when a button is tapped.
  final ZeroButtonGroupCallback? onChanged;

  const ZeroButtonGroup({
    super.key,
    required this.selecteds,
    this.labels,
    this.icons,
    this.selectIcon,
    this.withIcon = false,
    this.buttonSizeType = ZeroSizeType.medium,
    this.buttonRadiusType = ZeroButtonRadiusType.curved,
    this.buttonItemType = ButtonItemType.labelsOnly,
    this.square,
    this.vertical,
    this.multipleSelect,
    this.buttonGroupType = ButtonGroupType.filled,
    this.style,
    this.onChanged,
  }) : assert(
          labels != null || icons != null,
          'The ButtonGroup can be either lables, icons, or both. At least labels or icons must be set',
        );

  /// ButtonGroup having only items with labels
  const ZeroButtonGroup.labelsOnly({
    super.key,
    required this.labels,
    required this.selecteds,
    this.selectIcon,
    this.withIcon = false,
    this.buttonGroupType = ButtonGroupType.filled,
    this.buttonSizeType = ZeroSizeType.medium,
    this.vertical = false,
    this.multipleSelect = false,
    this.buttonRadiusType = ZeroButtonRadiusType.curved,
    this.style,
    this.onChanged,
  })  : buttonItemType = ButtonItemType.labelsOnly,
        icons = null,
        square = null,
        assert(labels != null && labels.length >= 2,
            'Labels should contain at least 2 elements'),
        assert(labels != null && labels.length == selecteds.length,
            'selectedItems must contain the same number of elements as label\'s'),
        assert(withIcon == true ? selectIcon != null : true,
            'Having withIcon true requires you to provide selectIcon');

  /// ButtonGroup having items with both labels and icons alike
  const ZeroButtonGroup.labelsWithIcons({
    super.key,
    required this.labels,
    required this.icons,
    required this.selecteds,
    this.buttonGroupType = ButtonGroupType.filled,
    this.buttonSizeType = ZeroSizeType.medium,
    this.vertical = false,
    this.multipleSelect = false,
    this.buttonRadiusType = ZeroButtonRadiusType.curved,
    this.style,
    this.onChanged,
  })  : buttonItemType = ButtonItemType.labelsAndIcons,
        square = null,
        selectIcon = null,
        withIcon = true,
        assert(icons != null && icons.length >= 2,
            'Labels or icons must contain at least 2 elements'),
        assert(
          icons != null &&
              labels != null &&
              icons.length == labels.length &&
              icons.length == selecteds.length,
          'selectedItems must contain the same number of elements as icons\'s and label\'s',
        );

  /// ButtonGroup having items with icons only
  const ZeroButtonGroup.iconsOnly({
    super.key,
    required this.icons,
    required this.selecteds,
    this.square = true,
    this.buttonGroupType = ButtonGroupType.filled,
    this.buttonSizeType = ZeroSizeType.medium,
    this.vertical = false,
    this.multipleSelect = false,
    this.buttonRadiusType = ZeroButtonRadiusType.curved,
    this.style,
    this.onChanged,
  })  : buttonItemType = ButtonItemType.iconsOnly,
        labels = null,
        selectIcon = null,
        withIcon = true,
        assert(icons != null && icons.length >= 2,
            'Icons must contain at least 2 elements'),
        assert(icons != null && icons.length == selecteds.length,
            'selectedItems must contain the same number of elements as icon\'s');

  @override
  Widget build(BuildContext context) {
    final adaptiveStyle = _getAdaptiveStyle(context);

    List<Widget> children = [];

    switch (buttonItemType) {
      case ButtonItemType.labelsOnly:
        for (int i = 0; i < labels!.length; i++) {
          bool isSelected = selecteds[i];
          children.add(
            ButtonGroupItem(
              label: labels![i],
              selectIcon: selectIcon,
              isSelected: isSelected,
              labelStyle: _getLabelStyle(
                style,
                isActive: isSelected,
                context: context,
              ),
              activeColor: _getForegroundColor(
                adaptiveStyle,
                isActive: isSelected,
                context: context,
              ),
              inactiveColor: _getForegroundColor(
                adaptiveStyle,
                isActive: isSelected,
                context: context,
              ),
              withIcon: withIcon,
            ),
          );
        }
        break;
      case ButtonItemType.iconsOnly:
        for (int i = 0; i < icons!.length; i++) {
          bool isSelected = selecteds[i];

          children.add(
            Icon(
              icons![i],
              color: _getForegroundColor(
                adaptiveStyle,
                isActive: isSelected,
                context: context,
              ),
              size: buttonSizeType.fontSize,
            ),
          );
        }

        break;
      case ButtonItemType.labelsAndIcons:
        for (int i = 0; i < icons!.length; i++) {
          bool isSelected = selecteds[i];
          children.add(ButtonGroupItem(
            label: labels![i],
            icon: icons![i],
            selectIcon: selectIcon,
            isSelected: isSelected,
            labelStyle: _getLabelStyle(
              adaptiveStyle,
              isActive: isSelected,
              context: context,
            ),
            activeColor: _getForegroundColor(
              adaptiveStyle,
              isActive: isSelected,
              context: context,
            ),
            inactiveColor: _getForegroundColor(
              adaptiveStyle,
              isActive: isSelected,
              context: context,
            ),
            withIcon: false,
          ));
        }
    }

    final horizontalPadding =
        adaptiveStyle?.padding?.horizontal ?? buttonSizeType.padding.horizontal;
    final verticalPadding =
        adaptiveStyle?.padding?.vertical ?? buttonSizeType.padding.vertical;

    if (buttonGroupType != ButtonGroupType.underline) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: _getBackgroundColor(
            adaptiveStyle,
            isActive: false,
            context: context,
          ),
          borderRadius: _getBorderRadius(buttonRadiusType),
        ),
        child: ToggleButtons(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          direction: vertical == true ? Axis.vertical : Axis.horizontal,
          onPressed: _onChanged,
          borderRadius: _getBorderRadius(buttonRadiusType),
          selectedBorderColor: adaptiveStyle?.activeBorderColor,
          renderBorder: buttonGroupType.renderBorder,
          borderColor: adaptiveStyle?.inactiveBorderColor,
          selectedColor: _getBackgroundColor(
            adaptiveStyle,
            isActive: true,
            context: context,
          ),
          fillColor: _getBackgroundColor(
            adaptiveStyle,
            isActive: true,
            context: context,
          ),
          borderWidth: 1,
          constraints: BoxConstraints(
            minHeight: buttonSizeType.fontSize + verticalPadding,
            minWidth: buttonSizeType.fontSize +
                (square == true ? verticalPadding : horizontalPadding),
          ),
          isSelected: selecteds,
          textStyle: TextStyle(fontSize: buttonSizeType.fontSize),
          children: children,
        ),
      );
    }

    // [ToggleButton] doesn't seem to support underline style, so we have to create
    // the element from scratch.
    return UnderlineButtonGroup(
      verticalPadding: verticalPadding / 2,
      bottomBorderWidth: 1,
      fillColor: Colors.transparent,
      selectedColor: adaptiveStyle?.activeColor ?? Colors.transparent,
      selectedFillColor: Colors.transparent,
      borderRadius: _getBorderRadius(buttonRadiusType),
      selecteds: selecteds,
      onItemSelected: _onChanged,
      isVertical: vertical == true,
      square: square ?? false,
      children: children,
    );
  }

  void _onChanged(int index) {
    if (onChanged == null) return;
    final currentSelected = List<bool>.from(selecteds);

    if (multipleSelect ?? false) {
      currentSelected[index] = !currentSelected[index];
    } else {
      for (int i = 0; i < currentSelected.length; i++) {
        currentSelected[i] = i == index;
      }
    }

    onChanged?.call(currentSelected);
  }

  ZeroButtonGroupStyle? _getAdaptiveStyle(BuildContext context) {
    final styleSetTheme = context.theme.buttonGroupStyle;
    late ZeroButtonGroupStyle? themeStyle;

    switch (buttonGroupType) {
      case ButtonGroupType.outlined:
        themeStyle = styleSetTheme.outlined;
        break;
      case ButtonGroupType.filled:
        themeStyle = styleSetTheme.filled;
        break;
      case ButtonGroupType.text:
        themeStyle = styleSetTheme.text;
        break;
      case ButtonGroupType.underline:
        themeStyle = styleSetTheme.underline;
        break;
    }

    return themeStyle?.merge(style) ?? style;
  }

  Color? _getBackgroundColor(ZeroButtonGroupStyle? style,
      {required bool isActive, required BuildContext context}) {
    if (style == null) return null;

    if (buttonGroupType == ButtonGroupType.filled ||
        buttonGroupType == ButtonGroupType.text) {
      return isActive ? style.activeColor : style.inactiveColor;
    }
    return null;
  }

  Color? _getForegroundColor(ZeroButtonGroupStyle? style,
      {required bool isActive, required BuildContext context}) {
    if (style == null) return null;

    final foregroundStyle =
        _getLabelStyle(style, isActive: isActive, context: context);

    return foregroundStyle.color;
  }

  TextStyle _getLabelStyle(ZeroButtonGroupStyle? style,
      {required bool isActive, required BuildContext context}) {
    final defaultTextStyle = DefaultTextStyle.of(context).style.copyWith(
          color:
              buttonGroupType == ButtonGroupType.filled ? Colors.white : null,
        );

    final combineStyle =
        (isActive ? style?.activeTextStyle : style?.inactiveTextStyle) ??
            defaultTextStyle;

    return combineStyle.copyWith(fontSize: buttonSizeType.fontSize);
  }

  /// Set BorderRadius based on its type and its
  BorderRadius _getBorderRadius(ZeroButtonRadiusType buttonRadiusType) {
    switch (buttonRadiusType) {
      case ZeroButtonRadiusType.rectangle:
        return buttonRadiusType.borderRadius;
      case ZeroButtonRadiusType.curved:
        return buttonRadiusType.borderRadius;
      case ZeroButtonRadiusType.rounded:
        return buttonRadiusType.borderRadius;
      default:
        return buttonSizeType.borderRadius;
    }
  }
}
