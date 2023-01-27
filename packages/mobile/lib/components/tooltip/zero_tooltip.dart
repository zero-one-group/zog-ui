import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/components/tooltip/zero_tooltip_style.dart';

import '../../position/tooltip_position.dart';
import '../../types/tooltip_type.dart';

class ZeroTooltip extends StatefulWidget {
  final Widget child;
  final Color backgaroundColor;
  final Color textColor;
  final Color borderColor;
  final String text;
  final TextStyle? textStyle;
  final Function(bool Function(bool show) controller)? onCreated;
  final ZeroTooltipPosition position;
  final Duration showDuration;
  final ZeroTooltipVariant variant;
  final ZeroTooltipType type;

  ZeroTooltip({
    super.key,
    required this.child,
    required this.text,
    Color? backgaroundColor,
    Color? textColor,
    Color? borderColor,
    this.textStyle,
    this.onCreated,
    this.position = ZeroTooltipPosition.top,
    this.showDuration = const Duration(milliseconds: 2000),
    this.variant = ZeroTooltipVariant.rectangle,
    this.type = ZeroTooltipType.dark,
  })  : backgaroundColor = backgaroundColor ?? type.backgroundColor,
        textColor = textColor ?? type.textColor,
        borderColor = borderColor ?? type.borderColor;

  @override
  State<ZeroTooltip> createState() => _ZeroTooltipState();
}

class _ZeroTooltipState extends State<ZeroTooltip> {
  bool _showTooltip = false;

  final GlobalKey _widgetKey = GlobalKey();
  final GlobalKey _widgetTextKey = GlobalKey();
  double _positionLeft = 45;
  double _positionRight = 45;

  void _getChildSize() {
    final double width = _widgetKey.currentContext?.size?.width ?? 0;
    _positionLeft = width + 15;
    _positionRight = width + 15;
  }

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
                    backgaroundColor: widget.backgaroundColor,
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
