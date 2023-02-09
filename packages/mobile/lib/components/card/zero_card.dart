import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

// TODO: function for more_vertical button

class ZeroCard extends StatefulWidget {
  final String title, subtitle, description, header, subheader;
  final TextStyle? titleStyle, subtitleStyle, descriptionStyle, headerStyle, subheaderStyle;
  final ZeroAvatar? avatar;
  final List<Widget> actions;
  final MainAxisAlignment actionsAlignment;
  final Image? image;
  final double cardPadding;
  final ZeroCardVariant variant;
  final Color outlineBorderColor;
  final Color filledColor;
  final double width;
  ZeroCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.header,
    required this.subheader,
    this.titleStyle,
    this.subtitleStyle,
    this.descriptionStyle,
    this.headerStyle,
    this.subheaderStyle,
    this.avatar,
    this.actions = const [],
    this.actionsAlignment = MainAxisAlignment.end,
    this.image,
    this.cardPadding = 16,
    this.variant = ZeroCardVariant.elevated,
    Color? outlineBorderColor,
    this.filledColor = ZeroColors.white,
    this.width = 300,
  }) : outlineBorderColor = outlineBorderColor ?? ZeroColors.neutral[5];

  @override
  State<ZeroCard> createState() => _ZeroCardState();
}

class _ZeroCardState extends State<ZeroCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: widget.variant == ZeroCardVariant.outline
          ? widget.variant.decoration.copyWith(
              border: Border.all(color: widget.outlineBorderColor),
            )
          : widget.variant == ZeroCardVariant.filled
              ? widget.variant.decoration.copyWith(
                  color: widget.filledColor,
                )
              : widget.variant.decoration,
      child: Padding(
        padding: EdgeInsets.all(widget.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.avatar == null
                    ? const SizedBox()
                    : Column(
                        children: [
                          SizedBox(child: widget.avatar),
                          SizedBox(width: widget.cardPadding / 2),
                        ],
                      ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.header,
                        style: context.theme.typography.body1?.copyWith(fontWeight: FontWeight.bold).merge(widget.headerStyle),
                      ),
                      Text(
                        widget.subheader,
                        style: context.theme.typography.subtitle2?.merge(widget.subheaderStyle),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  child: Icon(Icons.more_vert),
                )
              ],
            ),
            SizedBox(height: widget.cardPadding),
            SizedBox(child: widget.image),
            SizedBox(height: widget.cardPadding),
            Text(
              widget.title,
              style: context.theme.typography.subtitle2?.merge(widget.titleStyle),
            ),
            Text(
              widget.subtitle,
              style: context.theme.typography.caption?.merge(widget.subtitleStyle),
            ),
            SizedBox(height: widget.cardPadding),
            Text(
              widget.description,
              style: context.theme.typography.caption?.merge(widget.descriptionStyle),
            ),
            SizedBox(height: widget.cardPadding * 1.5),
            Row(
              mainAxisAlignment: widget.actionsAlignment,
              children: widget.actions,
            ),
          ],
        ),
      ),
    );
  }
}
