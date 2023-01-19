import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_ui_mobile/assets/assets.dart';
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

  /// The spacing between the items in the rating.
  /// The default value is 0.
  final double spacing;

  /// The initial value of the rating.
  /// The default value is 1.
  /// [initialValue] must be greater than or equal to [minValue] and less than or equal to [itemCount]
  final double initialValue;

  /// The callback function that is called when the rating is updated.
  /// The default value is null.
  /// The callback function will be called with the new rating value.
  final Function(double)? onRatingUpdate;

  /// The color of the active items in the rating.
  /// The default value is [ZeroColors.sunriseYellow6].
  final Color activeColor;

  /// The color of the inactive items in the rating.
  /// The default value is [ZeroColors.neutral6].
  final Color inactiveColor;

  /// Whether to disable the rating.
  /// The default value is false.
  /// If [isDisabled] is true, the rating will be disabled.
  final bool isDisabled;

  /// The size of the rating.
  /// The default value is [ZeroSizeType.medium].
  /// The size of the rating will be adjusted according to the [sizeType].
  /// There are 3 sizes available: [ZeroSizeType.small], [ZeroSizeType.medium], and [ZeroSizeType.large].
  final ZeroSizeType sizeType;

  @override
  State<ZeroRatingCustom> createState() => _ZeroRatingCustomState();
}

class _ZeroRatingCustomState extends State<ZeroRatingCustom> {
  /// [activeColor] defaults to [ZeroColors.sunriseYellow6] and then will be defined by [widget.activeColor] when state is initialized.
  Color activeColor = ZeroColors.sunriseYellow6;

  /// [inactiveColor] defaults to [ZeroColors.neutral6] and then will be defined by [widget.inactiveColor] when state is initialized.
  Color inactiveColor = ZeroColors.neutral6;

  /// [value] defaults to [widget.initialValue] and then will be defined by [_onRatingDrag] and [_onRatingTap] when state is initialized.
  double value = 0;

  /// [_onRatingDrag] is called when the user drags the rating.
  /// [_widgetKey] is used to get the size of the rating widget.
  final GlobalKey _widgetKey = GlobalKey();

  /// [_onRatingDrag] is called when the user drags the rating.
  /// [_widgetSize] is used to save size from [_widgetKey].
  Size _widgetSize = Size.zero;

  /// [_onRatingDrag] is called when the user drags the rating.
  /// [_singleItemSize] is used to save the size of a single item in the rating.
  /// The size of a single item is calculated by dividing the size of the rating widget by the number of items in the rating.
  double _singleItemSize = 0;

  /// [assets] is list of assets for rating.
  /// default value will be defined in [initState].
  final List<String> assets = [];

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    activeColor = widget.isDisabled ? widget.activeColor.withOpacity(0.5) : widget.activeColor;
    inactiveColor = widget.isDisabled ? widget.inactiveColor.withOpacity(0.5) : widget.inactiveColor;
    assets.addAll([
      Assets.icons.ratingCustom1,
      Assets.icons.ratingCustom2,
      Assets.icons.ratingCustom3,
      Assets.icons.ratingCustom4,
      Assets.icons.ratingCustom5,
    ]);
    Assets.icons;
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

  /// [_onRatingDrag] is called when the user drags the rating.
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
