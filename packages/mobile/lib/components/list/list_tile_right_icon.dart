import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

/// Build a widget icon which is located to the right of [ZeroListTile]
///
/// This widget can be called a suffix on the list tile
class ListTileRightIcon extends StatelessWidget {
  const ListTileRightIcon({
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

    // TODO: integrate theme icon base on theme
    final color =
        disabled ? ZeroColors.neutral6 : Theme.of(context).iconTheme.color;

    // set default color/theme if child is [Icon] widget
    return IconTheme(
      data: IconThemeData(
        size: 24,
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: child!,
      ),
    );
  }
}
