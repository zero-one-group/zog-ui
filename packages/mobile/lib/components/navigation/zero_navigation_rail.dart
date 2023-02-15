import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroNavigationRail extends StatelessWidget {
  const ZeroNavigationRail({
    super.key,
    required this.items,
    this.leading,
    this.action,
    this.type = ZeroNavigationRailType.iconLabel,
    this.onTap,
    this.activeIndex = 0,
    this.style,
  });

  /// The list of [ZeroNavigationRailItem] in this [ZeroNavigationRail]
  final List<ZeroNavigationRailItem> items;

  /// Leading action
  ///
  /// This wiget position in the first top of navigation rail
  ///
  /// Usually leading is menu button/back button
  final Widget? leading;

  /// Action button for this [ZeroNavigationRail]
  ///
  /// Usually [action] is a floating button or [ZeroButtonIcon]
  final Widget? action;

  /// Called when one of the [items] is selected
  ///
  /// This callback usually upadtes the int passed to [activeIndex]
  final ValueChanged<int>? onTap;

  final ZeroNavigationRailType type;

  /// Determine which one of the [items] is currently selected/active
  ///
  /// When this updated, the destination from [items] at [activeIndex] goes from unselected to selected.

  final int activeIndex;
  final ZeroNavigationRailStyle? style;

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.navigationRailStyle;
    final adaptiveStyle = themeStyle.merge(style);

    return SizedBox(
      width: adaptiveStyle.width,
      height: double.infinity,
      child: Material(
        color: adaptiveStyle.backgroundColor,
        elevation: 0,
        child: IconTheme(
          data: const IconThemeData(size: 16),
          child: Column(
            children: [
              Ink(
                color: adaptiveStyle.backgroundColor,
                child: Column(
                  children: [
                    if (leading != null) ...[
                      const SizedBox(height: 24),
                      leading!,
                    ],
                    if (action != null) ...[
                      const SizedBox(height: 24),
                      action!,
                    ],
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ClipRRect(
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        for (int i = 0; i < items.length; i++) ...[
                          Builder(builder: (context) {
                            final isActive = i == activeIndex;
                            final item = items[i];
                            return _Segment(
                              icon: isActive
                                  ? item.activeIcon ?? item.icon
                                  : item.icon,
                              isActive: isActive,
                              style: adaptiveStyle,
                              type: type,
                              label: item.label,
                              onTap: onTap != null
                                  ? () {
                                      onTap?.call(i);
                                    }
                                  : null,
                            );
                          }),
                          const SizedBox(height: 16),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class ZeroNavigationRailItem {
  final Widget icon;
  final Widget? activeIcon;
  final Widget label;
  final bool disabled;

  const ZeroNavigationRailItem({
    required this.icon,
    this.activeIcon,
    required this.label,
    this.disabled = false,
  });
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.icon,
    required this.isActive,
    this.onTap,
    required this.style,
    required this.type,
    this.label,
  });

  final Widget icon;
  final bool isActive;
  final VoidCallback? onTap;
  final ZeroNavigationRailStyle style;
  final ZeroNavigationRailType type;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = style.labelStyle ??
        context.theme.typography.caption ??
        const TextStyle(fontSize: 10);

    final isActiveLabel = type == ZeroNavigationRailType.iconLabel ||
        (type == ZeroNavigationRailType.iconLabelOnActive && isActive);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: style.indicatorBorderRadius,
            child: Material(
              color: isActive ? style.indicatorColor : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: style.indicatorBorderRadius ?? BorderRadius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: IconTheme(
                  data: IconThemeData(
                    size: 16,
                    color: isActive ? style.activeColor : style.inactiveColor,
                  ),
                  child: icon,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: defaultStyle.copyWith(
              color: style.inactiveColor,
            ),
            child: isActiveLabel
                ? label ?? SizedBox(height: defaultStyle.fontSize)
                : SizedBox(height: defaultStyle.fontSize),
          ),
        ],
      ),
    );
  }
}
