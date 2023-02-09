part of 'zero_navigation_drawer.dart';

class ZeroNavigationDrawerHeader extends StatelessWidget {
  const ZeroNavigationDrawerHeader({
    super.key,
    required this.child,
  });

  /// Main widget of [ZeroNavigationDrawerHeader]
  ///
  /// Usually [child] is image logo or text logo
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // get style navigation Drawer
    final style = theme.navigationDrawerStyle;

    return DefaultTextStyle(
      // Set default text style from theme
      style: style.headerTitleStyle ??
          theme.typography.subtitle1 ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
        child: child,
      ),
    );
  }
}
