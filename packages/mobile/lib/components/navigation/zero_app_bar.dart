import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// Class for calculating [ZeroAppBar] size
class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

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

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Semantics(
          excludeSemantics: true,
          child: ClipRect(
            child: Ink(
              color: adaptiveStyle.backgroundColor,
              child: SafeArea(
                left: false,
                right: false,
                bottom: false,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: height,
                    maxHeight: height,
                  ),
                  child: IconTheme(
                    data: IconThemeData(
                      size: 24,
                      color: adaptiveStyle.foregroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            // Build leading
                            _Leading(
                              auto: automaticallyImplyLeading,
                              leading: leading,
                            ),
                            // Build title small size
                            Expanded(
                              child: size == ZeroAppBarSize.small
                                  ? _Title(style: adaptiveStyle, title: title)
                                  : const SizedBox(),
                            ),
                            // Build actions
                            Row(
                              children: actions ?? [],
                            )
                          ],
                        ),

                        // Build title when size is not small
                        if (size != ZeroAppBarSize.small) ...[
                          const Spacer(),
                          _Title(style: adaptiveStyle, title: title),
                          size == ZeroAppBarSize.large
                              ? const SizedBox(height: 26)
                              : const SizedBox(height: 20)
                        ],
                      ],
                    ),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: title ?? const SizedBox(),
      ),
    );

    /// If centerTitle, title will be wrap with [Center] widget
    return style.centerTitle == true ? Center(child: titleWidget) : titleWidget;
  }
}

/// A widget for building leading of [ZeroAppBar]
class _Leading extends StatelessWidget {
  const _Leading({
    required this.auto,
    required this.leading,
  });

  /// Set automatically leading or not
  final bool auto;

  /// Customize leading, if null and [auto] is true leading will auto set
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    if (leading != null) return leading ?? const SizedBox();
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
        tooltip: localization.backButtonTooltip,
        icon: const Icon(ZeroIcons.arrowLeft),
      );
    }

    return const SizedBox();
  }
}
