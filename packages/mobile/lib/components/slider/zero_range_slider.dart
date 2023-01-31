import 'package:flutter/material.dart';

import '../../colors/zero_colors.dart';
import '../../size/zero_slider_size.dart';
import '../tooltip/zero_tooltip.dart';
import '../tooltip/zero_tooltip_style.dart';
import '../../model/zero_range_values.dart';

enum _ZeroThumb { start, end }

/// A slider component that allows users to select a value from a range of values.
/// [ZeroSlider] is a stateful widget that requires a [State] object to function.
/// this slider have a special feature that allows you to show ticks on the slider
/// and also the thumb can be snapped to the ticks.
///
/// the slider has 2 sizes:
/// 1. [ZeroSliderSize.large] - is the default size of the slider
/// 2. [ZeroSliderSize.small] - is the small size of the slider
class ZeroRangeSlider extends StatefulWidget {
  /// [activeColor] is the color of the active line of the slider
  final Color activeColor;

  /// [inactiveColor] is the color of the inactive line of the slider
  /// when this value is null, the color will be [activeColor] with opacity 0.3
  /// the default color is [ZeroColors.primary6]
  final Color inactiveColor;

  /// [thumbColor] is the color of the thumb of the slider
  /// when this value is null, the color will be [activeColor]
  /// the default color is [ZeroColors.primary6]
  final Color thumbColor;

  /// [tickBehavior] is a boolean that indicates if the slider will snap to the ticks
  /// the default value is false
  final bool tickBehavior;

  /// [tickColor] is the color of the ticks
  /// the default color is [ZeroColors.neutral8]
  final Color tickColor;

  /// [showTicks] is a boolean that indicates if the slider will show ticks
  final bool showTicks;

  /// [tickInterval] is the interval of the ticks
  /// the default value is 10
  final int tickInterval;

  /// [tooltipVariant] is the variant of the tooltip
  /// the default value is [ZeroTooltipVariant.rounded]
  final ZeroTooltipVariant tooltipVariant;

  /// [size] is the size of the slider
  /// the default value is [ZeroSliderSize.large]
  final ZeroSliderSize size;

  /// [initialvalues] is the initial values of the slider
  final ZeroRangeValues initialvalues;

  /// [isDisabled] is a boolean that indicates if the slider is disabled
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
  double _distanceStartFinal = -.1;
  double? _distanceEnd;
  double _distanceEndFinal = -.2;
  double _thumbStartPercentage = 0.0;
  double _thumbEndPercentage = 0.0;
  final double _horizontalMargin = 16.0;

  late Function _thumbStartTooltipController;
  late Function _thumbEndTooltipController;

  double _percentageToDistance(int percentage) {
    return (percentage / 100 * (_widgetKey.currentContext?.size?.width ?? 0));
  }

  /// [_initializeValuesByDefault] is used to initialize the values of the slider
  /// when the user didn't set the values of the slider yet
  void _initializeValuesByDefault() {
    if (_distanceStartFinal == -.1) {
      _distanceStartFinal = _percentageToDistance(widget.initialvalues.start);
    }
    if (_distanceEndFinal == -.2) {
      _distanceEndFinal = _percentageToDistance(widget.initialvalues.end);
    }
  }

  /// this function is used to show the tooltip of the thumb
  /// when the user tap on line of the slider
  /// the tooltip will be shown for 750 milliseconds
  /// and then it will be hidden
  /// this function used in [_onTapSlider]
  Future<void> _onSliderTapTooltip(_ZeroThumb thumb) async {
    await Future.delayed(const Duration(milliseconds: 100), () {
      if (thumb == _ZeroThumb.start) {
        _thumbStartTooltipController(true);
        Future.delayed(const Duration(milliseconds: 750), () {
          _thumbStartTooltipController(false);
        });
      } else if (thumb == _ZeroThumb.end) {
        _thumbEndTooltipController(true);
        Future.delayed(const Duration(milliseconds: 750), () {
          _thumbEndTooltipController(false);
        });
      }
    });
  }

  /// this function is used to slide the thumb to where the user tap on the line
  void _onTapSlider(TapDownDetails details) {
    _initializeValuesByDefault();
    if (details.localPosition.dx < _distanceStartFinal) {
      _distanceStartFinal = details.localPosition.dx - _horizontalMargin;

      if (widget.tickBehavior) {
        final percentage = (details.localPosition.dx) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
        final nearestTick = (percentage / widget.tickInterval).floor() * widget.tickInterval;
        _distanceStartFinal = nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
      }

      setState(() {
        _distanceStart = _distanceStartFinal;
        _thumbStartPercentage =
            (_distanceStart ?? widget.initialvalues.start) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
      });
      _onSliderTapTooltip(_ZeroThumb.start);
    } else if (details.localPosition.dx > _distanceEndFinal) {
      _distanceEndFinal = details.localPosition.dx - _horizontalMargin;

      if (widget.tickBehavior) {
        final percentage = (details.localPosition.dx) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
        final nearestTick = (percentage / widget.tickInterval).round() * widget.tickInterval;
        _distanceEndFinal = nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
      }

      setState(() {
        _distanceEnd = _distanceEndFinal;
        _thumbEndPercentage = (_distanceEnd ?? _percentageToDistance(widget.initialvalues.end)) /
            (_widgetKey.currentContext?.size?.width ?? 0) *
            100;
      });
      _onSliderTapTooltip(_ZeroThumb.end);
    }
  }

  void _onThumbSliderUpdate(dynamic details, _ZeroThumb thumb) {
    _initializeValuesByDefault();

    /// -20 is the padding of the container
    /// this for calibrate the point when dragging
    double newDistance = details.localPosition.dx - _horizontalMargin;
    if (thumb == _ZeroThumb.start) {
      newDistance = newDistance + _distanceStartFinal;
    } else if (thumb == _ZeroThumb.end) {
      newDistance = newDistance + _distanceEndFinal;
    }

    /// when [tickBehavior] is true, the slider will snap to the nearest tick interval
    /// the nearest tick interval is calculated by the percentage of the distance from the left side of the slider
    /// to the maximum width of the slider widget
    if (widget.tickBehavior) {
      final percentage = (details.localPosition.dx) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
      final nearestTick = (percentage / widget.tickInterval).round() * widget.tickInterval;
      newDistance = nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
      newDistance = thumb == _ZeroThumb.start ? newDistance + _distanceStartFinal : newDistance + _distanceEndFinal;
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
        _distanceStart = newDistance > (_distanceEnd ?? _percentageToDistance(widget.initialvalues.end))
            ? (_distanceEnd ?? _percentageToDistance(widget.initialvalues.end))
            : newDistance;
        _thumbStartPercentage = _distanceStart == null
            ? widget.initialvalues.start.toDouble()
            : _distanceStart! / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
      } else if (thumb == _ZeroThumb.end) {
        _distanceEnd = newDistance < (_distanceStart ?? _percentageToDistance(widget.initialvalues.start))
            ? (_distanceStart ?? _percentageToDistance(widget.initialvalues.start))
            : newDistance;
        _thumbEndPercentage = _distanceEnd == null
            ? widget.initialvalues.end.toDouble()
            : _distanceEnd! / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
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
            _distanceStartFinal = _distanceStart!;
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
            _distanceEndFinal = _distanceEnd!;
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
