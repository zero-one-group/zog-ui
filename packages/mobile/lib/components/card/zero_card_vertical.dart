import 'package:flutter/material.dart';

import '../../zero_ui_mobile.dart';

class ZeroCardVertical extends StatefulWidget {
  final String header, subheader;
  final TextStyle? headerStyle, subheaderStyle;
  final ZeroAvatar? avatar;
  final Image? image;
  final double cardPadding;
  final ZeroCardVariant variant;
  final Color outlineBorderColor;
  final Color filledColor;
  final double height;
  final double width;
  ZeroCardVertical({
    super.key,
    required this.header,
    required this.subheader,
    this.headerStyle,
    this.subheaderStyle,
    this.avatar,
    this.image,
    this.cardPadding = 16,
    this.variant = ZeroCardVariant.elevated,
    Color? outlineBorderColor,
    this.filledColor = ZeroColors.white,
    this.height = 80,
    this.width = 300,
  }) : outlineBorderColor = outlineBorderColor ?? ZeroColors.neutral[5];

  @override
  State<ZeroCardVertical> createState() => _ZeroCardVerticalState();
}

class _ZeroCardVerticalState extends State<ZeroCardVertical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
                  SizedBox(child: widget.avatar),
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
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: widget.image,
          )
        ],
      ),
    );
  }
}
