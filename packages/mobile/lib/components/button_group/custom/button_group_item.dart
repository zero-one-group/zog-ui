import 'package:flutter/material.dart';

class ButtonGroupItem extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;

  /// Whether or not it has select Icon
  final bool withIcon;
  final IconData? selectIcon;
  final double padding;
  final TextStyle labelStyle;
  final Color? activeColor;
  final Color? inactiveColor;

  const ButtonGroupItem({
    super.key,
    required this.label,
    this.icon,
    this.selectIcon,
    required this.isSelected,
    required this.withIcon,
    this.padding = 20,
    required this.labelStyle,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = TextStyle(
      fontSize: labelStyle.fontSize,
      color: isSelected ? activeColor : inactiveColor,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (withIcon && isSelected)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Icon(
                selectIcon,
                color: baseStyle.color,
                size: baseStyle.fontSize,
              ),
            ),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Icon(
                icon,
                color: baseStyle.color,
                size: baseStyle.fontSize,
              ),
            ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: labelStyle.merge(baseStyle),
          ),
        ],
      ),
    );
  }
}
