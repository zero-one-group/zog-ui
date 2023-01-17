import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

import '../../colors/zero_colors.dart';

class ZeroRatingCustom extends StatefulWidget {
  const ZeroRatingCustom({
    super.key,
    this.spacing = 0,
    this.initialValue = 1,
    this.onRatingUpdate,
    this.activeColor = ZeroColors.sunriseYellow6,
    this.inactiveColor = ZeroColors.neutral6,
    this.isDisabled = false,
    this.sizeType = ZeroSizeType.medium,
  })  : assert(initialValue >= 0),
        assert(initialValue <= 5);
  final double spacing;
  final double initialValue;
  final Function(double)? onRatingUpdate;
  final Color activeColor;
  final Color inactiveColor;
  final bool isDisabled;
  final ZeroSizeType sizeType;

  @override
  State<ZeroRatingCustom> createState() => _ZeroRatingCustomState();
}

class _ZeroRatingCustomState extends State<ZeroRatingCustom> {
  Color activeColor = ZeroColors.sunriseYellow6;
  Color inactiveColor = ZeroColors.neutral6;
  double value = 0;

  final GlobalKey _widgetKey = GlobalKey();
  Size _widgetSize = Size.zero;
  double _singleItemSize = 0;

  final List<String> assets = [];

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    activeColor = widget.isDisabled ? widget.activeColor.withOpacity(0.5) : widget.activeColor;
    inactiveColor = widget.isDisabled ? widget.inactiveColor.withOpacity(0.5) : widget.inactiveColor;
    assets.addAll([
      'assets/icons/rating_custom1.svg',
      'assets/icons/rating_custom2.svg',
      'assets/icons/rating_custom3.svg',
      'assets/icons/rating_custom4.svg',
      'assets/icons/rating_custom5.svg',
    ]);
  }

  @override
  void didUpdateWidget(covariant ZeroRatingCustom oldWidget) {
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
          _singleItemSize = _widgetSize.width / assets.length;
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
          children: assets.map((asset) {
            return InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                if (!widget.isDisabled) {
                  setState(() {
                    value = assets.indexOf(asset) + 1;
                  });
                  widget.onRatingUpdate?.call(value);
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: widget.spacing),
                child: SvgPicture.asset(
                  asset,
                  package: 'zero_ui_mobile',
                  color: value == assets.indexOf(asset) + 1 ? activeColor : inactiveColor,
                  width: _ratingSize(widget.sizeType),
                  height: _ratingSize(widget.sizeType),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  double _onRatingDrag(DragUpdateDetails details) {
    double newValue;
    double rawValue = details.localPosition.dx / _singleItemSize;

    double diff() {
      double value = (rawValue - rawValue.floor()) / 3 * 10;
      return value;
    }

    if (diff() < 1) {
      newValue = rawValue.round().toDouble();
    } else {
      newValue = rawValue.round().toDouble();
    }

    if (newValue > assets.length) newValue = assets.length.toDouble();
    if (newValue < 1) newValue = 1;

    return newValue;
  }
}

/// [_ratingSize] is the function to get [double] for text size based on [ZeroSizeType]
double _ratingSize(ZeroSizeType size) {
  switch (size) {
    case ZeroSizeType.small:
      return 20.0;
    case ZeroSizeType.medium:
      return 26.0;
    case ZeroSizeType.large:
      return 32.0;
  }
}
