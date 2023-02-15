import 'package:flutter/material.dart';

import '../../zero_ui_mobile.dart';

const double _kIndicatorOvalHeight = 32;
const double _kIndicatorCircleSize = 48;
const double _kHeight = 79;

extension on ZeroNavigationBarIndicatorType {
  double get size {
    switch (this) {
      case ZeroNavigationBarIndicatorType.oval:
        return _kIndicatorOvalHeight;
      case ZeroNavigationBarIndicatorType.circle:
        return _kIndicatorCircleSize;
    }
  }

  double get indicatorPadding {
    switch (this) {
      case ZeroNavigationBarIndicatorType.oval:
        return 0;
      case ZeroNavigationBarIndicatorType.circle:
        return 16;
    }
  }
}

class ZeroNavigationBar extends StatelessWidget {
  const ZeroNavigationBar({
    super.key,
    required this.items,
    this.activeIndex,
    this.onTap,
    this.style,
    this.type = ZeroNavigationBarType.iconLabel,
  }) : assert(items.length > 2, 'Items must be more than 2 item');

  /// The list of [ZeroNavigationBarItem] in this [ZeroNavigationBar]
  ///
  /// This [items] length must more than 2
  final List<ZeroNavigationBarItem> items;

  /// Determine which one of the [items] is currently selected/active
  ///
  /// When this updated, the destination from [items] at [activeIndex] goes from unselected to selected.
  final int? activeIndex;

  /// Called when one of the [items] is selected
  ///
  /// This callback usually upadtes the int passed to [activeIndex]
  final ValueChanged<int>? onTap;

  /// The style of the [ZeroNavigationBar]
  final ZeroNavigationBarStyle? style;
  final ZeroNavigationBarType type;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.navigationBarStyle;
    final adaptiveStyle = theme.merge(style);

    return Material(
      color: adaptiveStyle.backgroundColor ?? Colors.white,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: (adaptiveStyle.height ?? _kHeight) +
              (adaptiveStyle.indicatorType?.indicatorPadding ?? 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                for (int i = 0; i < items.length; i++) ...[
                  Builder(builder: (context) {
                    final item = items[i];
                    final active = i == activeIndex;

                    return _Segment(
                      icon: active ? item.activeIcon ?? item.icon : item.icon,
                      isActive: active,
                      color: active
                          ? adaptiveStyle.selectedColor
                          : adaptiveStyle.unselectedColor,
                      label: type == ZeroNavigationBarType.iconLabelOnActive &&
                              !active
                          ? ''
                          : item.label,
                      indicatorColor: adaptiveStyle.indicatorColor ??
                          context.theme.primaryColor.lighter,
                      indicatorType: adaptiveStyle.indicatorType ??
                          ZeroNavigationBarIndicatorType.oval,
                      onTap: () {
                        onTap?.call(i);
                      },
                    );
                  }),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class ZeroNavigationBarItem {
  const ZeroNavigationBarItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });

  final Widget icon;
  final Widget? activeIcon;
  final String? label;
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.icon,
    required this.isActive,
    this.label,
    this.onTap,
    this.color,
    required this.indicatorColor,
    required this.indicatorType,
  });

  final Widget icon;
  final String? label;
  final bool isActive;
  final VoidCallback? onTap;
  final Color? color;
  final Color indicatorColor;
  final ZeroNavigationBarIndicatorType indicatorType;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: _IndicatorInkWell(
          onTap: onTap,
          borderRadius: indicatorType.isCircle
              ? BorderRadius.circular(indicatorType.size)
              : borderRadius,
          indicatorType: indicatorType,
          child: Semantics(
            container: true,
            selected: isActive,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: indicatorType.size,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        _IndicatorDecoration(
                          color: indicatorColor,
                          borderRadius: borderRadius,
                          type: indicatorType,
                          isActive: isActive,
                        ),
                        IconTheme(
                          data: IconThemeData(
                            color: color,
                            size: 24,
                          ),
                          child: icon,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  ZeroText.body1(
                    label ?? '',
                    style: TextStyle(fontSize: 12, color: color),
                    maxLine: 1,
                    align: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IndicatorDecoration extends StatelessWidget {
  const _IndicatorDecoration({
    required this.type,
    required this.isActive,
    required this.color,
    required this.borderRadius,
  });

  final ZeroNavigationBarIndicatorType type;
  final bool isActive;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    if (!isActive) return SizedBox(height: type.size);

    if (type.isOval) {
      return Ink(
        width: double.infinity,
        height: type.size,
        padding: EdgeInsets.zero,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          color: color,
        ),
      );
    }

    return Ink(
      width: type.size,
      height: type.size,
      padding: EdgeInsets.zero,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(type.size),
        ),
        color: color,
      ),
    );
  }
}

class _IndicatorInkWell extends InkResponse {
  const _IndicatorInkWell({
    super.child,
    super.onTap,
    super.borderRadius,
    required this.indicatorType,
  }) : super(
          containedInkWell: true,
          highlightColor: Colors.transparent,
        );

  final ZeroNavigationBarIndicatorType indicatorType;

  @override
  RectCallback? getRectCallback(RenderBox referenceBox) {
    final isCircle = indicatorType.isCircle;

    final double indicatorOffsetX = referenceBox.size.width / 2;
    final double indicatorOffsetY = isCircle ? 35 : 29.0;

    return () {
      return Rect.fromCenter(
        center: Offset(indicatorOffsetX, indicatorOffsetY),
        height: indicatorType.size,
        width: isCircle ? indicatorType.size : referenceBox.size.width,
      );
    };
  }
}
