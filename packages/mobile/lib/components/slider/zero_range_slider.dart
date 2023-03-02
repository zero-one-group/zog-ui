import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

const _kHorizontalMargin = 16.0;

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
  /// [showTicks] is a boolean that indicates if the slider will show ticks
  final bool showTicks;

  /// [tickInterval] is the interval of the ticks
  /// the default value is 10
  final int tickInterval;

  /// [size] is the size of the slider
  /// the default value is [ZeroSliderSize.large]
  final ZeroSliderSize size;

  /// The currently selected values for this range slider.
  ///
  /// The slider's thumbs are drawn at horizontal positions that corresponds to
  /// these values.
  final ZeroRangeValues values;

  /// Called when the user is selecting a new value for the slider by dragging.
  ///
  /// The slider passes the new values to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// values.
  final ValueChanged<ZeroRangeValues>? onChanged;

  /// [isDisabled] is a boolean that indicates if the slider is disabled
  final bool isDisabled;

  /// If non-null, the style to use for this widget.
  final ZeroSliderStyle? style;

  const ZeroRangeSlider({
    super.key,
    Color? inactiveColor,
    Color? thumbColor,
    this.tickInterval = 10,
    this.showTicks = false,
    this.size = ZeroSliderSize.large,
    required this.values,
    required this.onChanged,
    this.isDisabled = false,
    this.style,
  })  : assert(tickInterval % 5 == 0),
        assert(100 % tickInterval == 0);

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

  late Function _thumbStartTooltipController;
  late Function _thumbEndTooltipController;

  double _percentageToDistance(int percentage) {
    return (percentage / 100 * (_widgetKey.currentContext?.size?.width ?? 0));
  }

  /// [_initializeValuesByDefault] is used to initialize the values of the slider
  /// when the user didn't set the values of the slider yet
  void _initializeValuesByDefault() {
    if (_distanceStartFinal == -.1) {
      _distanceStartFinal = _percentageToDistance(widget.values.start);
    }
    if (_distanceEndFinal == -.2) {
      _distanceEndFinal = _percentageToDistance(widget.values.end);
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
  void _onTapSlider(Offset localPosition, {required ZeroSliderStyle style}) {
    if (widget.onChanged == null) return;
    _initializeValuesByDefault();
    if (localPosition.dx < _distanceStartFinal) {
      _distanceStartFinal = localPosition.dx - _kHorizontalMargin;

      if (style.tickBehavior == true) {
        final percentage = (localPosition.dx) /
            (_widgetKey.currentContext?.size?.width ?? 0) *
            100;
        final nearestTick =
            (percentage / widget.tickInterval).floor() * widget.tickInterval;
        _distanceStartFinal =
            nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
      }

      _distanceStart = _distanceStartFinal;
      _thumbStartPercentage = (_distanceStart ?? widget.values.start) /
          (_widgetKey.currentContext?.size?.width ?? 0) *
          100;

      _onChange(start: _thumbStartPercentage.toInt());
      _onSliderTapTooltip(_ZeroThumb.start);
    } else if (localPosition.dx > _distanceEndFinal) {
      _distanceEndFinal = localPosition.dx - _kHorizontalMargin;

      if (style.tickBehavior == true) {
        final percentage = (localPosition.dx) /
            (_widgetKey.currentContext?.size?.width ?? 0) *
            100;
        final nearestTick =
            (percentage / widget.tickInterval).round() * widget.tickInterval;
        _distanceEndFinal =
            nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
      }

      _distanceEnd = _distanceEndFinal;
      _thumbEndPercentage =
          (_distanceEnd ?? _percentageToDistance(widget.values.end)) /
              (_widgetKey.currentContext?.size?.width ?? 0) *
              100;

      _onChange(end: _thumbEndPercentage.toInt());
      _onSliderTapTooltip(_ZeroThumb.end);
    }
  }

  void _onThumbSliderUpdate(Offset localPosition, _ZeroThumb thumb,
      {required ZeroSliderStyle style}) {
    if (widget.onChanged == null) return;
    _initializeValuesByDefault();

    /// -20 is the padding of the container
    /// this for calibrate the point when dragging
    double newDistance = localPosition.dx - _kHorizontalMargin;
    if (thumb == _ZeroThumb.start) {
      newDistance = newDistance + _distanceStartFinal;
    } else if (thumb == _ZeroThumb.end) {
      newDistance = newDistance + _distanceEndFinal;
    }

    /// when [tickBehavior] is true, the slider will snap to the nearest tick interval
    /// the nearest tick interval is calculated by the percentage of the distance from the left side of the slider
    /// to the maximum width of the slider widget
    if (style.tickBehavior == true) {
      final percentage = (localPosition.dx) /
          (_widgetKey.currentContext?.size?.width ?? 0) *
          100;
      final nearestTick =
          (percentage / widget.tickInterval).round() * widget.tickInterval;
      newDistance =
          nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
      newDistance = thumb == _ZeroThumb.start
          ? newDistance + _distanceStartFinal
          : newDistance + _distanceEndFinal;
    }

    /// make sure the distance is not less then 0
    /// or more than the maximum width of the slider widget
    /// or above 100 of the percentage
    if (newDistance < 0) {
      newDistance = 0;
    } else if (newDistance > _widgetKey.currentContext!.size!.width) {
      newDistance = _widgetKey.currentContext!.size!.width;
    }

    if (thumb == _ZeroThumb.start) {
      _distanceStart = newDistance >
              (_distanceEnd ?? _percentageToDistance(widget.values.end))
          ? (_distanceEnd ?? _percentageToDistance(widget.values.end))
          : newDistance;
      _thumbStartPercentage = _distanceStart == null
          ? widget.values.start.toDouble()
          : _distanceStart! /
              (_widgetKey.currentContext?.size?.width ?? 0) *
              100;

      _onChange(start: _thumbStartPercentage.toInt());
    } else if (thumb == _ZeroThumb.end) {
      _distanceEnd = newDistance <
              (_distanceStart ?? _percentageToDistance(widget.values.start))
          ? (_distanceStart ?? _percentageToDistance(widget.values.start))
          : newDistance;
      _thumbEndPercentage = _distanceEnd == null
          ? widget.values.end.toDouble()
          : _distanceEnd! / (_widgetKey.currentContext?.size?.width ?? 0) * 100;

      _onChange(end: _thumbEndPercentage.toInt());
    }
  }

  void _onChange({int? start, int? end}) {
    if (start == null && end == null || widget.onChanged == null) return;

    final newStart = start ?? widget.values.start;
    final newEnd = end ?? widget.values.end;
    final isSame = newStart == newEnd;

    final startValue = min(newStart, 99);
    final endValue = min(newEnd, 100);

    if (startValue == widget.values.start && endValue == widget.values.end) {
      return;
    }

    widget.onChanged?.call(
      widget.values.copyWith(
        start: startValue,
        end: endValue +
            (endValue == 0 ? 1 : 0) +
            (isSame ? min(10, 100 - endValue) : 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.values.start >= 0 && widget.values.start <= 100);
    assert(widget.values.end >= 0 && widget.values.end <= 100);

    final themeStyle = context.theme.sliderStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTapDown: (details) {
            if (widget.isDisabled) return;
            _onTapSlider(details.localPosition, style: adaptiveStyle);
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              _inactiveLine(style: adaptiveStyle),
              if (widget.showTicks)
                _ticks(constraints.maxWidth, style: adaptiveStyle),
              _activeLine(constraints.maxWidth, style: adaptiveStyle),
              _thumbEnd(constraints.maxWidth, style: adaptiveStyle),
              _thumbStart(constraints.maxWidth, style: adaptiveStyle),
            ],
          ),
        );
      },
    );
  }

  Widget _inactiveLine({required ZeroSliderStyle style}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 16.0, horizontal: _kHorizontalMargin),
          child: Container(
            key: _widgetKey,
            width: constraints.maxWidth,
            height: widget.size.lineWidth,
            color: widget.isDisabled
                ? context.theme.disabledBackgroundColor
                : style.inactiveColor,
          ),
        );
      },
    );
  }

  Widget _activeLine(double maxWidth, {required ZeroSliderStyle style}) {
    double distanceStart = _distanceStart == null
        ? (widget.values.start / 100 * maxWidth)
        : _distanceStart!;
    double distanceEnd = _distanceEnd == null
        ? (widget.values.end / 100 * maxWidth)
        : _distanceEnd!;
    return Container(
      margin: EdgeInsets.only(left: distanceStart),
      padding: const EdgeInsets.symmetric(
          vertical: 16.0, horizontal: _kHorizontalMargin),
      child: Container(
        width: max(distanceEnd - distanceStart, 0),
        height: widget.size.lineWidth,
        color: widget.isDisabled
            ? context.theme.disabledColor.withOpacity(0.6)
            : style.activeColor,
      ),
    );
  }

  Widget _ticks(double maxWidth, {required ZeroSliderStyle style}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: _kHorizontalMargin),
      width: maxWidth,
      height: widget.size.lineWidth,
      child: Row(
        children: [
          for (int i = 0; i < 100; i += widget.tickInterval)
            Container(
              margin: EdgeInsets.only(
                left: (maxWidth - _kHorizontalMargin * 2) /
                        (100 / widget.tickInterval) -
                    widget.size.lineWidth,
              ),
              height: widget.size.lineWidth,
              width: widget.size.lineWidth,
              decoration: BoxDecoration(
                color: style.tickColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  Widget _thumbStart(double maxWidth, {required ZeroSliderStyle style}) {
    final double distance = _distanceStart == null
        ? (widget.values.start / 100 * maxWidth)
        : _distanceStart!;
    return Positioned(
      left: (distance - widget.size.lineWidth),
      child: ZeroTooltip(
        style: ZeroTooltipStyle(
          backgroundColor: style.activeColor,
          borderColor: style.activeColor?.withOpacity(0.2),
          textStyle: TextStyle(color: style.tooltipColor),
        ),
        variant: style.tooltipVariant ?? ZeroTooltipVariant.rounded,
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
            _onThumbSliderUpdate(
              details.localPosition,
              _ZeroThumb.start,
              style: style,
            );
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: widget.isDisabled
                ? Colors.transparent
                : style.thumbColor?.withOpacity(0.2),
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
                color: widget.isDisabled
                    ? context.theme.disabledColor
                    : style.thumbColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _thumbEnd(double maxWidth, {required ZeroSliderStyle style}) {
    final double distance = _distanceEnd == null
        ? (widget.values.end / 100 * maxWidth)
        : _distanceEnd!;
    return Positioned(
      left: (distance - widget.size.lineWidth),
      child: ZeroTooltip(
        style: ZeroTooltipStyle(
          backgroundColor: style.activeColor,
          borderColor: style.activeColor?.withOpacity(0.2),
          textStyle: TextStyle(color: style.tooltipColor),
        ),
        variant: style.tooltipVariant ?? ZeroTooltipVariant.rounded,
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
            _onThumbSliderUpdate(
              details.localPosition,
              _ZeroThumb.end,
              style: style,
            );
          },
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            highlightColor: widget.isDisabled
                ? Colors.transparent
                : style.thumbColor?.withOpacity(0.2),
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
                color: widget.isDisabled
                    ? context.theme.disabledColor
                    : style.thumbColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
