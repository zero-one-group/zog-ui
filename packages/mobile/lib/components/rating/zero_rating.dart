import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

import '../../colors/zero_colors.dart';

class ZeroRating extends StatefulWidget {
  const ZeroRating({
    super.key,
    this.itemCount = 5,
    this.spacing = 0,
    this.initialValue = 1,
    this.minValue = 0,
    this.allowHalfRating = true,
    this.onRatingUpdate,
    this.activeColor = ZeroColors.sunriseYellow6,
    this.inactiveColor = ZeroColors.neutral6,
    this.isDisabled = false,
    this.sizeType = ZeroSizeType.medium,
  })  : assert(itemCount > 0),
        assert(initialValue >= minValue),
        assert(initialValue <= itemCount),
        assert(minValue >= 0),
        assert(minValue <= itemCount);

  final int itemCount;
  final double spacing;
  final double initialValue;
  final double minValue;
  final bool allowHalfRating;
  final Function(double)? onRatingUpdate;
  final Color activeColor;
  final Color inactiveColor;
  final bool isDisabled;
  final ZeroSizeType sizeType;

  @override
  State<ZeroRating> createState() => _ZeroRatingState();
}

class _ZeroRatingState extends State<ZeroRating> {
  Color activeColor = ZeroColors.sunriseYellow6;
  Color inactiveColor = ZeroColors.neutral6;
  double value = 0;

  final GlobalKey _widgetKey = GlobalKey();
  Size _widgetSize = Size.zero;
  double _singleItemSize = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    activeColor = widget.isDisabled ? widget.activeColor.withOpacity(0.5) : widget.activeColor;
    inactiveColor = widget.isDisabled ? widget.inactiveColor.withOpacity(0.5) : widget.inactiveColor;
  }

  @override
  void didUpdateWidget(covariant ZeroRating oldWidget) {
    super.didUpdateWidget(oldWidget);
    activeColor = widget.isDisabled ? widget.activeColor.withOpacity(0.5) : widget.activeColor;
    inactiveColor = widget.isDisabled ? widget.inactiveColor.withOpacity(0.5) : widget.inactiveColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: GestureDetector(
        onHorizontalDragStart: (details) {
          _widgetSize = _widgetKey.currentContext?.size ?? Size.zero;
          _singleItemSize = _widgetSize.width / widget.itemCount;
        },
        onHorizontalDragUpdate: (details) {
          if (widget.isDisabled) return;
          widget.onRatingUpdate?.call(_onRatingDrag(details));
          setState(() {
            value = _onRatingDrag(details);
          });
        },
        child: Row(
          key: _widgetKey,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (double i = 0; i < widget.itemCount; i++)
              if (widget.allowHalfRating && i == value.floor() && value % 1 != 0)
                _starHalf()
              else if (i < value)
                _starFull(i)
              else
                _starOutlined(i),
          ],
        ),
      ),
    );
  }

  Widget _starHalf() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.spacing),
      padding: const EdgeInsets.symmetric(horizontal: 0.4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/star_half.svg',
            package: 'zero_ui_mobile',
            color: activeColor,
            width: _ratingSize(widget.sizeType),
            height: _ratingSize(widget.sizeType),
          ),
          SvgPicture.asset(
            'assets/icons/star_outlined_half.svg',
            package: 'zero_ui_mobile',
            color: inactiveColor,
            width: _ratingSize(widget.sizeType),
            height: _ratingSize(widget.sizeType),
          ),
        ],
      ),
    );
  }

  Widget _starFull(double index) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => _onRatingTap(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.spacing),
        child: SvgPicture.asset(
          'assets/icons/star.svg',
          package: 'zero_ui_mobile',
          color: index < value ? activeColor : inactiveColor,
          width: _ratingSize(widget.sizeType),
          height: _ratingSize(widget.sizeType),
        ),
      ),
    );
  }

  Widget _starOutlined(double index) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => _onRatingTap(index),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: widget.spacing),
        child: SvgPicture.asset(
          'assets/icons/star_outlined.svg',
          package: 'zero_ui_mobile',
          color: index < value ? activeColor : inactiveColor,
          width: _ratingSize(widget.sizeType),
          height: _ratingSize(widget.sizeType),
        ),
      ),
    );
  }

  void _onRatingTap(double index) {
    if (widget.isDisabled) return;
    double newValue = index + 1;
    if (newValue < widget.minValue) newValue = widget.minValue;
    setState(() {
      value = newValue;
    });
    widget.onRatingUpdate?.call(value);
  }

  double _onRatingDrag(DragUpdateDetails details) {
    double newValue;
    double rawValue = details.localPosition.dx / _singleItemSize;

    double diff() {
      double value = (rawValue - rawValue.floor()) / 3 * 10;
      return value;
    }

    if (diff() < 1) {
      newValue = rawValue.floor().toDouble();
    } else if (diff() > 2 && diff() > 1) {
      newValue = rawValue.floor().toDouble() + 0.5;
    } else {
      newValue = rawValue.floor().toDouble();
    }

    if (newValue > widget.itemCount) newValue = widget.itemCount.toDouble();
    if (newValue < widget.minValue) newValue = widget.minValue;

    return newValue;
  }
}

/// [_ratingSize] is the function to get [double] for text size based on [ZeroSizeType]
double _ratingSize(ZeroSizeType size) {
  switch (size) {
    case ZeroSizeType.small:
      return 14.0;
    case ZeroSizeType.medium:
      return 20.0;
    case ZeroSizeType.large:
      return 26.0;
  }
}
