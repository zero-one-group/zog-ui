import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroCard extends StatelessWidget {
  final ZeroCardVariant variant;
  final ZeroCardStyle style;
  final Widget child;
  final Clip clipBehavior;
  ZeroCard({
    super.key,
    this.variant = ZeroCardVariant.elevated,
    ZeroCardStyle? style,
    required this.child,
    this.clipBehavior = Clip.antiAlias,
  }) : style = style ?? ZeroCardStyle();

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
