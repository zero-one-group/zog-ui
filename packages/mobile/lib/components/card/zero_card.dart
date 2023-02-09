import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

// TODO: function for more_vertical button
// TODO: make styles for orientations
// TODO: width

enum ZeroCardOrientation {
  horizontal,
  vertical,
}

enum ZeroCardVariant {
  outline,
  filled,
  elevated;

  BoxDecoration get decoration {
    switch (this) {
      case ZeroCardVariant.outline:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ZeroColors.neutral[5]),
        );
      case ZeroCardVariant.filled:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        );
      case ZeroCardVariant.elevated:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        );
    }
  }
}

class ZeroCard extends StatefulWidget {
  final String title, subtitle, description, header, subheader;
  final TextStyle? titleStyle, subtitleStyle, descriptionStyle, headerStyle, subheaderStyle;
  final ZeroAvatar avatar;
  final List<Widget> actions;
  final MainAxisAlignment actionsAlignment;
  final Image image;
  final double cardPadding;
  final ZeroCardVariant variant;
  final Color outlineBorderColor;
  final Color filledColor;

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
    required this.avatar,
    this.actions = const [],
    this.actionsAlignment = MainAxisAlignment.end,
    required this.image,
    this.cardPadding = 16,
    this.variant = ZeroCardVariant.elevated,
    Color? outlineBorderColor,
    this.filledColor = ZeroColors.white,
  }) : outlineBorderColor = outlineBorderColor ?? ZeroColors.neutral[5];

  @override
  State<ZeroCard> createState() => _ZeroCardState();
}

class _ZeroCardState extends State<ZeroCard> {
  @override
  Widget build(BuildContext context) {
    return _vertical();
  }

  Widget _horizontal() {
    return Container(
      width: 300,
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
                widget.avatar,
                SizedBox(width: widget.cardPadding / 2),
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
            widget.image,
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

  Widget _vertical() {
    return Container(
      width: 300,
      decoration: widget.variant == ZeroCardVariant.outline
          ? widget.variant.decoration.copyWith(
              border: Border.all(color: widget.outlineBorderColor),
            )
          : widget.variant == ZeroCardVariant.filled
              ? widget.variant.decoration.copyWith(
                  color: widget.filledColor,
                )
              : widget.variant.decoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(widget.cardPadding / 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.avatar,
                  SizedBox(width: widget.cardPadding / 2),
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
                ],
              ),
            ),
          ),
          SizedBox(
            width: 60 + widget.cardPadding / 2,
            height: 60 + widget.cardPadding / 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: widget.image,
            ),
          )
        ],
      ),
    );
  }
}
