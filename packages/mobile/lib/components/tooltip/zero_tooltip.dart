import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

typedef OnTooltipCreatedCallback = Function(
    bool Function(bool show) controller);

/// [ZeroTooltip] is a widget that shows a tooltip when the widget got a gesture.
/// the tooltip is customizable with [ZeroTooltipStyle] and [ZeroTooltipType]
/// this widget created based on zero ui design system
///
/// there are 2 types of tooltip:
/// 1. [ZeroTooltipType.light] - the tooltip is has a light background [ZeroColors.neutral2] and dark text [ZeroColors.neutral[10]]
/// 2. [ZeroTooltipType.dark] - the tooltip is has a dark background [ZeroColors.neutral[10]] and light text [ZeroColors.neutral2]
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

  /// [text] is the text that will show in the tooltip
  /// this text is required
  final String text;

  /// [onCreated] is a callback that will return a function that will show the tooltip
  /// this function for special cases that the user want to show the tooltip manually
  /// for example, the user want to show the tooltip when the user click on a button
  /// the user can use this function to show the tooltip
  final OnTooltipCreatedCallback? onCreated;

  /// [position] is the position of the tooltip
  /// the default position is [ZeroTooltipPosition.top]
  /// the user can change the position to [ZeroTooltipPosition.bottom], [ZeroTooltipPosition.left], [ZeroTooltipPosition.right]
  final ZeroTooltipPosition position;

  /// [variant] is the variant of the tooltip
  /// the default variant is [ZeroTooltipVariant.rectangle]
  /// the user can change the variant to [ZeroTooltipVariant.rounded], [ZeroTooltipVariant.custom]
  final ZeroTooltipVariant variant;

  /// Identify the tooltip using a dark or light brightness.
  ///
  /// By default brightness adjusts to the current theme
  final Brightness? brightness;

  /// Customize the tooltip style
  ///
  /// By default style is taken from global [ZeroThemeData.tooltipStyle]
  ///
  /// And if the style is not null, then the style will override the global theme
  final ZeroTooltipStyle? style;

  const ZeroTooltip({
    super.key,
    required this.child,
    required this.text,
    this.onCreated,
    this.position = ZeroTooltipPosition.top,
    this.variant = ZeroTooltipVariant.rectangle,
    this.brightness,
    this.style,
  });

  @override
  State<ZeroTooltip> createState() => _ZeroTooltipState();
}

class _ZeroTooltipState extends State<ZeroTooltip> {
  bool _showTooltip = false;
  OverlayEntry? _overlayEntry;
  late ZeroTooltipStyle adaptiveStyle;

  /// [_widgetKey] is the key of the widget for getting the size of child widget
  /// this key is used for calculating the position of the tooltip in [_getChildSize]
  final GlobalKey _widgetKey = GlobalKey();

  /// [showTooltip] is a function that will show the tooltip
  bool showTooltip(bool show) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (show) {
      _createOverlayWidget();
    }
    setState(() {
      _showTooltip = show;
    });
    return _showTooltip;
  }

  void _createOverlayWidget() {
    RenderBox box = _widgetKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    Size childSize = box.size;
    final currentBrightness = widget.brightness ?? context.theme.brightness;

    final backgroundColor = (widget.style?.backgroundColor == null
            ? (currentBrightness.isDark
                ? adaptiveStyle.darkBackgroundColor
                : adaptiveStyle.lightBackgroundColor)
            : widget.style?.backgroundColor!) ??
        Colors.transparent;

    final textColor = context.theme.brightness != widget.brightness &&
            adaptiveStyle.textStyle?.color == null
        ? (widget.brightness?.isDark == true
            ? ZeroColors.white
            : ZeroColors.black)
        : null;

    OverlayState overlayState = Overlay.of(context, rootOverlay: true);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: position.dy,
              left: position.dx,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    width: childSize.width,
                    height: childSize.height,
                  ),
                  Positioned(
                    bottom: widget.position == ZeroTooltipPosition.top
                        ? childSize.height + 15
                        : null,
                    top: widget.position == ZeroTooltipPosition.bottom
                        ? childSize.height + 15
                        : null,
                    left: widget.position == ZeroTooltipPosition.right
                        ? childSize.width + 15
                        : null,
                    right: widget.position == ZeroTooltipPosition.left
                        ? childSize.width + 15
                        : null,
                    child: CustomPaint(
                      painter: widget.variant.toPainter(
                        backgroundColor: backgroundColor,
                        position: widget.position,
                        borderColor:
                            adaptiveStyle.borderColor ?? Colors.transparent,
                      ),
                      child: Padding(
                        padding: widget.variant == ZeroTooltipVariant.rounded
                            ? const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8)
                            : const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                        child: DefaultTextStyle(
                          style: DefaultTextStyle.of(context).style.merge(
                              adaptiveStyle.textStyle
                                  ?.copyWith(color: textColor)),
                          child: Center(
                            child: widget.variant == ZeroTooltipVariant.rounded
                                ? SizedBox(
                                    width: 35,
                                    child: Text(
                                      widget.text,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : Text(
                                    widget.text,
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
    overlayState.insert(_overlayEntry!);
  }

  @override
  void initState() {
    super.initState();
    widget.onCreated?.call(showTooltip);
  }

  @override
  void dispose() {
    super.dispose();
    _overlayEntry?.remove();
  }

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.tooltipStyle;
    adaptiveStyle = themeStyle.merge(widget.style);

    return GestureDetector(
      onLongPress: () {
        showTooltip(true);
      },
      onLongPressEnd: (details) {
        showTooltip(false);
      },
      onTap: () {
        if (_showTooltip == false) {
          Future.delayed(adaptiveStyle.duration ?? const Duration(seconds: 2),
              () {
            showTooltip(false);
          });
          showTooltip(true);
        }
      },
      child: SizedBox(
        key: _widgetKey,
        child: widget.child,
      ),
    );
  }
}
