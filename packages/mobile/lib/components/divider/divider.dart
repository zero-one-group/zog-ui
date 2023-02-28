import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

enum _ZeroDividerType {
  vertical,
  horizontal;

  /// Returns boolean, takes the type whether it is vertical or not
  bool get isVertical => this == _ZeroDividerType.vertical;

  /// Returns boolean, takes the type whether it is horizontal or not
  bool get isHorizontal => this == _ZeroDividerType.horizontal;
}

/// List types of variant dividers
enum ZeroDividerVariant {
  /// It doesn't have padding space at the beginning and end of the padding
  fullWidth,

  /// Have space padding at the beginning of the padding
  inset,

  /// Have space padding at the end of the padding
  middleInset
}

class ZeroDivider extends StatelessWidget {
  /// Create a divider with a horizontal orientation
  const ZeroDivider({
    super.key,
    this.style,
    this.variant = ZeroDividerVariant.fullWidth,
  }) : _type = _ZeroDividerType.horizontal;

  /// Create a divider with a horizontal orientation
  const ZeroDivider.horizontal({
    super.key,
    this.style,
    this.variant = ZeroDividerVariant.fullWidth,
  }) : _type = _ZeroDividerType.horizontal;

  /// Create a divider with a vertical orientation
  const ZeroDivider.vertical({
    super.key,
    this.style,
    this.variant = ZeroDividerVariant.fullWidth,
  }) : _type = _ZeroDividerType.vertical;

  /// Identify the typenya vertical or horizontal
  final _ZeroDividerType _type;

  /// Custom style divider, this will override the global theme style
  final ZeroDividerStyle? style;

  /// Allows for custom variants of the divider
  ///
  /// By default variant is [ZeroDividerVariant.fullWidth]
  ///
  /// - [ZeroDividerVariant.fullWidth] It doesn't have padding space at the beginning and end of the padding
  /// - [ZeroDividerVariant.inset] Have space padding at the beginning of the padding
  /// - [ZeroDividerVariant.middleInset] Have space padding at the end of the padding
  ///
  /// And the padding size is determined from the [style] or [ZeroTheme.dividerStyle]
  final ZeroDividerVariant variant;

  @override
  Widget build(BuildContext context) {
    final themeStyle = context.theme.dividerStyle;
    final adaptiveStyle = themeStyle.merge(style);

    final isVertical = _type.isVertical;

    // Set limit maximum size is max size of widget in the screen
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      final width = constraints.maxWidth;

      final padding = _calculatePadding(adaptiveStyle);

      return Padding(
        padding: padding,
        child: UnconstrainedBox(
          child: Container(
            height: isVertical ? height - padding.vertical : adaptiveStyle.size,
            width: isVertical ? adaptiveStyle.size : width - padding.horizontal,
            color: adaptiveStyle.color,
          ),
        ),
      );
    });
  }

  /// Calculates the padding according to the [variant], [_type] and [style]
  ///
  /// If the type is fullWidth the padding will automatically be 0
  EdgeInsetsGeometry _calculatePadding(ZeroDividerStyle style) {
    final isVertical = _type.isVertical;
    final isHorizontal = _type.isHorizontal;

    // Check start of divider need padding or not
    final isStartInset = variant == ZeroDividerVariant.inset ||
        variant == ZeroDividerVariant.middleInset;

    // Check end of divider need padding or not
    final isEndInset = variant == ZeroDividerVariant.middleInset;

    final top = isStartInset && isVertical ? style.startInset : null;
    final bottom = isEndInset && isVertical ? style.endInset : null;
    final left = isStartInset && isHorizontal ? style.startInset : null;
    final right = isEndInset && isHorizontal ? style.endInset : null;

    return EdgeInsets.only(
      top: top ?? 0,
      bottom: bottom ?? 0,
      left: left ?? 0,
      right: right ?? 0,
    );
  }
}
