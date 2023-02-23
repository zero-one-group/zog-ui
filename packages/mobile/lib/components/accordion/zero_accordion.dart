import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum AccordionVariant {
  /// With single background color, and only has 1 border at the bottom of the [ZeroExpansionTile]
  underline,

  /// With background color applies to thetitle as the background and to the children,
  /// It has no border at all on the [ZeroExpansionTile]
  filled
}

const Duration _kExpand = Duration(milliseconds: 200);

/// [ZeroAccordion] is a set of [ZeroExpansionTile]
class ZeroAccordion extends StatelessWidget {
  final AccordionVariant variant;

  /// The set of [ZeroExpansionTile] that are displayed when the tile expands.
  final List<ZeroExpansionTile> children;

  /// A widget to display before the title which applies to all the [ZeroExpansionTile]s
  ///
  /// Note that depending on the value of [controlAffinity], the [trailing] widget
  /// may replace the rotating expansion arrow icon.
  final Widget? leading;

  /// A widget to display after the title which applies to all the [ZeroExpansionTile]s
  ///
  /// Note that depending on the value of [controlAffinity], the [trailing] widget
  /// may replace the rotating expansion arrow icon.
  final Widget? trailing;

  /// Whether or not the [leading] should rotate on expansion. It defaults to `false`
  final bool? leadingRotateOnExpand;

  /// Whether or not the [leading] should rotate on expansion. It defaults to `true`
  final bool? trailingRotateOnExpand;

  final ZeroExpansionTileStyle style;

  const ZeroAccordion({
    super.key,
    required this.variant,
    required this.children,
    required this.style,
    this.leading,
    this.trailing,
    this.leadingRotateOnExpand,
    this.trailingRotateOnExpand,
  });

  /// Create [ZeroAccordion] object in which the styles of the children default to [ZeroExpansionTileStyle.underline()]
  factory ZeroAccordion.underline({
    required List<ZeroExpansionTile> children,
    Widget? leading,
    Widget? trailing,
    bool? leadingRotateOnExpand,
    bool? trailingRotateOnExpand,
    ZeroExpansionTileStyle? style,
  }) {
    return ZeroAccordion(
      variant: AccordionVariant.underline,
      leading: leading,
      trailing: trailing,
      leadingRotateOnExpand: leadingRotateOnExpand,
      trailingRotateOnExpand: trailingRotateOnExpand,
      style: style ??
          ZeroExpansionTileStyle.underline(
              leading: leading, trailing: trailing),
      children: children,
    );
  }

  /// Create [ZeroAccordion] object in which the styles of the children default to [ZeroExpansionTileStyle.filled()]
  factory ZeroAccordion.filled({
    required List<ZeroExpansionTile> children,
    Widget? leading,
    Widget? trailing,
    bool? leadingRotateOnExpand,
    bool? trailingRotateOnExpand,
    ZeroExpansionTileStyle? style,
  }) {
    return ZeroAccordion(
        variant: AccordionVariant.filled,
        leading: leading,
        trailing: trailing,
        leadingRotateOnExpand: leadingRotateOnExpand,
        trailingRotateOnExpand: trailingRotateOnExpand,
        style: style ??
            ZeroExpansionTileStyle.filled(leading: leading, trailing: trailing),
        children: children);
  }

  @override
  Widget build(BuildContext context) {
    ZeroThemeData theme = context.theme;
    final themeStyle = theme.expansionTileStyle;

    List<ZeroExpansionTile> styledChildren = children.map((tile) {
      final defaultStyle = variant == AccordionVariant.underline
          ? themeStyle.underline(
              leading: leading,
              trailing: trailing,
            )
          : themeStyle.filled(leading: leading, trailing: trailing);

      final adaptiveStyle = defaultStyle.merge(style).merge(tile.style);

      return ZeroExpansionTile(
        title: tile.title,
        subtitle: tile.subtitle,
        variant: variant,
        leadingRotateOnExpand:
            leadingRotateOnExpand ?? tile.leadingRotateOnExpand,
        trailingRotateOnExpand:
            trailingRotateOnExpand ?? tile.trailingRotateOnExpand,
        style: adaptiveStyle,
        children: tile.children,
      );
    }).toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: styledChildren,
    );
  }
}

/// The item of [ZeroAccordion] widget which built on top of [ExpansionTile].
/// All the style parameters of  [ExpansionTile] are provided inside [ZeroExpansionTile]'s [style] parameter
class ZeroExpansionTile extends StatefulWidget {
  /// Can be [AccordionVariant.filled] of [AccordionVariant.underline]
  final AccordionVariant variant;

  final Widget title;
  final Widget? subtitle;

  final bool initiallyExpanded;
  final bool maintainState;

  final ListTileControlAffinity? controlAffinity;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;

  /// Whether or not the [leading] should rotate on expansion. It defaults to `false`
  /// Overrides the [ZeroAccordion.leadingRotateOnExpand]'s value
  final bool leadingRotateOnExpand;

  /// Whether or not the [trailing] should rotate on expansion. It defaults to `true`
  /// Overrides the [ZeroAccordion.trailingRotateOnExpand]'s value
  final bool trailingRotateOnExpand;

  /// The widget children of the [ZeroExpansionTile].
  final List<Widget> children;

  /// Function called every time the expansion changed.
  /// `bool` values `true` if expanded
  final Function(bool)? onExpansionChanged;

  /// Provide all the style parameters of [ZeroExpansionTile].
  /// It defaults to the value set on [ZeroThemeData]'s `ExpansionTileStyle`
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
      this.leadingRotateOnExpand = true,
      this.trailingRotateOnExpand = true,
      this.variant = AccordionVariant.underline,
      this.style});

  @override
  State<ZeroExpansionTile> createState() => _ZeroExpansionTileState();
}

class _ZeroExpansionTileState extends State<ZeroExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;

  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _isExpanded = PageStorage.maybeOf(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // force [ExpansionTile] to have only one child that can have multiple childrens
    debugPrint('widget.variant ${widget.variant}');
    final listTileChildren = [
      Container(
          color: widget.variant == AccordionVariant.underline
              ? widget.style?.backgroundColor
              : widget.style?.childrenBackgroundColor,
          child: Column(
            children: widget.children,
          ))
    ];

    // If `leading` not set, then show nothing.
    bool showLeading = widget.style?.leading != null;

    Widget? leading = (widget.leadingRotateOnExpand
        ? _buildIcon(context, child: widget.style?.leading)
        : widget.style?.leading);

    Widget? trailing = widget.trailingRotateOnExpand
        ? _buildIcon(context, child: widget.style?.trailing)
        : widget.style?.trailing;

    return ExpansionTile(
      key: widget.key,
      title: widget.title,
      subtitle: widget.subtitle,
      backgroundColor: widget.style?.backgroundColor,
      childrenPadding: widget.style?.childrenPadding,
      clipBehavior: widget.style?.clipBehavior,
      collapsedBackgroundColor: widget.style?.collapsedBackgroundColor,
      collapsedIconColor: widget.style?.collapsedIconColor,
      collapsedShape: widget.style?.collapsedShape,
      collapsedTextColor: widget.style?.collapsedTextColor,
      textColor: widget.style?.textColor,
      controlAffinity: widget.controlAffinity,
      expandedAlignment: widget.expandedAlignment,
      expandedCrossAxisAlignment: widget.expandedCrossAxisAlignment,
      iconColor: widget.style?.iconColor,
      initiallyExpanded: widget.initiallyExpanded,
      leading: showLeading ? leading : widget.style?.leading,
      trailing: trailing,
      maintainState: widget.maintainState,
      onExpansionChanged: (bool expanded) {
        // Rotate the icon
        setState(() {
          _isExpanded = !_isExpanded;
          if (_isExpanded) {
            _controller.forward();
          } else {
            _controller.reverse().then<void>((void value) {
              if (!mounted) {
                return;
              }
              setState(() {});
            });
          }
          PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
        });
        widget.onExpansionChanged?.call(expanded);
      },
      shape: widget.style?.shape,
      tilePadding: widget.style?.tilePadding,
      children: listTileChildren,
    );
  }

  Widget? _buildIcon(BuildContext context, {Widget? child}) {
    return RotationTransition(
        turns: _iconTurns, child: child ?? const Icon(Icons.expand_more));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
