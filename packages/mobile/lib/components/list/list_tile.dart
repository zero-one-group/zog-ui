import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/types/list_tile_size.dart';

import 'list_tile_left_icon.dart';
import 'list_tile_right_icon.dart';
import 'list_tile_style.dart';

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
    this.size = ZeroListTileSizeType.large,
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
  final ZeroListTileSizeType size;

  @override
  Widget build(BuildContext context) {
    // Get perferences style from params and combine with global themes
    // TODO: get fallback style base on theme
    final selectedColor = style?.selectedColor ?? ZeroColors.primary1;
    final backgroundColor = selected ? selectedColor : style?.backgroundColor;
    final dividerColor = style?.dividerColor ?? ZeroColors.neutral5;

    // TODO: get disabled color from theme ZeroTheme
    const disabledColor = ZeroColors.neutral7;

    final titleStyle = style?.titleTextStyle ??
        TextStyle(
          fontSize: size.fontSize(),
          color: disabled ? disabledColor : ZeroColors.neutral10,
        );

    final subtitleStyle = style?.subTitleTextStyle ??
        TextStyle(
          fontSize: size.fontSize() - 2,
          color: disabled
              ? disabledColor.withOpacity(0.8)
              : Colors.black.withOpacity(0.6),
        );

    return InkWell(
      onTap: disabled ? null : onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(color: backgroundColor),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: size.contentPadding(),
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
                              style: subtitleStyle,
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
              // TODO: use Divider from ZeroDivider
              if (withDivider)
                Container(
                  color: dividerColor,
                  width: double.infinity,
                  height: 1,
                )
            ],
          ),
        ),
      ),
    );
  }
}
