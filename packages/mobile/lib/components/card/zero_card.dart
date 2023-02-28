import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// A card widget with custom style.
/// there are 3 styles for [ZeroCard]:
/// - [ZeroCardVariant.outline] is a card with border line
/// - [ZeroCardVariant.filled] is a card with custom background color
/// - [ZeroCardVariant.elevated] is a card with shadow/elavation
class ZeroCard extends StatelessWidget {
  /// style of the card
  final ZeroCardStyle style;

  /// widget child of the card
  final Widget child;

  /// clip behavior of the card
  /// default is [Clip.antiAlias]
  final Clip clipBehavior;
  const ZeroCard({
    super.key,
    ZeroCardStyle? style,
    required this.child,
    this.clipBehavior = Clip.antiAlias,
  }) : style = style ?? const ZeroCardStyle();

  @override
  Widget build(BuildContext context) {
    final ZeroCardStyle themeStyle = context.theme.cardStyle;
    final ZeroCardStyle adaptiveStyle = themeStyle.merge(style);
    return Card(
      color: adaptiveStyle.backgroundColor,
      elevation: adaptiveStyle.elevation,
      shape: RoundedRectangleBorder(
        borderRadius: adaptiveStyle.borderRadius!,
        side: adaptiveStyle.side!,
      ),
      shadowColor: adaptiveStyle.shadowColor,
      borderOnForeground: adaptiveStyle.borderOnForeground!,
      margin: adaptiveStyle.margin,
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}
