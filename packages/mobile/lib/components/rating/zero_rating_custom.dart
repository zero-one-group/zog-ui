import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zero_ui_mobile/assets/assets.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

import '../../colors/zero_colors.dart';

class ZeroRatingCustom extends StatefulWidget {
  ZeroRatingCustom({
    super.key,
    this.spacing = 0,
    this.initialValue = 1,
    this.onRatingUpdate,
    this.activeColor,
    this.inactiveColor,
    this.isDisabled = false,
    this.sizeType = ZeroSizeType.medium,
    List<Widget> listItems = const [],
  })  : assert(initialValue >= 0),
        assert(initialValue <= 5),
        listItems = listItems.isEmpty
            ? [
                SvgPicture.asset(
                  Assets.icons.ratingCustom1,
                  width: _ratingSize(sizeType),
                  height: _ratingSize(sizeType),
                  package: 'zero_ui_mobile',
                ),
                SvgPicture.asset(
                  Assets.icons.ratingCustom2,
                  width: _ratingSize(sizeType),
                  height: _ratingSize(sizeType),
                  package: 'zero_ui_mobile',
                ),
                SvgPicture.asset(
                  Assets.icons.ratingCustom3,
                  width: _ratingSize(sizeType),
                  height: _ratingSize(sizeType),
                  package: 'zero_ui_mobile',
                ),
                SvgPicture.asset(
                  Assets.icons.ratingCustom4,
                  width: _ratingSize(sizeType),
                  height: _ratingSize(sizeType),
                  package: 'zero_ui_mobile',
                ),
                SvgPicture.asset(
                  Assets.icons.ratingCustom5,
                  width: _ratingSize(sizeType),
                  height: _ratingSize(sizeType),
                  package: 'zero_ui_mobile',
                ),
              ]
            : listItems;

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
  final Color? activeColor;

  /// The color of the inactive items in the rating.
  /// The default value is [ZeroColors.neutral6].
  final Color? inactiveColor;

  /// Whether to disable the rating.
  /// The default value is false.
  /// If [isDisabled] is true, the rating will be disabled.
  final bool isDisabled;

  /// The size of the rating.
  /// The default value is [ZeroSizeType.medium].
  /// The size of the rating will be adjusted according to the [sizeType].
  /// There are 3 sizes available: [ZeroSizeType.small], [ZeroSizeType.medium], and [ZeroSizeType.large].
  final ZeroSizeType sizeType;

  /// [listItems] is used to define the items ([icons, image, or svg]) in the rating.
  final List<Widget> listItems;

  @override
  State<ZeroRatingCustom> createState() => _ZeroRatingCustomState();
}

class _ZeroRatingCustomState extends State<ZeroRatingCustom> {
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

  /// [index] is used to save the index of the item that is currently being dragged.
  int index = 0;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    index = widget.initialValue.toInt() - 1;
  }

  @override
  void didUpdateWidget(covariant ZeroRatingCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
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
          _singleItemSize = _widgetSize.width / widget.listItems.length;
        },
        onHorizontalDragUpdate: (details) {
          if (widget.isDisabled) return;
          widget.onRatingUpdate?.call(_onRatingDrag(details));
          setState(() {
            index = _onRatingDrag(details).floor() - 1;
          });
        },
        child: Row(
          key: _widgetKey,
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < widget.listItems.length; i++)
              InkWell(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  if (!widget.isDisabled) {
                    setState(() {
                      index = i;
                    });
                    widget.onRatingUpdate?.call(value);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: widget.spacing),
                  child: index == i
                      ? !widget.isDisabled
                          ? widget.activeColor == null
                              ? widget.listItems[i]
                              : ColorFiltered(
                                  colorFilter: ColorFilter.mode(widget.activeColor!, BlendMode.srcIn),
                                  child: widget.listItems[i],
                                )
                          : ColorFiltered(
                              colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcIn),
                              child: widget.listItems[i],
                            )
                      : !widget.isDisabled
                          ? widget.inactiveColor == null
                              ? widget.listItems[i]
                              : ColorFiltered(
                                  colorFilter: ColorFilter.mode(widget.inactiveColor!, BlendMode.srcIn),
                                  child: widget.listItems[i],
                                )
                          : ColorFiltered(
                              colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcIn),
                              child: widget.listItems[i],
                            ),
                ),
              )
          ],
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

    if (newValue > widget.listItems.length) newValue = widget.listItems.length.toDouble();
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
