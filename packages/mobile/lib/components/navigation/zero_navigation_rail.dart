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

  final List<ZeroNavigationRailItem> items;
  final Widget? leading;
  final Widget? action;
  final ValueChanged<int>? onTap;
  final ZeroNavigationRailType type;
  final int activeIndex;
  final ZeroNavigationRailStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // TODO: implment dynamic theme
      width: 72,
      height: double.infinity,
      child: Material(
        color: Colors.white,
        elevation: 0,
        child: IconTheme(
          data: const IconThemeData(size: 16),
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
              const SizedBox(height: 64),
              for (int i = 0; i < items.length; i++) ...[
                Builder(builder: (context) {
                  final isActive = i == activeIndex;
                  final item = items[i];
                  return _Segment(
                    icon: isActive ? item.activeIcon ?? item.icon : item.icon,
                    isActive: isActive,
                    color: context.theme.primaryColor,
                    indicatorColor: Colors.transparent,
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
    this.color,
    this.indicatorColor,
    required this.type,
    this.label,
  });

  final Widget icon;
  final bool isActive;
  final VoidCallback? onTap;
  final Color? color;
  final Color? indicatorColor;
  final ZeroNavigationRailType type;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    // TODO: @wisnu change to dynamic border radius
    final borderRadius = BorderRadius.circular(8);

    // TODO: from dynamic style
    final defaultStyle =
        context.theme.typography.caption ?? const TextStyle(fontSize: 10);

    final isActiveLabel = type == ZeroNavigationRailType.iconLabel ||
        (type == ZeroNavigationRailType.iconLabelOnActive && isActive);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Ink(
              decoration: BoxDecoration(
                color: isActive ? color : null,
                borderRadius: borderRadius,
              ),
              // TODO: @wisnu
              padding: const EdgeInsets.all(12),
              child: icon,
            ),
          ),
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: defaultStyle,
            child: isActiveLabel ? label ?? const SizedBox() : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
