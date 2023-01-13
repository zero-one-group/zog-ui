import 'package:flutter/material.dart';

import '../../colors/zero_colors.dart';
import '../../types/button_radius_type.dart';

/// [_ButtonAnimating] is the widget that will be used to animate [ZeroButton] when it is pressed
/// this widget to add extra function when [ZeroButton] is pressed
class ButtonAnimating extends StatefulWidget {
  const ButtonAnimating({
    super.key,
    required this.child,
    required this.callback,
    required this.buttonRadiusType,
    required this.height,
    required this.animatingColor,
  });
  final Widget child;
  final void Function(void Function()) callback;
  final ZeroButtonRadiusType buttonRadiusType;
  final double height;
  final Color animatingColor;
  @override
  State<ButtonAnimating> createState() => _ButtonAnimatingState();
}

class _ButtonAnimatingState extends State<ButtonAnimating> {
  bool isPressing = false;

  void update() {
    setState(() {
      isPressing = !isPressing;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        isPressing = !isPressing;
      });
    });
  }

  static BorderRadius _buttonRadiusType(ZeroButtonRadiusType buttonRadiusType) {
    switch (buttonRadiusType) {
      case ZeroButtonRadiusType.rectangle:
        return BorderRadius.zero;
      case ZeroButtonRadiusType.curved:
        return BorderRadius.circular(10);
      case ZeroButtonRadiusType.rounded:
        return BorderRadius.circular(100);
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.callback.call(update);
    return AnimatedContainer(
      height: widget.height,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        border: Border.all(
          color: isPressing ? widget.animatingColor : ZeroColors.transparentWhite,
          width: 3,
        ),
        borderRadius: _buttonRadiusType(widget.buttonRadiusType),
        color: isPressing ? widget.animatingColor : ZeroColors.transparentWhite,
      ),
      child: widget.child,
    );
  }
}
