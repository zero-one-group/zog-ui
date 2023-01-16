import 'package:flutter/material.dart';

class CustomButtonGroup extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final double width;
  final Color fillColor;
  final BorderRadius borderRadius;

  const CustomButtonGroup(
      {super.key,
      required this.children,
      required this.height,
      required this.width,
      required this.fillColor,
      required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = [];

    debugPrint('fillColor ${fillColor.toString()}');

    for (var i = 0; i < children.length; i++) {
      if (i == 0) {
        buttons.add(Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.only(
                topRight: borderRadius.topRight,
                bottomRight: borderRadius.bottomRight),
          ),
          child: children[i],
        ));
      } else if (i == children.length - 1) {
        buttons.add(Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.only(
                topRight: borderRadius.topRight,
                bottomRight: borderRadius.bottomRight),
          ),
          child: children[i],
        ));
      } else {
        buttons.add(Center(
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: fillColor,
            ),
            child: children[i],
          ),
        ));
      }
    }
    return Container(
      padding: EdgeInsets.zero,
      height: height,
      decoration: BoxDecoration(color: fillColor, borderRadius: borderRadius),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: buttons),
    );
  }
}
