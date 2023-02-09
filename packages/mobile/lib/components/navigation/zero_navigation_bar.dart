import 'package:flutter/material.dart';

import '../../zero_ui_mobile.dart';

const double _kIndicatorHeight = 32;
const double _kHeight = 79;

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

  /// Called when one of the [ietms] is selcted
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
          height: adaptiveStyle.height ?? _kHeight,
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
  });

  final Widget icon;
  final String? label;
  final bool isActive;
  final VoidCallback? onTap;
  final Color? color;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: _IndicatorInkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Semantics(
            container: true,
            selected: isActive,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: _kIndicatorHeight,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        isActive
                            ? Ink(
                                width: double.infinity,
                                height: _kIndicatorHeight,
                                padding: EdgeInsets.zero,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: borderRadius,
                                  ),
                                  color: indicatorColor,
                                ),
                              )
                            : const SizedBox(height: _kIndicatorHeight),
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

class _IndicatorInkWell extends InkResponse {
  const _IndicatorInkWell({
    super.child,
    super.onTap,
    super.borderRadius,
  }) : super(
          containedInkWell: true,
          highlightColor: Colors.transparent,
        );

  @override
  RectCallback? getRectCallback(RenderBox referenceBox) {
    final double indicatorOffsetX = referenceBox.size.width / 2;
    const double indicatorOffsetY = 30.0;

    return () {
      return Rect.fromCenter(
        center: Offset(indicatorOffsetX, indicatorOffsetY),
        height: _kIndicatorHeight,
        width: referenceBox.size.width,
      );
    };
  }
}
