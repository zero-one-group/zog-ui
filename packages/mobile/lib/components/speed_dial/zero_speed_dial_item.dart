part of 'zero_speed_dial.dart';

/// [ZeroSpeedDialItem] is a class for creating speed dial item
class ZeroSpeedDialItem {
  final Text? tooltipText;
  final Widget child;
  final VoidCallback? onTap;
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
  final VoidCallback? onTap;
  final double size;
  final FloatingActionButtonLocation location;
  final Brightness? tooltipBrightness;
  final ZeroTooltipVariant variant;
  final ZeroTooltipPosition position;
  final ZeroTooltipStyle? tooltipStyle;
  final Color backgroundColor;
  final ZeroSpeedDialDirection direction;
  final BorderRadius borderRadius;

  const _SpeedDialItem({
    this.tooltipText,
    required this.child,
    this.onTap,
    this.size = 56,
    required this.location,
    this.variant = ZeroTooltipVariant.rectangle,
    required this.position,
    this.tooltipBrightness,
    required this.direction,
    required this.borderRadius,
    required this.backgroundColor,
    this.tooltipStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeTooltipStyle = theme.tooltipStyle.merge(tooltipStyle);
    final tooltipBackgroundColor = themeTooltipStyle.backgroundColor ??
        (theme.brightness.isDark == true
            ? themeTooltipStyle.darkBackgroundColor
            : themeTooltipStyle.lightBackgroundColor);

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
                backgroundColor: tooltipBackgroundColor ?? Colors.transparent,
                position: position,
                borderColor:
                    themeTooltipStyle.borderColor ?? Colors.transparent,
              ),
              child: Padding(
                padding: variant == ZeroTooltipVariant.rounded
                    ? const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                    : const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: DefaultTextStyle(
                  style: DefaultTextStyle.of(context)
                      .style
                      .merge(themeTooltipStyle.textStyle),
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
