import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import 'list_tile_left_icon.dart';
import 'list_tile_right_icon.dart';

class ZeroListTile extends StatelessWidget {
  const ZeroListTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.rightIcon,
    this.leftIcon,
    this.withDivider = false,
    this.disabled = false,
    this.selected = false,
    this.onTap,
    this.style,
    this.size = ZeroListTileSize.large,
    this.startSlideActions = const [],
    this.endSlideActions = const [],
  }) : super(key: key);

  /// The main text to be displayed in the [ZeroListTile]
  final String title;

  /// The secondary text to be displayed in the [ZeroListTile]
  final String? subtitle;

  /// The widget will be displayed to the right of the [ZeroListTile] content,
  /// or it can be called the action button of the [ZeroListTile]
  final Widget? rightIcon;

  /// Widget to be displayed on the left of [ZeroListTile] content.
  /// This widget as a marker that describes the [ZeroListTile]
  final Widget? leftIcon;

  /// withDivider shows the border/divider under [ZeroListTile].
  ///
  /// By default [withDivider] is false
  final bool withDivider;

  final bool disabled;

  /// Marks the [ZeroListTile] in the selected state
  final bool selected;

  /// Callback when listTile is tapped,
  /// but if state [disabled] is true then onTap won't work
  final VoidCallback? onTap;

  /// This will allow custom styling still and throughout this widget,
  /// and by default/fallback from the global theme if not set
  final ZeroListTileStyle? style;

  /// Custom size
  final ZeroListTileSize size;

  /// Slidable actions when sliding to the right
  ///
  /// This action is to the left when it opens
  final List<ZeroListTileAction> startSlideActions;

  /// Slidable actions when sliding to the left
  ///
  /// This action is to the right when it opens
  final List<ZeroListTileAction> endSlideActions;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final listTileStyle = context.theme.listTileStyle.merge(style);
    final fallbackStyle = ZeroListTileStyle.fallback();
    final selectedColor = listTileStyle.selectedColor ?? theme.primaryColor.lightest;
    final backgroundColor = selected ? selectedColor : listTileStyle.backgroundColor;
    final dividerColor = listTileStyle.dividerColor ?? theme.dividerColor;

    final isSmall = size == ZeroListTileSize.small;

    // title text style with merge from fallback style
    final titleStyle = (isSmall
                ? fallbackStyle.smallTitleTextStyle?.merge(listTileStyle.smallTitleTextStyle)
                : fallbackStyle.titleTextStyle?.merge(listTileStyle.titleTextStyle))
            ?.copyWith(
          color: disabled ? theme.disabledColor : null,
        ) ??
        const TextStyle();

    // Subtitle text style with merge from fallback style
    final subTitleStyle = (isSmall
                ? fallbackStyle.smallSubTitleTextStyle?.merge(listTileStyle.smallSubTitleTextStyle)
                : fallbackStyle.subTitleTextStyle?.merge(listTileStyle.subTitleTextStyle))
            ?.copyWith(
          color: disabled ? theme.disabledColor.withOpacity(0.8) : null,
        ) ??
        const TextStyle();

    final contentPadding = isSmall ? listTileStyle.smallContentPadding : listTileStyle.contentPadding;

    return Slidable(
      enabled: startSlideActions.isNotEmpty || endSlideActions.isNotEmpty,
      startActionPane: startSlideActions.isNotEmpty
          ? ActionPane(
              motion: const DrawerMotion(),
              children: startSlideActions,
            )
          : null,
      endActionPane: endSlideActions.isNotEmpty
          ? ActionPane(
              motion: const DrawerMotion(),
              children: endSlideActions,
            )
          : null,
      child: DecoratedBox(
        decoration: BoxDecoration(color: backgroundColor),
        child: InkWell(
          onTap: disabled ? null : onTap,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: contentPadding ?? EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTileLeftIcon(disabled: disabled, child: leftIcon),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: titleStyle,
                              child: Text(title),
                            ),
                            if (subtitle != null)
                              DefaultTextStyle(
                                style: subTitleStyle,
                                child: Text(subtitle ?? ''),
                              ),
                          ],
                        ),
                      ),
                      ListTileRightIcon(disabled: disabled, child: rightIcon),
                    ],
                  ),
                ),
                // Buils divider of ListTile
                if (withDivider)
                  ZeroDivider.horizontal(
                    variant: ZeroDividerVariant.fullWidth,
                    style: ZeroDividerStyle(color: dividerColor),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// An action for [ZeroListTile] which can show an icon, a label, or both.
class ZeroListTileAction extends SlidableAction {
  /// Creates a [ZeroListTileAction].
  ///
  /// The [flex], [backgroundColor], [autoClose] and [spacing] arguments
  /// must not be null.
  ///
  /// You must set either an [icon] or a [label].
  ///
  /// The [flex] argument must also be greater than 0.
  const ZeroListTileAction({
    super.key,
    super.autoClose,
    super.flex,
    super.icon,
    super.backgroundColor,
    super.borderRadius,
    super.foregroundColor,
    required super.label,
    super.onPressed,
    super.padding,
    super.spacing,
  });
}
