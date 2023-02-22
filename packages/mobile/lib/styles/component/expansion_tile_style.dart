import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

// Examples can assume:
// late BuildContext context;

/// Used with [ZeroExpansionTileTheme] to define default property values for
/// descendant [ZeroExpansionTile] widgets.
///
/// Descendant widgets obtain the current [ZeroExpansionTileStyle] object
/// using `ZeroExpansionTileTheme.of(context)`. Instances of
/// [ZeroExpansionTileStyle] can be customized with
/// [ZeroExpansionTileStyle.copyWith].
///
/// A [ZeroExpansionTileStyle] is often specified as part of the
/// overall [ZeroTheme] with [ThemeData.ZeroExpansionTileTheme].
///
/// All [ZeroExpansionTileStyle] properties are `null` by default.
/// When a theme property is null, the [ZeroExpansionTile]  will provide its own
/// default based on the overall [ZeroTheme]'s textTheme and
/// colorScheme. See the individual [ZeroExpansionTile] properties for details.
///
/// See also:
///
///  * [ThemeData], which describes the overall theme information for the
///    application.
///  * [ZeroExpansionTileTheme] which overrides the default [ZeroExpansionTileTheme]
///    of its [ZeroExpansionTile] descendants.
///  * [ThemeData.textTheme], text with a color that contrasts with the card
///    and canvas colors.
///  * [ThemeData.colorScheme], the thirteen colors that most Material widget
///    default colors are based on.
@immutable
class ZeroExpansionTileStyle with Diagnosticable {
  /// Creates a [ZeroExpansionTileStyle].
  ZeroExpansionTileStyle({
    this.variant,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.tilePadding,
    this.expandedAlignment,
    this.childrenPadding,
    this.iconColor,
    this.collapsedIconColor,
    this.textColor,
    this.collapsedTextColor,
    this.shape,
    this.collapsedShape,
    this.clipBehavior,
    this.titleColor,
    this.collapsedTitleColor,
  }) {
    debugPrint(
        'ZeroExpansionTileStyle variant $variant titleColor $titleColor');
  }

  /// Variant of [ZeroAccordion], values: [AccordionVariant.underline], [AccordionVariant.filled].
  final AccordionVariant? variant;

  /// Overrides the default value of [ZeroExpansionTile.leading].
  final Widget? leading;

  /// Overrides the default value of [ZeroExpansionTile.trailing].
  final Widget? trailing;

  /// Overrides the default value of [ZeroExpansionTile.backgroundColor].
  final Color? backgroundColor;

// Overrides the default value of [ZeroExpansionTile.backgroundColor].
  final Color? titleColor;

// Overrides the default value of [ZeroExpansionTile.backgroundColor].
  final Color? collapsedTitleColor;

  /// Overrides the default value of [ZeroExpansionTile.collapsedBackgroundColor].
  final Color? collapsedBackgroundColor;

  /// Overrides the default value of [ZeroExpansionTile.tilePadding].
  final EdgeInsetsGeometry? tilePadding;

  /// Overrides the default value of [ZeroExpansionTile.expandedAlignment].
  final AlignmentGeometry? expandedAlignment;

  /// Overrides the default value of [ZeroExpansionTile.childrenPadding].
  final EdgeInsetsGeometry? childrenPadding;

  /// Overrides the default value of [ZeroExpansionTile.iconColor].
  final Color? iconColor;

  /// Overrides the default value of [ZeroExpansionTile.collapsedIconColor].
  final Color? collapsedIconColor;

  /// Overrides the default value of [ZeroExpansionTile.textColor].
  final Color? textColor;

  /// Overrides the default value of [ZeroExpansionTile.collapsedTextColor].
  final Color? collapsedTextColor;

  /// Overrides the default value of [ZeroExpansionTile.shape].
  final ShapeBorder? shape;

  /// Overrides the default value of [ZeroExpansionTile.collapsedShape].
  final ShapeBorder? collapsedShape;

  /// Overrides the default value of [ZeroExpansionTile.clipBehavior].
  final Clip? clipBehavior;

  /// Creates a copy of this object with the given fields replaced with the
  /// new values.
  ZeroExpansionTileStyle copyWith({
    AccordionVariant? variant,
    Color? titleColor,
    Color? collapsedTitleColor,
    Color? backgroundColor,
    Color? collapsedBackgroundColor,
    EdgeInsetsGeometry? tilePadding,
    AlignmentGeometry? expandedAlignment,
    EdgeInsetsGeometry? childrenPadding,
    Color? iconColor,
    Color? collapsedIconColor,
    Color? textColor,
    Color? collapsedTextColor,
    ShapeBorder? shape,
    ShapeBorder? collapsedShape,
    Clip? clipBehavior,
  }) {
    return ZeroExpansionTileStyle(
      variant: variant ?? this.variant,
      titleColor: titleColor ?? this.titleColor,
      collapsedTitleColor: collapsedTitleColor ?? this.collapsedTitleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      collapsedBackgroundColor:
          collapsedBackgroundColor ?? this.collapsedBackgroundColor,
      tilePadding: tilePadding ?? this.tilePadding,
      expandedAlignment: expandedAlignment ?? this.expandedAlignment,
      childrenPadding: childrenPadding ?? this.childrenPadding,
      iconColor: iconColor ?? this.iconColor,
      collapsedIconColor: collapsedIconColor ?? this.collapsedIconColor,
      textColor: textColor ?? this.textColor,
      collapsedTextColor: collapsedTextColor ?? this.collapsedTextColor,
      shape: shape ?? this.shape,
      collapsedShape: collapsedShape ?? this.collapsedShape,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }

  /// Linearly interpolate between ZeroExpansionTileThemeData objects.
  static ZeroExpansionTileStyle? lerp(
      ZeroExpansionTileStyle? a, ZeroExpansionTileStyle? b, double t) {
    if (a == null && b == null) {
      return null;
    }
    return ZeroExpansionTileStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      collapsedBackgroundColor: Color.lerp(
          a?.collapsedBackgroundColor, b?.collapsedBackgroundColor, t),
      tilePadding: EdgeInsetsGeometry.lerp(a?.tilePadding, b?.tilePadding, t),
      expandedAlignment:
          AlignmentGeometry.lerp(a?.expandedAlignment, b?.expandedAlignment, t),
      childrenPadding:
          EdgeInsetsGeometry.lerp(a?.childrenPadding, b?.childrenPadding, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      collapsedIconColor:
          Color.lerp(a?.collapsedIconColor, b?.collapsedIconColor, t),
      textColor: Color.lerp(a?.textColor, b?.textColor, t),
      collapsedTextColor:
          Color.lerp(a?.collapsedTextColor, b?.collapsedTextColor, t),
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      collapsedShape: ShapeBorder.lerp(a?.collapsedShape, b?.collapsedShape, t),
    );
  }

  @override
  int get hashCode {
    return Object.hash(
      backgroundColor,
      collapsedBackgroundColor,
      tilePadding,
      expandedAlignment,
      childrenPadding,
      iconColor,
      collapsedIconColor,
      textColor,
      collapsedTextColor,
      shape,
      collapsedShape,
      clipBehavior,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ZeroExpansionTileStyle &&
        other.backgroundColor == backgroundColor &&
        other.collapsedBackgroundColor == collapsedBackgroundColor &&
        other.tilePadding == tilePadding &&
        other.expandedAlignment == expandedAlignment &&
        other.childrenPadding == childrenPadding &&
        other.iconColor == iconColor &&
        other.collapsedIconColor == collapsedIconColor &&
        other.textColor == textColor &&
        other.collapsedTextColor == collapsedTextColor &&
        other.shape == shape &&
        other.collapsedShape == collapsedShape &&
        other.clipBehavior == clipBehavior;
  }

  ZeroExpansionTileStyle merge(ZeroExpansionTileStyle? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other.backgroundColor,
      childrenPadding: other.childrenPadding,
      clipBehavior: other.clipBehavior,
      collapsedBackgroundColor: other.collapsedBackgroundColor,
      collapsedIconColor: other.collapsedIconColor,
      collapsedShape: other.collapsedShape,
      collapsedTextColor: other.backgroundColor,
      expandedAlignment: expandedAlignment,
      iconColor: other.iconColor,
      shape: other.shape,
      textColor: other.textColor,
    );
  }

  ExpansionTileThemeData toExpansionTileThemeData() {
    return ExpansionTileThemeData(
        backgroundColor: backgroundColor,
        collapsedBackgroundColor: collapsedBackgroundColor,
        tilePadding: tilePadding,
        expandedAlignment: expandedAlignment,
        childrenPadding: childrenPadding,
        textColor: textColor,
        clipBehavior: clipBehavior,
        collapsedIconColor: collapsedIconColor,
        collapsedShape: collapsedShape,
        collapsedTextColor: collapsedTextColor,
        iconColor: iconColor,
        shape: shape);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        ColorProperty('backgroundColor', backgroundColor, defaultValue: null));
    properties.add(ColorProperty(
        'collapsedBackgroundColor', collapsedBackgroundColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'tilePadding', tilePadding,
        defaultValue: null));
    properties.add(DiagnosticsProperty<AlignmentGeometry>(
        'expandedAlignment', expandedAlignment,
        defaultValue: null));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>(
        'childrenPadding', childrenPadding,
        defaultValue: null));
    properties.add(ColorProperty('iconColor', iconColor, defaultValue: null));
    properties.add(ColorProperty('collapsedIconColor', collapsedIconColor,
        defaultValue: null));
    properties.add(ColorProperty('textColor', textColor, defaultValue: null));
    properties.add(ColorProperty('collapsedTextColor', collapsedTextColor,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<ShapeBorder>(
        'collapsedShape', collapsedShape,
        defaultValue: null));
    properties.add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior,
        defaultValue: null));
  }
}
