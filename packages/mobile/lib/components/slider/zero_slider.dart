import 'package:flutter/material.dart';

import '../../colors/zero_colors.dart';
import '../../size/zero_slider_size.dart';
import '../tooltip/zero_tooltip.dart';
import '../tooltip/zero_tooltip_style.dart';

class ZeroSlider extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final bool tickBehavior;
  final Color tickColor;
  final bool showTicks;
  final int tickInterval;
  final int initialValue;
  final ZeroTooltipVariant tooltipVariant;
  final ZeroSliderSize size;
  final bool isDisabled;

  ZeroSlider({
    super.key,
    this.activeColor = ZeroColors.primary6,
    Color? inactiveColor,
    Color? thumbColor,
    this.tickBehavior = false,
    this.showTicks = false,
    this.tickInterval = 10,
    this.initialValue = 0,
    this.tooltipVariant = ZeroTooltipVariant.rounded,
    this.size = ZeroSliderSize.large,
    this.isDisabled = false,
  })  : thumbColor = thumbColor ?? activeColor,
        inactiveColor = inactiveColor ?? activeColor.withOpacity(0.3),
        tickColor = ZeroColors.neutral8,
        assert(tickInterval % 5 == 0),
        assert(100 % tickInterval == 0),
        assert(initialValue >= 0 && initialValue <= 100);

  @override
  State<ZeroSlider> createState() => _ZeroSliderState();
}

class _ZeroSliderState extends State<ZeroSlider> {
  final GlobalKey _widgetKey = GlobalKey();
  double? _distance;
  double _percentage = 0.0;
  final double _horizontalMargin = 16.0;

  late Function _tooltipController;

  _onSliderUpdate(dynamic details) {
    /// 15 is the padding of the container
    /// this for calibrate the point when dragging
    double newDistance = details.localPosition.dx - _horizontalMargin;

    /// when [tickBehavior] is true, the slider will snap to the nearest tick interval
    /// the nearest tick interval is calculated by the percentage of the distance from the left side of the slider
    /// to the maximum width of the slider widget
    if (widget.tickBehavior) {
      final percentage = (details.localPosition.dx - _horizontalMargin) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
      final nearestTick = (percentage / widget.tickInterval).round() * widget.tickInterval;
      newDistance = nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
    }

    /// make sure the distance is not less then 0
    /// or more than the maximum width of the slider widget
    /// or above 100 of the percentage
    if (newDistance < 0) {
      newDistance = 0;
    } else if (newDistance > _widgetKey.currentContext!.size!.width) {
      newDistance = _widgetKey.currentContext!.size!.width;
    }

    setState(() {
      _distance = newDistance;
      _percentage = (_distance ?? 0) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (widget.isDisabled) return;
            _tooltipController(true);
            _onSliderUpdate(details);
          },
          onHorizontalDragEnd: (details) {
            if (widget.isDisabled) return;
            _tooltipController(false);
          },
          onTapDown: (details) {
            if (widget.isDisabled) return;
            _onSliderUpdate(details);
            Future.delayed(const Duration(milliseconds: 100), () {
              _tooltipController(true);
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              _tooltipController(false);
            });
          },
          child: Container(
            color: ZeroColors.transparent,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                _inactiveLine(),
                if (widget.showTicks) _ticks(constraints.maxWidth),
                _activeLine(constraints.maxWidth),
                _thumb(constraints.maxWidth),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _inactiveLine() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: _horizontalMargin),
          child: Container(
            key: _widgetKey,
            width: constraints.maxWidth,
            height: widget.size.lineWidth,
            color: widget.isDisabled ? ZeroColors.neutral4 : widget.inactiveColor,
          ),
        );
      },
    );
  }

  Widget _activeLine(double maxWidth) {
    double distance = _distance == null ? (widget.initialValue / 100 * maxWidth) : _distance!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: _horizontalMargin),
      child: Container(
        width: distance,
        height: widget.size.lineWidth,
        color: widget.isDisabled ? ZeroColors.neutral6 : widget.activeColor,
      ),
    );
  }

  Widget _ticks(double maxWidth) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _horizontalMargin),
      width: maxWidth,
      height: widget.size.lineWidth,
      child: Row(
        children: [
          for (int i = 0; i < 100; i += widget.tickInterval)
            Container(
              margin: EdgeInsets.only(
                left: (maxWidth - _horizontalMargin * 2) / (100 / widget.tickInterval) - widget.size.lineWidth,
              ),
              height: widget.size.lineWidth,
              width: widget.size.lineWidth,
              decoration: BoxDecoration(
                color: widget.tickColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _thumb(double maxWidth) {
    final double distance = _distance == null ? (widget.initialValue / 100 * maxWidth) : _distance!;
    return Positioned(
      left: distance - widget.size.lineWidth,
      child: ZeroTooltip(
        backgroundColor: widget.activeColor,
        borderColor: ZeroColors.neutral1.withOpacity(0.2),
        variant: widget.tooltipVariant,
        onCreated: (controller) {
          _tooltipController = controller;
        },
        text: _percentage.toStringAsFixed(0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          highlightColor: widget.isDisabled ? ZeroColors.neutral7.withOpacity(0.3) : widget.thumbColor.withOpacity(0.2),
          splashColor: Colors.transparent,
          onTap: () {
            // do nothing
          },
          child: Container(
            margin: EdgeInsets.all(widget.size.thumbMargin),
            height: widget.size.thumbSize,
            width: widget.size.thumbSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.isDisabled ? ZeroColors.neutral7 : widget.thumbColor,
            ),
          ),
        ),
      ),
    );
  }
}
