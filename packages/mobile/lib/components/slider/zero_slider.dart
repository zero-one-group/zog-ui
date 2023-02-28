import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

const _kHorizontalMargin = 16.0;

/// A slider component that allows users to select a value from a range of values.
/// [ZeroSlider] is a stateful widget that requires a [State] object to function.
/// this slider have a special feature that allows you to show ticks on the slider
/// and also the thumb can be snapped to the ticks.
/// and also you can show a tooltip when the user is dragging the thumb.
///
/// the slider has 2 sizes:
/// 1. [ZeroSliderSize.large] - is the default size of the slider
/// 2. [ZeroSliderSize.small] - is the small size of the slider

class ZeroSlider extends StatefulWidget {
  /// [showTicks] is a boolean that indicates if the slider will show ticks
  final bool showTicks;

  /// [tickInterval] is the interval of the ticks
  /// the default value is 10
  /// the value must be divisible by 5
  final int tickInterval;

  /// [size] is the size of the slider
  /// the default value is [ZeroSliderSize.large]
  /// the available sizes are:
  /// 1. [ZeroSliderSize.large] - is the default size of the slider
  /// 2. [ZeroSliderSize.small] - is the small size of the slider
  final ZeroSliderSize size;

  /// [isDisabled] is a boolean that indicates if the slider is disabled
  final bool isDisabled;

  /// If non-null, the style to use for this
  final ZeroSliderStyle? style;

  /// The currently selected value for this slider.
  ///
  /// The slider's thumb is drawn at a position that corresponds to this value.
  final double value;

  /// Called during a drag when the user is selecting a new value for the slider
  /// by dragging.
  ///
  /// The slider passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the slider with the new
  /// value.
  final ValueChanged<double>? onChanged;

  const ZeroSlider({
    super.key,
    this.showTicks = false,
    this.tickInterval = 10,
    this.size = ZeroSliderSize.large,
    this.isDisabled = false,
    this.style,
    required this.value,
    required this.onChanged,
  })  : assert(tickInterval % 5 == 0),
        assert(100 % tickInterval == 0),
        assert(value >= 0 && value <= 100);

  @override
  State<ZeroSlider> createState() => _ZeroSliderState();
}

class _ZeroSliderState extends State<ZeroSlider> {
  final GlobalKey _widgetKey = GlobalKey();
  double? _distance;
  double _percentage = 0.0;

  /// this function is used to control the tooltip
  /// when the user is dragging the thumb, the tooltip will show
  late Function _tooltipController;

  /// this function is used to calculate the distance of the thumb from the left side of the slider
  /// and also the percentage of the distance from the left side of the slider
  /// [_onSliderUpdate] is called when the user is dragging the thumb
  void _onSliderUpdate(Offset localPosition, {required bool tickBehavior}) {
    if (widget.onChanged == null) return;
    double newDistance = localPosition.dx - _kHorizontalMargin;

    /// when [tickBehavior] is true, the slider will snap to the nearest tick interval
    /// the nearest tick interval is calculated by the percentage of the distance from the left side of the slider
    /// to the maximum width of the slider widget
    if (tickBehavior) {
      final percentage = (localPosition.dx - _kHorizontalMargin) /
          (_widgetKey.currentContext?.size?.width ?? 0) *
          100;
      final nearestTick =
          (percentage / widget.tickInterval).round() * widget.tickInterval;
      newDistance =
          nearestTick / 100 * (_widgetKey.currentContext?.size?.width ?? 0);
    }

    /// make sure the distance is not less then 0
    /// or more than the maximum width of the slider widget
    /// or above 100 of the percentage
    if (newDistance < 0) {
      newDistance = 0;
    } else if (newDistance > _widgetKey.currentContext!.size!.width) {
      newDistance = _widgetKey.currentContext!.size!.width;
    }

    _distance = newDistance;
    _percentage =
        (_distance ?? 0) / (_widgetKey.currentContext?.size?.width ?? 0) * 100;
    widget.onChanged?.call(_percentage);
  }

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.sliderStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (widget.isDisabled) return;
            _tooltipController(true);
            _onSliderUpdate(
              details.localPosition,
              tickBehavior: adaptiveStyle.tickBehavior ?? false,
            );
          },
          onHorizontalDragEnd: (details) {
            if (widget.isDisabled) return;
            _tooltipController(false);
          },
          onTapDown: (details) {
            if (widget.isDisabled) return;
            _onSliderUpdate(
              details.localPosition,
              tickBehavior: adaptiveStyle.tickBehavior ?? false,
            );
            Future.delayed(const Duration(milliseconds: 100), () {
              _tooltipController(true);
            });
            Future.delayed(const Duration(milliseconds: 500), () {
              _tooltipController(false);
            });
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              _inactiveLine(style: adaptiveStyle),
              if (widget.showTicks)
                _ticks(constraints.maxWidth, style: adaptiveStyle),
              _activeLine(
                constraints.maxWidth,
                style: adaptiveStyle,
                context: context,
              ),
              _thumb(
                constraints.maxWidth,
                style: adaptiveStyle,
                context: context,
              ),
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
            vertical: 16.0,
            horizontal: _kHorizontalMargin,
          ),
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

  Widget _activeLine(
    double maxWidth, {
    required ZeroSliderStyle style,
    required BuildContext context,
  }) {
    double distance =
        _distance == null ? (widget.value / 100 * maxWidth) : _distance!;
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 16.0, horizontal: _kHorizontalMargin),
      child: Container(
        width: distance,
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

  Widget _thumb(
    double maxWidth, {
    required ZeroSliderStyle style,
    required BuildContext context,
  }) {
    final double distance =
        _distance == null ? (widget.value / 100 * maxWidth) : _distance!;
    return Positioned(
      left: distance - widget.size.lineWidth,
      child: ZeroTooltip(
        style: ZeroTooltipStyle(
          backgroundColor: style.activeColor,
          borderColor: style.activeColor?.withOpacity(0.2),
        ),
        variant: style.tooltipVariant ?? ZeroTooltipVariant.rounded,
        onCreated: (controller) {
          _tooltipController = controller;
        },
        text: _percentage.toStringAsFixed(0),
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
    );
  }
}
