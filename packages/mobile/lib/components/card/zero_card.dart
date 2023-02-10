import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroCard extends StatefulWidget {
  /// the main variables for the card which is the title, subtitle, description, header, subheader
  /// will be used to display the card
  final String title, subtitle, description, header, subheader;

  /// text styles for the title, subtitle, description, header, subheader
  final TextStyle? titleStyle, subtitleStyle, descriptionStyle, headerStyle, subheaderStyle;

  /// the avatar for the card
  /// [avatar] is [ZeroAvatar] which is will shown in leading header of the card
  final ZeroAvatar? avatar;

  /// the actions for the card
  /// [actions] is contains [Widget] which will shown in end of the card
  /// the actions is [List<Widget>] but mostly used buttons
  final List<Widget> actions;

  /// [headerTrailing] is [Widget] which will shown in trailing of the header
  /// mostly used for [IconButton] with [Icons.more_vert]
  final Widget? headerTrailing;

  /// [actionsAlignment] is [MainAxisAlignment] which will align the [actions]
  /// default is [MainAxisAlignment.end]
  final MainAxisAlignment actionsAlignment;

  /// the image for the card
  /// image will shown in below the header
  final Image? image;

  /// the padding for the card
  /// default is 16
  final double cardPadding;

  /// the variant for the card
  /// there are 3 variants for the card
  /// [ZeroCardVariant.elevated] is the default variant
  /// [ZeroCardVariant.outline] is the variant with outline
  /// [ZeroCardVariant.filled] is the variant with filled color
  final ZeroCardVariant variant;

  /// the outline border color for the card
  /// default is [ZeroColors.neutral[5]]
  /// only used for [ZeroCardVariant.outline]
  final Color outlineBorderColor;

  /// the filled color for the card
  /// default is [ZeroColors.white]
  /// only used for [ZeroCardVariant.filled]
  final Color filledColor;

  /// the width for the card
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
    this.headerTrailing,
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
              color: context.theme.cardColor,
            )
          : widget.variant == ZeroCardVariant.filled
              ? widget.variant.decoration.copyWith(
                  color: widget.filledColor,
                )
              : widget.variant.decoration.copyWith(
                  color: context.theme.cardColor,
                ),
      child: Padding(
        padding: EdgeInsets.all(widget.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.avatar != null) ...[
                  SizedBox(child: widget.avatar),
                  SizedBox(width: widget.cardPadding / 2),
                ],
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
                SizedBox(
                  child: widget.headerTrailing,
                )
              ],
            ),
            SizedBox(height: widget.cardPadding),
            SizedBox(
              width: double.infinity,
              child: widget.image,
            ),
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
