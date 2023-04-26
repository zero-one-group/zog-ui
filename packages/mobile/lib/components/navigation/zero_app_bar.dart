import 'dart:math' show min;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zog_ui/zog_ui.dart';

/// Class for calculating [ZeroAppBar] size
class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? 64) + (bottomHeight ?? 0));

  /// Height of toolbar body
  final double? toolbarHeight;

  /// Additional height bottom of app bar
  final double? bottomHeight;
}

class ZeroAppBar extends StatelessWidget implements PreferredSizeWidget {
  ZeroAppBar({
    super.key,
    this.size = ZeroAppBarSize.small,
    this.automaticallyImplyLeading = true,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.style,
  }) : preferredSize = _PreferredAppBarSize(
            style?.height ?? size.getSize, bottom?.preferredSize.height);

  /// Size of [ZeroAppBar]
  ///
  /// Size can be effect the interface of the appbar, especially [title] positioned
  ///
  /// By default [size] is [ZeroAppBarSize.small]
  final ZeroAppBarSize size;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is an [Icon] or an [IconButton].
  final Widget? leading;

  /// A list of Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  /// For less common operations, consider using a [PopupMenuButton] as the
  /// last action.
  final List<Widget>? actions;

  /// The primary widget displayed in the app bar.
  /// Typically a [Text] widget that contains a description of the current
  /// contents of the app.
  final Widget? title;

  /// This widget appears across the bottom of the app bar.
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  final PreferredSizeWidget? bottom;

  /// Allow to customize style for this [ZeroAppBar]
  ///
  /// By default style from [ZeroThemeData.appBarStyle]
  ///
  /// If you set style, it will be override from global style
  final ZeroAppBarStyle? style;

  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  /// {@endtemplate}
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    // getting theme from global
    final theme = context.theme;
    // global theme of appbarStyle
    final themeStyle = theme.appBarStyle;
    // merge/combine style global with parameter style
    final adaptiveStyle = themeStyle.merge(style);

    // get height of appbar
    final height = preferredSize.height;

    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: adaptiveStyle.statusBarBrightness,
    );

    final isNoLeading = !_checkHasLeading(
          context: context,
          automaticallyImplyLeading: automaticallyImplyLeading,
        ) &&
        leading == null;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Semantics(
          excludeSemantics: true,
          child: Material(
            color: adaptiveStyle.backgroundColor,
            elevation: adaptiveStyle.elevation ?? 0,
            shadowColor: adaptiveStyle.shadowColor,
            child: SafeArea(
              left: false,
              right: false,
              bottom: false,
              child: SizedBox(
                height: height,
                child: IconTheme(
                  data: IconThemeData(
                    size: 24,
                    color: adaptiveStyle.foregroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: min(
                          min(ZeroAppBarSize.small.getSize, size.getSize),
                          height,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              // Build leading
                              _Leading(
                                automaticallyImplyLeading:
                                    automaticallyImplyLeading,
                                leading: leading,
                              ),

                              // Build spacing based on conditions
                              if (isNoLeading)
                                SizedBox(
                                  width: adaptiveStyle.titleSpacing ?? 16,
                                )
                              else if (adaptiveStyle.centerTitle == true)
                                const SizedBox.shrink()
                              else
                                SizedBox(
                                  width: adaptiveStyle.titleSpacing ?? 32,
                                ),

                              // Build title small size
                              Expanded(
                                child: size == ZeroAppBarSize.small
                                    ? _Title(
                                        style: adaptiveStyle,
                                        title: title,
                                      )
                                    : const SizedBox.shrink(),
                              ),

                              // Build actions
                              Row(
                                children: actions ??
                                    (adaptiveStyle.centerTitle == true
                                        ? [
                                            SizedBox.square(
                                                dimension:
                                                    isNoLeading ? 16 : 48)
                                          ]
                                        : []),
                              )
                            ],
                          ),
                        ),
                      ),

                      // Build title when size is not small
                      if (size != ZeroAppBarSize.small) ...[
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: size == ZeroAppBarSize.large ? 20 : 16,
                            left: 16,
                          ),
                          child: _Title(style: adaptiveStyle, title: title),
                        ),
                      ],

                      if (bottom != null) ...[
                        const Spacer(),
                        bottom!,
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A widget for build title of [ZeroAppBar]
class _Title extends StatelessWidget {
  const _Title({required this.style, this.title});

  /// Customizable title
  final Widget? title;

  /// Style of [ZeroAppBar]
  final ZeroAppBarStyle style;

  @override
  Widget build(BuildContext context) {
    // Calculating default style title
    final titleStyle = (style.titleStyle ??
            context.theme.typography.heading5 ??
            const TextStyle(fontSize: 24))
        .copyWith(color: style.foregroundColor);

    final titleWidget = DefaultTextStyle(
      style: titleStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      child: title ?? const SizedBox.shrink(),
    );

    /// If centerTitle, title will be wrap with [Center] widget
    return style.centerTitle == true ? Center(child: titleWidget) : titleWidget;
  }
}

bool _checkHasLeading({
  required BuildContext context,
  required bool automaticallyImplyLeading,
}) {
  if (automaticallyImplyLeading == false) {
    return false;
  }

  final scaffold = Scaffold.maybeOf(context);
  final parentRoute = ModalRoute.of(context);
  final hasDrawer = scaffold?.hasDrawer ?? false;
  final canPop = parentRoute?.canPop ?? false;

  return hasDrawer || canPop;
}

/// A widget for building leading of [ZeroAppBar]
class _Leading extends StatelessWidget {
  const _Leading({
    required this.automaticallyImplyLeading,
    required this.leading,
  });

  /// Set automatically leading or not
  final bool automaticallyImplyLeading;

  /// Customize leading, if null and [automaticallyImplyLeading] is true leading will auto set
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final hasLeading = _checkHasLeading(
      context: context,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );

    if (leading != null) return leading!;

    if (hasLeading) {
      final scaffold = Scaffold.maybeOf(context);
      final parentRoute = ModalRoute.of(context);
      final hasDrawer = scaffold?.hasDrawer ?? false;
      final canPop = parentRoute?.canPop ?? false;
      final localization = MaterialLocalizations.of(context);

      // Build leading when have drawer in scaffold
      if (hasDrawer) {
        return IconButton(
          // Action to open drawer
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(ZeroIcons.menu),
          tooltip: localization.openAppDrawerTooltip,
        );
      }

      // Build leading back button
      if (canPop) {
        return IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(ZeroIcons.arrowLeft),
          tooltip: localization.backButtonTooltip,
        );
      }
    }

    return const SizedBox.shrink();
  }
}
