import 'package:flutter/material.dart';

class UnderlineButtonGroup extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final double width;
  final List<bool> isSelected;
  final Color fillColor;
  final Color selectedColor;
  final Color selectedFillColor;
  final BorderRadius borderRadius;
  final double bottomBorderWidth;
  final Function(int) onItemSelected;

  const UnderlineButtonGroup(
      {super.key,
      required this.children,
      required this.isSelected,
      required this.onItemSelected,
      required this.height,
      required this.width,
      required this.fillColor,
      required this.selectedColor,
      required this.borderRadius,
      required this.selectedFillColor,
      required this.bottomBorderWidth});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    for (var i = 0; i < children.length; i++) {
      buttons.add(InkWell(
        onTap: () {
          onItemSelected.call(i);
        },
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height,
            minWidth: width,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected[i] ? selectedFillColor : null,
              border: Border(
                top: BorderSide(
                    width: bottomBorderWidth, color: Colors.transparent),
                bottom: BorderSide(
                  width: bottomBorderWidth,
                  color: isSelected[i] ? selectedColor : Colors.transparent,
                ),
              ),
            ),
            child: Center(
              child: children[i],
            ),
          ),
        ),
      ));
    }
    return Container(
      padding: EdgeInsets.zero,
      height: height,
      decoration: BoxDecoration(color: fillColor, borderRadius: borderRadius),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: buttons),
    );
  }
}
