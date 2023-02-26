import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

part 'header.dart';
part 'section.dart';

class ZeroNavigationDrawer extends StatelessWidget {
  const ZeroNavigationDrawer({
    super.key,
    this.header,
    this.children = const <Widget>[],
    this.style,
  });

  /// Header of [ZeroNavigationDrawer]
  ///
  /// The [header] position is in the top of drawer
  ///
  /// Usually [header] use [ZeroNavigationDrawerHeader] widget
  final Widget? header;

  /// Drawer menu sections
  ///
  /// Usually [children] use [ZeroNavigationDrawerSection] widget
  final List<Widget> children;

  /// Allow to customize the style of [ZeroNavigationDrawer]
  ///
  /// If set style, it will be override from global theme
  final ZeroNavigationDrawerStyle? style;

  @override
  Widget build(BuildContext context) {
    // global theme
    final themeStyle = context.theme.navigationDrawerStyle;

    // Merge style global with paramter style
    final adaptiveStyle = themeStyle.merge(style);

    return ZeroTheme(
      data: context.theme.copyWith(navigationDrawerStyle: adaptiveStyle),
      child: Semantics(
        scopesRoute: true,
        namesRoute: true,
        explicitChildNodes: true,
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: adaptiveStyle.width),
          child: Material(
            color: adaptiveStyle.backgroundColor,
            elevation: 0,
            shape: adaptiveStyle.shape,
            child: SafeArea(
              left: false,
              right: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Build header widget, if null build empty widget [SizedBox]
                  header ?? const SizedBox.shrink(),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        for (int i = 0; i < children.length; i++) ...[
                          children[i],
                          if (i != children.length - 1) ...[
                            // Set separator each section
                            adaptiveStyle.separatorDrawer == true
                                ? const ZeroDivider.horizontal(
                                    style: ZeroDividerStyle(
                                      startInset: 28,
                                      endInset: 12,
                                    ),
                                    variant: ZeroDividerVariant.middleInset,
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(height: 8),
                          ],
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
