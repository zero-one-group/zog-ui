part of 'zero_speed_dial.dart';

/// [ZeroSpeedDialItem] is a class for creating speed dial item
class ZeroSpeedDialItem {
  final Text? tooltipText;
  final Widget child;
  final Function()? onTap;
  final Color? backgroundColor;
  const ZeroSpeedDialItem({
    this.tooltipText,
    required this.child,
    this.onTap,
    this.backgroundColor,
  });
}

class _SpeedDialItem extends StatelessWidget {
  final Text? tooltipText;
  final Widget child;
  final Function()? onTap;
  final double size;
  final FloatingActionButtonLocation location;
  final ZeroTooltipType type;
  final ZeroTooltipVariant variant;
  final ZeroTooltipPosition position;
  final Color tooltipBackgroundColor;
  final Color tooltipBorderColor;
  final Color backgroundColor;
  final ZeroSpeedDialDirection direction;
  final BorderRadius borderRadius;

  _SpeedDialItem({
    this.tooltipText,
    required this.child,
    this.onTap,
    this.size = 56,
    required this.location,
    this.variant = ZeroTooltipVariant.rectangle,
    required this.position,
    Color? tooltipBackgroundColor,
    Color? tooltipBorderColor,
    required this.backgroundColor,
    required this.type,
    required this.direction,
    required this.borderRadius,
  })  : tooltipBackgroundColor = tooltipBackgroundColor ?? type.backgroundColor,
        tooltipBorderColor = tooltipBorderColor ?? type.borderColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        InkWell(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          onTap: onTap,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              width: size,
              height: size,
              color: backgroundColor,
              child: Center(child: child),
            ),
          ),
        ),
        if (tooltipText != null)
          Positioned(
            right: direction == ZeroSpeedDialDirection.vertical
                ? location.isLeft()
                    ? null
                    : size * 1.2
                : null,
            left: direction == ZeroSpeedDialDirection.vertical
                ? location.isLeft()
                    ? size * 1.2
                    : null
                : null,
            top: direction == ZeroSpeedDialDirection.horizontal
                ? location.isTop()
                    ? size * 1.2
                    : null
                : null,
            bottom: direction == ZeroSpeedDialDirection.horizontal
                ? location.isTop()
                    ? null
                    : size * 1.2
                : null,
            child: CustomPaint(
              painter: variant.toPainter(
                backgroundColor: tooltipBackgroundColor,
                position: position,
                borderColor: tooltipBorderColor,
              ),
              child: Padding(
                padding: variant == ZeroTooltipVariant.rounded
                    ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                    : const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: DefaultTextStyle(
                  style: TextStyle(color: type.textColor),
                  child: Center(
                    child: variant == ZeroTooltipVariant.rounded
                        ? SizedBox(
                            width: 35,
                            child: tooltipText,
                          )
                        : tooltipText,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
