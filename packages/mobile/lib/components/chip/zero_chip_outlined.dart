import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroChipOutlined extends StatelessWidget {
  const ZeroChipOutlined({
    Key? key,
    this.avatar,
    required this.label,
    this.cancelIcon,
    this.disabled = false,
    this.onTap,
    this.onTapCancel,
    this.size = ZeroChipSize.small,
    this.style,
  }) : super(key: key);

  /// A widget to display prior to the chip's label.
  ///
  /// typically using an icon or someone's avatar image
  final Widget? avatar;

  /// The primary text content of this chip
  ///
  /// Must be filled with a String value
  final String label;

  /// The icon on the right side of the chip,
  /// usually functions to delete/cancel the chip
  ///
  /// By default the icon is an X (cancel icon), if onTapCancel is not null
  final IconData? cancelIcon;

  /// Disabling the chip will turn off the onTap gesture and
  /// also change the color of the content to gray
  final bool disabled;

  /// Called when tap chip body
  final VoidCallback? onTap;

  /// Called when tap cancel icon button
  final VoidCallback? onTapCancel;

  /// Adjusting the size variations of the chips can be small and large
  final ZeroChipSize size;

  /// Allows to customize the style of the chip,
  /// and the style will override that of the global theme [ZeroTheme.chipOutlinedStyle]
  final ZeroChipOutlinedStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final adaptiveStyle = theme.chipOutlinedStyle.merge(style);
    final borderRadius = BorderRadius.circular(32);

    final disabledColor =
        disabled ? theme.disabledColor.withOpacity(0.5) : null;

    return UnconstrainedBox(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: disabledColor ??
                adaptiveStyle.borderColor ??
                theme.dividerColor,
          ),
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: disabled ? null : onTap,
          child: Padding(
            padding: size.basePadding(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (avatar != null) ...[
                  ConstrainedBox(
                    constraints: BoxConstraints.loose(Size(
                      size.iconSize(),
                      size.iconSize(),
                    )),
                    child: Container(
                      foregroundDecoration: disabled
                          ? BoxDecoration(
                              color: theme.disabledColor,
                              backgroundBlendMode: BlendMode.saturation,
                              borderRadius: borderRadius,
                            )
                          : null,
                      child: avatar,
                    ),
                  ),
                ],
                Padding(
                  padding: size.contentPadding(),
                  child: Text(
                    label,
                    style: adaptiveStyle.textStyle?.copyWith(
                      fontSize: 12,
                      color: disabledColor,
                    ),
                  ),
                ),
                if (onTapCancel != null || cancelIcon != null) ...[
                  // TODO: use fallback icon from ZeroIcons
                  InkWell(
                    onTap: disabled ? null : onTapCancel,
                    borderRadius: borderRadius,
                    child: Icon(
                      cancelIcon ?? Icons.cancel,
                      size: size.iconSize(),
                      color: disabledColor?.withOpacity(0.2) ??
                          adaptiveStyle.iconColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
