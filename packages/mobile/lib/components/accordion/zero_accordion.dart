import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/styles/component/expansion_tile_style.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum AccordionVariant { underline, filled }

/// [ZeroAccordion] is a set of [ZeroExpansionTile]
///
class ZeroAccordion extends StatelessWidget {
  final AccordionVariant variant;
  final List<ZeroExpansionTile> children;

  const ZeroAccordion(
      {super.key, required this.variant, required this.children});

  factory ZeroAccordion.underline({
    required List<ZeroExpansionTile> children,
    Widget? leading,
    Widget? trailing,
  }) {
    return ZeroAccordion(
        variant: AccordionVariant.underline, children: children);
  }

  factory ZeroAccordion.filled({
    required List<ZeroExpansionTile> children,
    Widget? leading,
    Widget? trailing,
  }) {
    return ZeroAccordion(variant: AccordionVariant.filled, children: children);
  }

  @override
  Widget build(BuildContext context) {
    ZeroThemeData theme = context.theme;
    final themeStyle = theme.expansionTileStyle;
    debugPrint('themeStyle?.titleColor ${themeStyle.titleColor}');

    List<ZeroExpansionTile> newList = children.map((tile) {
      debugPrint('child themeStyle?.titleColor ${themeStyle.titleColor}');
      final defaultStyle = variant == AccordionVariant.underline
          ? themeStyle.copyWith(variant: AccordionVariant.underline)
          : themeStyle.copyWith(variant: AccordionVariant.filled);

      final adaptiveStyle = defaultStyle.merge(tile.style);

      return ZeroExpansionTile(
        title: tile.title,
        subtitle: tile.subtitle,
        style: adaptiveStyle,
        children: tile.children,
      );
    }).toList();
    return Column(
      children: newList,
    );
  }
}

class ZeroExpansionTile extends StatelessWidget {
  final AccordionVariant variant;

  final Widget title;
  final Widget? subtitle;

  final bool initiallyExpanded;
  final bool maintainState;

  final ListTileControlAffinity? controlAffinity;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;

  final List<Widget> children;
  final Function(bool)? onExpansionChanged;

  final ZeroExpansionTileStyle? style;

  const ZeroExpansionTile(
      {super.key,
      required this.title,
      required this.children,
      this.subtitle,
      this.initiallyExpanded = false,
      this.maintainState = false,
      this.controlAffinity,
      this.expandedAlignment,
      this.expandedCrossAxisAlignment,
      this.onExpansionChanged,
      this.variant = AccordionVariant.underline,
      this.style});

  @override
  Widget build(BuildContext context) {
    debugPrint('tile ${style?.variant}');
    debugPrint('style?.titleColor ${style?.titleColor.toString()}');
    final listTileChildren = [
      Container(
          color: style?.backgroundColor,
          child: Column(
            children: children,
          ))
    ];

    return ExpansionTile(
      key: key,
      title: title,
      subtitle: subtitle,
      backgroundColor: style?.titleColor,
      childrenPadding: style?.childrenPadding,
      clipBehavior: style?.clipBehavior,
      collapsedBackgroundColor: style?.collapsedBackgroundColor,
      collapsedIconColor: style?.collapsedIconColor,
      collapsedShape: style?.collapsedShape,
      collapsedTextColor: style?.collapsedTextColor,
      controlAffinity: controlAffinity,
      expandedAlignment: expandedAlignment,
      expandedCrossAxisAlignment: expandedCrossAxisAlignment,
      iconColor: style?.iconColor,
      initiallyExpanded: initiallyExpanded,
      leading: style?.leading,
      trailing: style?.trailing,
      maintainState: maintainState,
      onExpansionChanged: onExpansionChanged,
      shape: style?.shape,
      tilePadding: style?.tilePadding,
      children: listTileChildren,
    );
  }
}
