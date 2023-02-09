part of 'zero_navigation_drawer.dart';

class ZeroNavigationDrawerSection extends StatelessWidget {
  const ZeroNavigationDrawerSection({
    Key? key,
    this.title,
    required this.menus,
  }) : super(key: key);

  /// Section title
  ///
  /// Style of [title] when [Text] widget automatically from [ZeroThemeData.navigationDrawerStyle.sectionTitleStyle]
  final Widget? title;

  /// List menus
  ///
  /// Usualyy [menus] is ListTile of [ZeroListTile]
  final List<Widget> menus;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    // global theme of drawer
    final style = theme.navigationDrawerStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Build title, if not null
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: DefaultTextStyle(
              style: style.sectionTitleStyle ??
                  theme.typography.subtitle1 ??
                  const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
              child: title!,
            ),
          ),
        // Build menus
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: menus,
          ),
        ),
      ],
    );
  }
}
