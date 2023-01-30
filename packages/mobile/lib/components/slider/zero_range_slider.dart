import 'package:flutter/material.dart';

import '../../colors/zero_colors.dart';
import '../../size/zero_slider_size.dart';
import '../tooltip/zero_tooltip.dart';
import '../tooltip/zero_tooltip_style.dart';
import '../../model/zero_range_values.dart';

enum _ZeroThumb { start, end }

class ZeroRangeSlider extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final bool tickBehavior;
  final Color tickColor;
  final bool showTicks;
  final int tickInterval;
  final ZeroTooltipVariant tooltipVariant;
  final ZeroSliderSize size;
  final ZeroRangeValues initialvalues;
  final bool isDisabled;

  ZeroRangeSlider({
    super.key,
    this.activeColor = ZeroColors.primary6,
    Color? inactiveColor,
    Color? thumbColor,
    this.tickBehavior = false,
    this.tickInterval = 10,
    this.showTicks = false,
    this.tooltipVariant = ZeroTooltipVariant.rounded,
    this.size = ZeroSliderSize.large,
    this.initialvalues = const ZeroRangeValues(40, 80),
    this.isDisabled = false,
  })  : thumbColor = thumbColor ?? activeColor,
        inactiveColor = inactiveColor ?? activeColor.withOpacity(0.3),
        tickColor = ZeroColors.neutral8,
        assert(tickInterval % 5 == 0),
        assert(100 % tickInterval == 0),
        assert(initialvalues.start >= 0 && initialvalues.start <= 100),
        assert(initialvalues.end >= 0 && initialvalues.end <= 100),
        assert(initialvalues.start < initialvalues.end);

  @override
  State<ZeroRangeSlider> createState() => _ZeroRangeSliderState();
}

class _ZeroRangeSliderState extends State<ZeroRangeSlider> {
  final GlobalKey _widgetKey = GlobalKey();

  double? _distanceStart;
  double? _distanceEnd;
  double _thumbStartPercentage = 0.0;
  double _thumbEndPercentage = 0.0;
  final double _horizontalMargin = 16.0;

  late Function _thumbStartTooltipController;
  late Function _thumbEndTooltipController;

  double _percentageToDistance(int percentage) {
    return (percentage / 100 * (_widgetKey.currentContext?.size?.width ?? 0));
  }

  _onTapSlider(TapDownDetails details) {
    if (_distanceStart != null && details.globalPosition.dx < _distanceStart!) {
      _onThumbSliderUpdate(details, _ZeroThumb.start);
    } else if (_distanceEnd != null && details.globalPosition.dx > _distanceEnd!) {
      _onThumbSliderUpdate(details, _ZeroThumb.end);
    }
  }

  _onThumbSliderUpdate(dynamic details, _ZeroThumb thumb) {
    /// -20 is the padding of the container
    /// this for calibrate the point when dragging
    double newDistance = details.globalPosition.dx - 20;

    /// when [tickBehavior] is true, the slider will snap to the nearest tick interval
    /// the nearest tick interval is calculated by the percentage of the distance from the left side of the slider
    /// to the maximum width of the slider widget
    if (widget.tickBehavior) {
      final percentage = (details.globalPosition.dx - 20) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
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
      if (thumb == _ZeroThumb.start) {
        _distanceStart = newDistance > (_distanceEnd ?? _percentageToDistance(widget.initialvalues.start))
            ? (_distanceEnd ?? _percentageToDistance(widget.initialvalues.start))
            : newDistance;
        _thumbStartPercentage =
            (_distanceStart ?? widget.initialvalues.start) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
      } else if (thumb == _ZeroThumb.end) {
        _distanceEnd = newDistance < (_distanceStart ?? _percentageToDistance(widget.initialvalues.end))
            ? (_distanceStart ?? _percentageToDistance(widget.initialvalues.end))
            : newDistance;
        _thumbEndPercentage = (_distanceEnd ?? 0) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapDown: (details) {
            if (widget.isDisabled) return;
            _onTapSlider(details);
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
                _thumbEnd(constraints.maxWidth),
                _thumbStart(constraints.maxWidth),
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
    double distanceStart = _distanceStart == null ? (widget.initialvalues.start / 100 * maxWidth) : _distanceStart!;
    double distanceEnd = _distanceEnd == null ? (widget.initialvalues.end / 100 * maxWidth) : _distanceEnd!;
    return Container(
      margin: EdgeInsets.only(left: distanceStart),
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: _horizontalMargin),
      child: Container(
        width: distanceEnd - distanceStart,
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

  Widget _thumbStart(double maxWidth) {
    final double distance = _distanceStart == null ? (widget.initialvalues.start / 100 * maxWidth) : _distanceStart!;
    return Positioned(
      left: (distance - widget.size.lineWidth),
      child: ZeroTooltip(
        backgroundColor: widget.activeColor,
        borderColor: ZeroColors.neutral1.withOpacity(0.2),
        variant: widget.tooltipVariant,
        onCreated: (controller) {
          _thumbStartTooltipController = controller;
        },
        text: _thumbStartPercentage.toStringAsFixed(0),
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (widget.isDisabled) return;
            _thumbStartTooltipController(false);
          },
          onHorizontalDragUpdate: (details) {
            if (widget.isDisabled) return;
            _thumbStartTooltipController(true);
            _onThumbSliderUpdate(details, _ZeroThumb.start);
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: widget.isDisabled ? ZeroColors.neutral7.withOpacity(0.2) : widget.thumbColor.withOpacity(0.2),
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
      ),
    );
  }

  Widget _thumbEnd(double maxWidth) {
    final double distance = _distanceEnd == null ? (widget.initialvalues.end / 100 * maxWidth) : _distanceEnd!;
    return Positioned(
      left: (distance - widget.size.lineWidth),
      child: ZeroTooltip(
        backgroundColor: widget.activeColor,
        borderColor: ZeroColors.neutral1.withOpacity(0.2),
        variant: widget.tooltipVariant,
        onCreated: (controller) {
          _thumbEndTooltipController = controller;
        },
        text: _thumbEndPercentage.toStringAsFixed(0),
        child: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (widget.isDisabled) return;
            _thumbEndTooltipController(false);
          },
          onHorizontalDragUpdate: (details) {
            if (widget.isDisabled) return;
            _thumbEndTooltipController(true);
            _onThumbSliderUpdate(details, _ZeroThumb.end);
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: widget.isDisabled ? ZeroColors.neutral7.withOpacity(0.2) : widget.thumbColor.withOpacity(0.2),
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
      ),
    );
  }
}
