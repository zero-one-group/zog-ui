import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/tooltip/zero_tooltip_style.dart';

import '../../position/tooltip_position.dart';
import '../../types/tooltip_type.dart';

/// [ZeroTooltip] is a widget that shows a tooltip when the widget got a gesture.
/// the tooltip is customizable with [ZeroTooltipStyle] and [ZeroTooltipType]
/// this widget created based on zero ui design system
///
/// there are 2 types of tooltip:
/// 1. [ZeroTooltipType.light] - the tooltip is has a light background [ZeroColors.neutral2] and dark text [ZeroColors.neutral10]
/// 2. [ZeroTooltipType.dark] - the tooltip is has a dark background [ZeroColors.neutral10] and light text [ZeroColors.neutral2]
///
/// also there are 3 variants of tooltip:
/// 1. [ZeroTooltipVariant.rectangle] - the tooltip is a rectangle
/// 2. [ZeroTooltipVariant.rounded] - the tooltip is a circle/rounded
/// 3. [ZeroTooltipVariant.custom] - the tooltip is a rectangle with arrow
///
/// user can customize the position of the tooltip with [ZeroTooltipPosition]
/// [ZeroTooltipPosition.top] - the tooltip is on the top of the widget
/// [ZeroTooltipPosition.bottom] - the tooltip is on the bottom of the widget
/// [ZeroTooltipPosition.left] - the tooltip is on the left of the widget
/// [ZeroTooltipPosition.right] - the tooltip is on the right of the widget
class ZeroTooltip extends StatefulWidget {
  /// [child] is the widget that will show the tooltip when the user has a gesture on it
  final Widget child;

  /// [backgroundColor] is the background color of the tooltip
  /// if the user didn't pass any color, the color will be the default color of the [type]
  final Color backgroundColor;

  /// [textColor] is the text color of the tooltip
  /// if the user didn't pass any color, the color will be the default color of the [type]
  final Color textColor;

  /// [borderColor] is the border color of the tooltip
  /// if the user didn't pass any color, the color will be the default color of the [type]
  final Color borderColor;

  /// [text] is the text that will show in the tooltip
  /// this text is required
  final String text;

  /// [textStyle] for customizing the text style of the tooltip text
  final TextStyle? textStyle;

  /// [onCreated] is a callback that will return a function that will show the tooltip
  /// this function for special cases that the user want to show the tooltip manually
  /// for example, the user want to show the tooltip when the user click on a button
  /// the user can use this function to show the tooltip
  final Function(bool Function(bool show) controller)? onCreated;

  /// [position] is the position of the tooltip
  /// the default position is [ZeroTooltipPosition.top]
  /// the user can change the position to [ZeroTooltipPosition.bottom], [ZeroTooltipPosition.left], [ZeroTooltipPosition.right]
  final ZeroTooltipPosition position;

  /// [showDuration] is the duration that the tooltip will show
  /// the default duration is 2 seconds
  final Duration showDuration;

  /// [variant] is the variant of the tooltip
  /// the default variant is [ZeroTooltipVariant.rectangle]
  /// the user can change the variant to [ZeroTooltipVariant.rounded], [ZeroTooltipVariant.custom]
  final ZeroTooltipVariant variant;

  /// [type] is the type of the tooltip
  /// the default type is [ZeroTooltipType.dark]
  /// the user can change the type to [ZeroTooltipType.light]
  final ZeroTooltipType type;

  ZeroTooltip({
    super.key,
    required this.child,
    required this.text,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    this.textStyle,
    this.onCreated,
    this.position = ZeroTooltipPosition.top,
    this.showDuration = const Duration(milliseconds: 2000),
    this.variant = ZeroTooltipVariant.rectangle,
    this.type = ZeroTooltipType.dark,
  })  : backgroundColor = backgroundColor ?? type.backgroundColor,
        textColor = textColor ?? type.textColor,
        borderColor = borderColor ?? type.borderColor;

  @override
  State<ZeroTooltip> createState() => _ZeroTooltipState();
}

class _ZeroTooltipState extends State<ZeroTooltip> {
  bool _showTooltip = false;

  /// [_widgetKey] is the key of the widget for getting the size of child widget
  /// this key is used for calculating the position of the tooltip in [_getChildSize]
  final GlobalKey _widgetKey = GlobalKey();

  /// [_widgetTextKey] is the key of the text for getting the size of text widget
  /// this key is used for special case when variant is [ZeroTooltipVariant.rounded]
  final GlobalKey _widgetTextKey = GlobalKey();
  double _positionLeft = 45;
  double _positionRight = 45;

  /// [_getChildSize] is a function that will get the size of the child widget
  /// this function for calculating the position of the tooltip
  /// when position of tooltip is [ZeroTooltipPosition.left] or [ZeroTooltipPosition.right]
  void _getChildSize() {
    final double width = _widgetKey.currentContext?.size?.width ?? 0;
    _positionLeft = width + 15;
    _positionRight = width + 15;
  }

  /// [showTooltip] is a function that will show the tooltip
  bool showTooltip(bool show) {
    setState(() {
      _showTooltip = show;
    });
    return _showTooltip;
  }

  @override
  void initState() {
    super.initState();
    widget.onCreated?.call(showTooltip);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          height: 35,
          top: widget.position == ZeroTooltipPosition.top ? -45 : null,
          bottom: widget.position == ZeroTooltipPosition.bottom ? -45 : null,
          left: widget.position == ZeroTooltipPosition.right ? _positionLeft : null,
          right: widget.position == ZeroTooltipPosition.left ? _positionRight : null,
          child: _showTooltip
              ? CustomPaint(
                  painter: widget.variant.toPainter(
                    backgroundColor: widget.backgroundColor,
                    position: widget.position,
                    borderColor: widget.borderColor,
                  ),
                  child: Padding(
                    padding: widget.variant == ZeroTooltipVariant.rounded
                        ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                        : const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Center(
                      child: widget.variant == ZeroTooltipVariant.rounded
                          ? SizedBox(
                              width: 35,
                              child: Text(
                                widget.text,
                                key: _widgetTextKey,
                                style: widget.textStyle ?? TextStyle(color: widget.textColor),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Text(
                              widget.text,
                              key: _widgetTextKey,
                              style: widget.textStyle ?? TextStyle(color: widget.textColor),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                )
              : Container(),
        ),
        GestureDetector(
          onLongPress: () {
            _getChildSize();
            showTooltip(true);
          },
          onLongPressEnd: (details) {
            showTooltip(false);
          },
          onTap: () {
            _getChildSize();
            if (_showTooltip == false) {
              Future.delayed(widget.showDuration, () {
                showTooltip(false);
              });
              showTooltip(true);
            }
          },
          child: Container(
            key: _widgetKey,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
