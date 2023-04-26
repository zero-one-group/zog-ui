import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

const kZeroTabBarDefaultHeight = 46.0;

class ZeroTabBar extends StatelessWidget {
  const ZeroTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
    this.physics,
    this.style,
  });

  /// The list of [ZeroTab] in this [ZeroTabBar]
  final List<ZeroTab> tabs;

  final TabController? controller;

  /// An optional callback that's called when the [ZeroTabBar] is tapped.
  ///
  /// The callback is applied to the index of the tab where the tap occurred.
  final ValueChanged<int>? onTap;

  /// How the [ZeroTabBar]'s scroll view should respond to user input.
  ///
  /// By default style is [BouncingScrollPhysics]
  final ScrollPhysics? physics;

  /// To set style for this widget, by default all styles override global styles
  final ZeroTabBarStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeStyle = theme.tabBarStyle;
    final adaptiveStyle = themeStyle.merge(style);

    return Ink(
      color: adaptiveStyle.backgroundColor,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: ZeroTheme(
          data: theme.copyWith(
            tabBarStyle: adaptiveStyle,
          ),
          child: TabBar(
            controller: controller,
            dividerColor: Colors.transparent,
            unselectedLabelColor: adaptiveStyle.inactiveColor,
            labelColor: adaptiveStyle.activeColor,
            labelPadding: style?.labelPadding,
            indicator: UnderlineTabIndicator(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3.0),
                topRight: Radius.circular(3.0),
              ),
              borderSide: BorderSide(
                color: adaptiveStyle.indicatorColor ?? theme.primaryColor,
                width: 2,
              ),
            ),
            isScrollable: style?.isScrollable ?? false,
            onTap: onTap,
            physics: physics ?? const BouncingScrollPhysics(),
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}

class ZeroTab extends StatelessWidget implements PreferredSizeWidget {
  const ZeroTab({
    Key? key,
    this.label,
    this.icon,
    this.height,
  })  : assert(label != null || icon != null),
        super(key: key);

  /// The label/text to display as the tab's
  final Widget? label;

  /// An icon to display as the tab's
  final Widget? icon;

  /// The height of the [ZeroTab]
  final double? height;

  @override
  Widget build(BuildContext context) {
    final style = context.theme.tabBarStyle;
    final isScrollable = style.isScrollable;

    Widget buildPadding(Widget? child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: child,
        );

    final labelWidget = DefaultTextStyle(
      style: DefaultTextStyle.of(context).style.merge(style.labelStyle),
      softWrap: true,
      overflow: TextOverflow.fade,
      maxLines: 1,
      child: buildPadding(label),
    );

    return SizedBox(
      height: height,
      child: Center(
        widthFactor: 1,
        child: Padding(
          padding: style.padding ?? const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconTheme(
                data: IconTheme.of(context)
                    .merge(IconThemeData(size: style.iconSize)),
                child: buildPadding(icon),
              ),
              isScrollable ? labelWidget : Expanded(child: labelWidget),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    if (height != null) return Size.fromHeight(height!);

    return const Size.fromHeight(kZeroTabBarDefaultHeight);
  }
}
