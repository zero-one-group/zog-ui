import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// Build a widget icon which is located to the left of [ZeroListTile]
///
/// This widget can be called a prefix on the list tile
class ListTileLeftIcon extends StatelessWidget {
  const ListTileLeftIcon({
    Key? key,
    this.child,
    this.disabled = false,
  }) : super(key: key);

  /// Child/icon in left icon of [ZeroListTile]
  ///
  /// If child is null, will return empty widget (SizedBox)
  final Widget? child;

  /// State of [ZeroListTile] is disabled or not,
  ///
  /// If disabled color automatically adjust to gray
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    // If child is null return empty widget
    if (child == null) return const SizedBox.shrink();
    final theme = context.theme;

    final color = disabled ? theme.disabledColor : theme.iconTheme.color;

    // set default color/theme if child is [Icon] widget
    return IconTheme(
      data: IconThemeData(
        size: 24,
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 32),
        child: child!,
      ),
    );
  }
}
