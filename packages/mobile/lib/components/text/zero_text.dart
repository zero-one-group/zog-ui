import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// Nums of type [ZeroText] typography
enum _ZeroTextType {
  heading5,
  heading6,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overline,
}

/// Creates a text widget.
///
/// If the [style] argument is null, the text will use the style from the
/// closest enclosing [DefaultTextStyle].
///
/// The [data] parameter must not be null.
///
/// The [overflow] property's behavior is affected by the [softWrap] argument.
/// If the [softWrap] is true or null, the glyph causing overflow, and those that follow,
/// will not be rendered. Otherwise, it will be shown with the given overflow option.
class ZeroText extends StatelessWidget {
  /// Creates a text widget with default style **heading5**
  ///
  /// The style will be merge from theme [Typography.heading5]
  const ZeroText.heading5(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.heading5;

  /// Creates a text widget with default style **heading6**
  ///
  /// The style will be merge from theme [Typography.heading6]
  const ZeroText.heading6(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.heading6;

  /// Creates a text widget with default style **subtitle1**
  ///
  /// The style will be merge from theme [Typography.subtitle1]
  const ZeroText.subtitle1(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.subtitle1;

  /// Creates a text widget with default style **subtitle2**
  ///
  /// The style will be merge from theme [Typography.subtitle2]
  const ZeroText.subtitle2(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.subtitle2;

  /// Creates a text widget with default style **body1**
  ///
  /// The style will be merge from theme [Typography.body1]
  const ZeroText.body1(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.body1;

  /// Creates a text widget with default style **body2**
  ///
  /// The style will be merge from theme [Typography.body2]
  const ZeroText.body2(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.body2;

  /// Creates a text widget with default style **button**
  ///
  /// The style will be merge from theme [Typography.button]
  const ZeroText.button(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.button;

  /// Creates a text widget with default style **caption**
  ///
  /// The style will be merge from theme [Typography.caption]
  const ZeroText.caption(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.caption;

  /// Creates a text widget with default style **overline**
  ///
  /// The style will be merge from theme [Typography.overline]
  const ZeroText.overline(
    this.value, {
    this.style,
    this.align,
    this.maxLine,
    this.overflow,
    this.scaleFactor,
    this.softWrap,
    super.key,
  }) : _type = _ZeroTextType.overline;

  /// A value of text String, this text [value] to display the screen
  final String value;

  /// This Allows custom styling of this Widget
  ///
  /// If null, style use from theme
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? align;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be truncated according
  /// to [overflow].
  final int? maxLine;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  ///The number of font pixels for each logical pixel.
  final double? scaleFactor;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// A type of [ZeroText]
  final _ZeroTextType _type;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: _getCombineTextStyle(context),
      maxLines: maxLine == 0 ? null : maxLine,
      textAlign: align,
      overflow: overflow,
      textScaleFactor: scaleFactor,
      softWrap: softWrap,
    );
  }

  /// gets the TextStyle for the Text widget based on the current theme
  /// and a combination of the style parameters
  ///
  /// This TextStyle, each [_type] is different from each other
  TextStyle? _getCombineTextStyle(BuildContext context) {
    final typography = context.theme.typography;

    switch (_type) {
      case _ZeroTextType.heading5:
        return typography.heading5?.merge(style) ?? style;
      case _ZeroTextType.heading6:
        return typography.heading6?.merge(style) ?? style;
      case _ZeroTextType.subtitle1:
        return typography.subtitle1?.merge(style) ?? style;
      case _ZeroTextType.subtitle2:
        return typography.subtitle2?.merge(style) ?? style;
      case _ZeroTextType.body1:
        return typography.body1?.merge(style) ?? style;
      case _ZeroTextType.body2:
        return typography.body2?.merge(style) ?? style;
      case _ZeroTextType.button:
        return typography.button?.merge(style) ?? style;
      case _ZeroTextType.caption:
        return typography.caption?.merge(style) ?? style;
      case _ZeroTextType.overline:
        return typography.overline?.merge(style) ?? style;
    }
  }
}
