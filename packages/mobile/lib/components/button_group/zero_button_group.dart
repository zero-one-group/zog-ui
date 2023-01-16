import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/button_group/custom/custom_button_group.dart';
import 'package:zero_ui_mobile/types/button_group_type.dart';
import 'package:zero_ui_mobile/types/button_radius_type.dart';
import 'package:zero_ui_mobile/types/button_size_type.dart';

enum ButtonItemType { labelsOnly, labelsAndIcons, iconsOnly }

class ZeroButtonGroup extends StatefulWidget {
  final List<String>? labels;
  final List<IconData>? icons;
  final List<bool> selectedItems;
  final bool vertical;

  final ButtonSizeType buttonSizeType;
  final ButtonRadiusType buttonRadiusType;
  final ButtonGroupType buttonGroupType;
  final ButtonItemType buttonItemType;

  const ZeroButtonGroup(
      {super.key,
      required this.selectedItems,
      this.labels,
      this.icons,
      this.vertical = false,
      this.buttonSizeType = ButtonSizeType.medium,
      this.buttonRadiusType = ButtonRadiusType.curved,
      this.buttonItemType = ButtonItemType.labelsOnly,
      this.buttonGroupType = ButtonGroupType.solid})
      : assert(
          labels != null || icons != null,
          'The ButtonGroup can be either lables, icons, or both. At least labels or icons must be set',
        );

  factory ZeroButtonGroup.labelsOnly(
      {Key? key,
      required List<String> labels,
      required List<bool> selectedItems,
      ButtonGroupType buttonGroupType = ButtonGroupType.solid,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      ButtonRadiusType buttonRadiusType = ButtonRadiusType.curved,
      bool vertical = false}) {
    assert(labels.length >= 2, 'Labels should contain at least 2 elements');
    assert(labels.length == selectedItems.length,
        'selectedItems must contain the same number of elements as label\'s');

    return ZeroButtonGroup(
      labels: labels,
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: buttonGroupType,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      buttonItemType: ButtonItemType.labelsOnly,
    );
  }

  factory ZeroButtonGroup.labelsAndIcons(
      {Key? key,
      required List<String> labels,
      required List<IconData> icons,
      required List<bool> selectedItems,
      ButtonGroupType buttonGroupType = ButtonGroupType.solid,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      buttonRadiusType = ButtonRadiusType.curved,
      bool vertical = false}) {
    assert(
        icons.length >= 2, 'Labels or icons must contain at least 2 elements');
    assert(
        icons.length == labels.length && icons.length == selectedItems.length,
        'selectedItems must contain the same number of elements as icons\'s and label\'s');

    return ZeroButtonGroup(
      labels: labels,
      icons: icons,
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: buttonGroupType,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      buttonItemType: ButtonItemType.labelsAndIcons,
    );
  }

  factory ZeroButtonGroup.iconsOnly(
      {Key? key,
      required List<IconData> icons,
      required List<bool> selectedItems,
      ButtonGroupType buttonGroupType = ButtonGroupType.solid,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      buttonRadiusType = ButtonRadiusType.curved,
      bool vertical = false}) {
    assert(icons.length >= 2, 'Icons must contain at least 2 elements');
    assert(icons.length == selectedItems.length,
        'selectedItems must contain the same number of elements as icon\'s');
    return ZeroButtonGroup(
      icons: icons,
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: buttonGroupType,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      buttonItemType: ButtonItemType.iconsOnly,
    );
  }

  @override
  State<ZeroButtonGroup> createState() => _ZeroButtonGroupState();
}

class _ZeroButtonGroupState extends State<ZeroButtonGroup> {
  final List<Widget> _children = [];

  @override
  void initState() {
    if (widget.buttonItemType == ButtonItemType.labelsOnly) {
      for (String label in widget.labels!) {
        _children.add(Text(
          label,
          textAlign: TextAlign.center,
        ));
      }
    }

    if (widget.buttonItemType == ButtonItemType.iconsOnly) {
      for (IconData icon in widget.icons!) {
        _children.add(Icon(icon));
      }
    }

    if (widget.buttonItemType == ButtonItemType.labelsAndIcons) {
      for (IconData icon in widget.icons!) {
        _children.add(Icon(icon));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buttonGroupType != ButtonGroupType.underline) {
      return Container(
        padding: EdgeInsets.zero,
        height: widget.buttonSizeType.height,
        decoration: BoxDecoration(
            color: widget.buttonGroupType.fillColor,
            borderRadius: _getBorderRadius(widget.buttonRadiusType)),
        child: ToggleButtons(
          direction: widget.vertical ? Axis.vertical : Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < widget.selectedItems.length; i++) {
                widget.selectedItems[i] = i == index;
              }
            });
          },
          borderRadius: _getBorderRadius(widget.buttonRadiusType),
          selectedBorderColor: widget.buttonGroupType.borderBorderColor,
          selectedColor: widget.buttonGroupType.selectedColor,
          fillColor: widget.buttonGroupType.selectedFillColor,
          color: widget.buttonGroupType.color,
          borderWidth: widget.buttonGroupType.borderWidth,
          constraints: BoxConstraints(
            minHeight: widget.buttonSizeType.height,
            minWidth: widget.buttonSizeType.width,
          ),
          renderBorder: widget.buttonGroupType.renderBorder,
          isSelected: widget.selectedItems,
          textStyle: TextStyle(fontSize: widget.buttonSizeType.fontSize),
          children: _children,
        ),
      );
    }

    return CustomButtonGroup(
      height: widget.buttonSizeType.height,
      width: widget.buttonSizeType.width,
      fillColor: widget.buttonGroupType.selectedFillColor,
      borderRadius: _getBorderRadius(widget.buttonRadiusType),
      children: _children,
    );
  }

  BorderRadius _getBorderRadius(ButtonRadiusType buttonRadiusType) {
    switch (buttonRadiusType) {
      case ButtonRadiusType.rectangle:
        return widget.buttonRadiusType.borderRadius;
      case ButtonRadiusType.curved:
        return widget.buttonRadiusType.borderRadius;
      case ButtonRadiusType.rounded:
        return widget.buttonRadiusType.borderRadius;
      default:
        return widget.buttonSizeType.borderRadius;
    }
  }
}
