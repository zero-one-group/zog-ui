import 'package:flutter/material.dart';

class UnderlineButtonGroup extends StatelessWidget {
  final List<Widget> children;
  final List<bool> selecteds;
  final Color fillColor;
  final Color selectedColor;
  final Color selectedFillColor;
  final BorderRadius borderRadius;
  final double bottomBorderWidth;
  final Function(int) onItemSelected;
  final bool isVertical;
  final bool square;
  final double? verticalPadding;

  const UnderlineButtonGroup({
    super.key,
    required this.children,
    required this.selecteds,
    required this.onItemSelected,
    required this.fillColor,
    required this.selectedColor,
    required this.borderRadius,
    required this.selectedFillColor,
    required this.bottomBorderWidth,
    this.isVertical = false,
    this.square = false,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    for (var i = 0; i < children.length; i++) {
      final isFirst = i == 0;
      final isLast = i == children.length - 1;
      buttons.add(
        ClipRRect(
          borderRadius: isVertical
              ? BorderRadius.vertical(
                  top: isFirst ? borderRadius.topLeft : Radius.zero,
                  bottom: isLast ? borderRadius.topRight : Radius.zero,
                )
              : BorderRadius.horizontal(
                  left: isFirst ? borderRadius.topLeft : Radius.zero,
                  right: isLast || isVertical
                      ? borderRadius.topRight
                      : Radius.zero,
                ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                bottom: selecteds[i]
                    ? BorderSide(
                        width: bottomBorderWidth,
                        color: selectedColor,
                      )
                    : BorderSide.none,
              ),
            ),
            child: TextButton(
              onPressed: () => onItemSelected.call(i),
              style: TextButton.styleFrom(
                minimumSize: const Size(20, 20),
                foregroundColor: selectedColor,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: EdgeInsets.zero,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 0),
                child: children[i],
              ),
            ),
          ),
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(color: fillColor, borderRadius: borderRadius),
      child: isVertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: buttons,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: buttons,
            ),
    );
  }
}
