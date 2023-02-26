import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// A rating component that allows users to rate something.
///
/// The rating component is used to rate something. It can be used to rate a product, a service, a movie, a book, etc.
/// The icons of the rating use stars, you can edit the color of the stars and the number of stars.
class ZeroRating extends StatefulWidget {
  const ZeroRating({
    super.key,
    this.itemCount = 5,
    this.initialValue = 1,
    this.minValue = 0,
    this.allowHalfRating = true,
    this.onRatingUpdate,
    this.isDisabled = false,
    this.sizeType = ZeroSizeType.medium,
    this.ratingWidget,
    this.style,
  })  : assert(itemCount > 0),
        assert(initialValue >= minValue),
        assert(initialValue <= itemCount),
        assert(minValue >= 0),
        assert(minValue <= itemCount);

  /// The number of items in the rating.
  /// The default value is 5.
  /// The minimum value is 0.
  final int itemCount;

  /// The initial value of the rating.
  /// The default value is 1.
  /// [initialValue] must be greater than or equal to [minValue] and less than or equal to [itemCount]
  final double initialValue;

  /// The minimum value of the rating.
  /// The default value is 0.
  /// [minValue] must be greater than or equal to 0 and less than or equal to [itemCount]
  final double minValue;

  /// Whether to allow half ratings.
  /// The default value is true.
  /// If [allowHalfRating] is true, the rating will be rounded to the nearest half.
  /// If [allowHalfRating] is false, the rating will be rounded to the nearest whole number.
  final bool allowHalfRating;

  /// The callback function that is called when the rating is updated.
  /// The default value is null.
  /// The callback function will be called with the new rating value.
  final ValueChanged<double>? onRatingUpdate;

  /// The style of rating.
  final ZeroRatingStyle? style;

  /// Whether the rating is disabled.
  /// The default value is false.
  /// If [isDisabled] is true, the rating will be disabled and the user will not be able to interact with it.
  final bool isDisabled;

  /// The size of the rating.
  /// The default value is [ZeroSizeType.medium].
  /// The size of the rating is determined by the [sizeType].
  /// There are 3 sizes available: [ZeroSizeType.small], [ZeroSizeType.medium], and [ZeroSizeType.large].
  final ZeroSizeType sizeType;

  /// for customizing the icons of the rating.
  final RatingWidget? ratingWidget;

  @override
  State<ZeroRating> createState() => _ZeroRatingState();
}

class _ZeroRatingState extends State<ZeroRating> {
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

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.ratingStyle;
    final adaptiveStyle = themeStyle.merge(widget.style);

    final activeColor = widget.isDisabled
        ? adaptiveStyle.activeColor?.withOpacity(0.5)
        : adaptiveStyle.activeColor;
    final inactiveColor = widget.isDisabled
        ? adaptiveStyle.inactiveColor?.withOpacity(0.5)
        : adaptiveStyle.inactiveColor;

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
            for (double i = 0; i < widget.itemCount; i++) ...[
              if (widget.allowHalfRating &&
                  i == value.floor() &&
                  value % 1 != 0)
                _starHalf(
                  style: adaptiveStyle,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                )
              else if (i < value)
                _starFull(i,
                    activeColor: activeColor, inactiveColor: inactiveColor)
              else
                _starOutlined(
                  i,
                  activeColor: activeColor,
                  inactiveColor: inactiveColor,
                ),
              if (i < widget.itemCount - 1)
                SizedBox(width: adaptiveStyle.spacing ?? 0)
            ]
          ],
        ),
      ),
    );
  }

  /// [_starHalf] is used to render a half star.
  /// [_starHalf] is called when [widget.allowHalfRating] is true and the rating is a half number.
  Widget _starHalf({
    required ZeroRatingStyle style,
    Color? activeColor,
    Color? inactiveColor,
  }) {
    final size = _ratingSize(widget.sizeType);
    return IconTheme(
      data: IconThemeData(
        size: size,
        color: activeColor,
      ),
      child: widget.ratingWidget?.half ??
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect rect) {
              return LinearGradient(
                stops: const [0, 0.5, 0.5],
                colors: [
                  activeColor ?? Colors.transparent,
                  activeColor ?? Colors.transparent,
                  Colors.transparent
                ],
              ).createShader(rect);
            },
            child: Builder(
              builder: (context) {
                final halfWidth = _ratingSize(widget.sizeType) / 2;

                return SizedBox(
                  width: size,
                  height: size,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          width: halfWidth,
                          height: size,
                          child: Stack(
                            fit: StackFit.loose,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              Positioned(
                                left: -halfWidth,
                                top: 0,
                                bottom: 0,
                                child: Icon(
                                  ZeroIcons.star,
                                  color: inactiveColor,
                                  size: size,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: halfWidth,
                          height: size,
                          child: Stack(
                            fit: StackFit.loose,
                            clipBehavior: Clip.antiAlias,
                            children: [
                              Positioned(
                                right: -halfWidth,
                                top: 0,
                                bottom: 0,
                                child: Icon(
                                  ZeroIcons.starFilled,
                                  color: inactiveColor,
                                  size: size,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
    );
  }

  /// [_starFull] is used to display the rating when the user has rated.
  Widget _starFull(
    double index, {
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => _onRatingTap(index),
      child: IconTheme(
        data: IconThemeData(
          size: _ratingSize(widget.sizeType),
          color: activeColor,
        ),
        child: widget.ratingWidget?.full ?? const Icon(ZeroIcons.starFilled),
      ),
    );
  }

  /// [_starOutlined] is used to display the rating when the user has not yet rated.
  Widget _starOutlined(
    double index, {
    Color? activeColor,
    Color? inactiveColor,
  }) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () => _onRatingTap(index),
      child: IconTheme(
        data: IconThemeData(
          size: _ratingSize(widget.sizeType),
          color: inactiveColor,
        ),
        child: SizedBox(
          child: widget.ratingWidget?.empty ?? const Icon(ZeroIcons.star),
        ),
      ),
    );
  }

  /// [_onRatingTap] is called when the user taps the rating.
  /// [_onRatingTap] is used to calculate the value of the rating based on the position of the user's finger.
  /// [_onRatingTap] returns a [double] value.
  void _onRatingTap(double index) {
    if (widget.isDisabled) return;
    double newValue = index + 1;
    if (newValue < widget.minValue) newValue = widget.minValue;
    setState(() {
      value = newValue;
    });
    widget.onRatingUpdate?.call(value);
  }

  /// [_onRatingDrag] is called when the user drags the rating.
  /// [_onRatingDrag] is used to calculate the value of the rating based on the position of the user's finger.
  /// [_onRatingDrag] returns a [double] value.
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

class RatingWidget {
  final Widget full;
  final Widget half;
  final Widget empty;

  RatingWidget({
    required this.full,
    required this.half,
    required this.empty,
  });
}
