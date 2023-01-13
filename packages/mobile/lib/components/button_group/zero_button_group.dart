import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/types/button_group_type.dart';
import 'package:zero_ui_mobile/types/button_radius_type.dart';
import 'package:zero_ui_mobile/types/button_size_type.dart';

class ZeroButtonGroup extends StatefulWidget {
  final List<Widget> children;
  final List<bool> selectedItems;
  final bool vertical;

  final ButtonSizeType buttonSizeType;
  final ButtonRadiusType buttonRadiusType;
  final ButtonGroupType buttonGroupType;

  const ZeroButtonGroup(
      {super.key,
      required this.children,
      required this.selectedItems,
      this.vertical = false,
      this.buttonSizeType = ButtonSizeType.medium,
      this.buttonRadiusType = ButtonRadiusType.curved,
      this.buttonGroupType = ButtonGroupType.solid});

  factory ZeroButtonGroup.solid(
      {Key? key,
      required List<Widget> children,
      required List<bool> selectedItems,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      ButtonRadiusType buttonRadiusType = ButtonRadiusType.curved,
      bool vertical = false}) {
    return ZeroButtonGroup(
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: ButtonGroupType.solid,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      children: children,
    );
  }

  factory ZeroButtonGroup.outline(
      {Key? key,
      required List<Widget> children,
      required List<bool> selectedItems,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      buttonRadiusType = ButtonRadiusType.curved,
      bool vertical = false}) {
    return ZeroButtonGroup(
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: ButtonGroupType.outline,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      children: children,
    );
  }

  factory ZeroButtonGroup.text(
      {Key? key,
      required List<Widget> children,
      required List<bool> selectedItems,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      buttonRadiusType = ButtonRadiusType.curved,
      bool vertical = false}) {
    return ZeroButtonGroup(
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: ButtonGroupType.text,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      children: children,
    );
  }

  factory ZeroButtonGroup.underline(
      {Key? key,
      required List<Widget> children,
      required List<bool> selectedItems,
      ButtonSizeType buttonSizeType = ButtonSizeType.medium,
      buttonRadiusType = ButtonRadiusType.rectangle,
      bool vertical = false}) {
    return ZeroButtonGroup(
      selectedItems: selectedItems,
      vertical: vertical,
      buttonGroupType: ButtonGroupType.underline,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      children: children,
    );
  }

  @override
  State<ZeroButtonGroup> createState() => _ZeroButtonGroupState();
}

class _ZeroButtonGroupState extends State<ZeroButtonGroup> {
  @override
  Widget build(BuildContext context) {
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
        children: widget.children,
      ),
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
