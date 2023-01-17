import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/button_group/custom/button_group_item.dart';
import 'package:zero_ui_mobile/components/button_group/custom/underline_button_group.dart';
import 'package:zero_ui_mobile/types/button_group_type.dart';
import 'package:zero_ui_mobile/types/button_radius_type.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

enum ButtonItemType { labelsOnly, labelsAndIcons, iconsOnly }

class ZeroButtonGroup extends StatefulWidget {
  /// List of String representing the labels of each button
  /// Example: `[Icons.wheather, Icons.home, Icons.wallet]`
  final List<String>? labels;

  /// List of IconData representing the icon of each button
  /// Example: `[Icons.wheather, Icons.home, Icons.wallet]`
  final List<IconData>? icons;

  /// List of booleans representing the state of each button
  /// Example: `[false, true, false]`
  /// The number of elements must be the same as the number of either labels elements or icons elements
  final List<bool> isSelected;

  /// Whether or not the selected buton shows a leading icon indicating selection
  final bool withIcon;

  /// Required only when [withIcon] is true.
  final IconData? selectIcon;

  // final bool vertical; // TODO: Enable vertical mode

  /// Large, Medium, Small
  final ZeroSizeType buttonSizeType;

  /// Rectangle, Curved, Rounded
  final ZeroButtonRadiusType buttonRadiusType;

  /// Default (Solid), Outline, Text, Underline
  final ButtonGroupType buttonGroupType;

  /// Labels only, Icons only, Labels with Icons
  final ButtonItemType buttonItemType;

  // TODO: Provide `TextStyle` field instead of only fontSize and color

  const ZeroButtonGroup(
      {super.key,
      required this.isSelected,
      this.labels,
      this.icons,
      this.selectIcon,
      this.withIcon = false,
      this.buttonSizeType = ZeroSizeType.medium,
      this.buttonRadiusType = ZeroButtonRadiusType.curved,
      this.buttonItemType = ButtonItemType.labelsOnly,
      this.buttonGroupType = ButtonGroupType.solid})
      : assert(
          labels != null || icons != null,
          'The ButtonGroup can be either lables, icons, or both. At least labels or icons must be set',
        );

  /// ButtonGroup having only items with labels
  factory ZeroButtonGroup.labelsOnly({
    Key? key,
    required List<String> labels,
    required List<bool> isSelected,
    IconData? selectIcon,
    bool withIcon = false,
    ButtonGroupType buttonGroupType = ButtonGroupType.solid,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,
    ZeroButtonRadiusType buttonRadiusType = ZeroButtonRadiusType.curved,
  }) {
    assert(labels.length >= 2, 'Labels should contain at least 2 elements');
    assert(labels.length == isSelected.length, 'selectedItems must contain the same number of elements as label\'s');

    if (withIcon) {
      assert(selectIcon != null, 'Having withIcon true requires you to provide selectIcon');
    }

    return ZeroButtonGroup(
      labels: labels,
      isSelected: isSelected,
      withIcon: withIcon,
      selectIcon: selectIcon,
      buttonGroupType: buttonGroupType,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      buttonItemType: ButtonItemType.labelsOnly,
    );
  }

  /// ButtonGroup having items with both labels and icons alike
  factory ZeroButtonGroup.labelsWithIcons({
    Key? key,
    required List<String> labels,
    required List<IconData> icons,
    required List<bool> isSelected,
    ButtonGroupType buttonGroupType = ButtonGroupType.solid,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,
    buttonRadiusType = ZeroButtonRadiusType.curved,
  }) {
    assert(icons.length >= 2, 'Labels or icons must contain at least 2 elements');
    assert(icons.length == labels.length && icons.length == isSelected.length,
        'selectedItems must contain the same number of elements as icons\'s and label\'s');

    return ZeroButtonGroup(
      labels: labels,
      icons: icons,
      isSelected: isSelected,
      buttonGroupType: buttonGroupType,
      buttonSizeType: buttonSizeType,
      buttonRadiusType: buttonRadiusType,
      buttonItemType: ButtonItemType.labelsAndIcons,
    );
  }

  /// ButtonGroup having items with icons only
  factory ZeroButtonGroup.iconsOnly({
    Key? key,
    required List<IconData> icons,
    required List<bool> isSelected,
    ButtonGroupType buttonGroupType = ButtonGroupType.solid,
    ZeroSizeType buttonSizeType = ZeroSizeType.medium,
    buttonRadiusType = ZeroButtonRadiusType.curved,
  }) {
    assert(icons.length >= 2, 'Icons must contain at least 2 elements');
    assert(icons.length == isSelected.length, 'selectedItems must contain the same number of elements as icon\'s');

    return ZeroButtonGroup(
      icons: icons,
      isSelected: isSelected,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    switch (widget.buttonItemType) {
      case ButtonItemType.labelsOnly:
        for (int i = 0; i < widget.labels!.length; i++) {
          bool isSelected = widget.isSelected[i];
          children.add(ButtonGroupItem(
            label: widget.labels![i],
            selectIcon: widget.selectIcon,
            isSelected: isSelected,
            fontSize: widget.buttonSizeType.fontSize,
            selectedColor: widget.buttonGroupType.selectedColor,
            withIcon: widget.withIcon,
          ));
        }
        break;
      case ButtonItemType.iconsOnly:
        for (IconData icon in widget.icons!) {
          children.add(Icon(icon));
        }
        break;
      case ButtonItemType.labelsAndIcons:
        for (int i = 0; i < widget.icons!.length; i++) {
          bool isSelected = widget.isSelected[i];
          children.add(ButtonGroupItem(
            label: widget.labels![i],
            icon: widget.icons![i],
            selectIcon: widget.selectIcon,
            isSelected: isSelected,
            fontSize: widget.buttonSizeType.fontSize,
            textColor: widget.buttonGroupType.color,
            selectedColor: widget.buttonGroupType.selectedColor,
            withIcon: false,
          ));
        }
    }

    if (widget.buttonGroupType != ButtonGroupType.underline) {
      return Container(
        padding: EdgeInsets.zero,
        height: widget.buttonSizeType.height,
        decoration:
            BoxDecoration(color: widget.buttonGroupType.fillColor, borderRadius: _getBorderRadius(widget.buttonRadiusType)),
        child: ToggleButtons(
          direction: Axis.horizontal,
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < widget.isSelected.length; i++) {
                widget.isSelected[i] = i == index;
              }
            });
          },
          borderRadius: _getBorderRadius(widget.buttonRadiusType),
          selectedBorderColor: widget.buttonGroupType.selectedBorderColor,
          selectedColor: widget.buttonGroupType.selectedColor,
          fillColor: widget.buttonGroupType.selectedFillColor,
          color: widget.buttonGroupType.color,
          borderWidth: widget.buttonGroupType.borderWidth,
          constraints: BoxConstraints(
            minHeight: widget.buttonSizeType.height,
            minWidth: widget.buttonSizeType.width,
          ),
          renderBorder: widget.buttonGroupType.renderBorder,
          isSelected: widget.isSelected,
          textStyle: TextStyle(fontSize: widget.buttonSizeType.fontSize),
          children: children,
        ),
      );
    }

    // [ToggleButton] doesn't seem to support underline style, so we have to create
    // the element from scratch.
    return UnderlineButtonGroup(
      height: widget.buttonSizeType.height,
      width: widget.buttonSizeType.width,
      bottomBorderWidth: widget.buttonSizeType.bottomBorderWidth,
      fillColor: widget.buttonGroupType.fillColor,
      selectedColor: widget.buttonGroupType.selectedColor,
      selectedFillColor: widget.buttonGroupType.selectedFillColor,
      borderRadius: _getBorderRadius(widget.buttonRadiusType),
      isSelected: widget.isSelected,
      onItemSelected: (index) {
        setState(() {
          for (int i = 0; i < widget.isSelected.length; i++) {
            widget.isSelected[i] = i == index;
          }
        });
      },
      children: children,
    );
  }

  /// Set BorderRadius based on its type and its
  BorderRadius _getBorderRadius(ZeroButtonRadiusType buttonRadiusType) {
    switch (buttonRadiusType) {
      case ZeroButtonRadiusType.rectangle:
        return widget.buttonRadiusType.borderRadius;
      case ZeroButtonRadiusType.curved:
        return widget.buttonRadiusType.borderRadius;
      case ZeroButtonRadiusType.rounded:
        return widget.buttonRadiusType.borderRadius;
      default:
        return widget.buttonSizeType.borderRadius;
    }
  }
}
