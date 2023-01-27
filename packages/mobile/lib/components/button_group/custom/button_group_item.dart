import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

class ButtonGroupItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;

  /// Whether or not it has select Icon
  final bool withIcon;

  final IconData? selectIcon;

  final double fontSize;
  final double padding;
  final Color? selectedColor;
  final Color? textColor;

  const ButtonGroupItem(
      {super.key,
      required this.label,
      this.icon,
      this.selectIcon,
      required this.isSelected,
      required this.withIcon,
      this.fontSize = 14,
      this.padding = 20,
      this.selectedColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withIcon)
            Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: isSelected,
                  child: Icon(
                    selectIcon,
                    color: selectedColor,
                    size: fontSize,
                  ),
                )),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Icon(
                icon,
                color: isSelected ? selectedColor : textColor,
                size: fontSize,
              ),
            ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isSelected ? selectedColor : textColor,
                fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
