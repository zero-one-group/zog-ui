import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// A styles set of [ZeroTextField] for all variants
class ZeroTextfieldStyleSet {
  final Color? focusedBorderColor;
  final Color? focusedColor;

  final ZeroTextfieldStyle outline;
  final ZeroTextfieldStyle rounded;
  final ZeroTextfieldStyle filled;
  final ZeroTextfieldStyle underline;
  final InputDecorationType defaultDecorationType;
  final ZeroTextfieldSize textfieldSize;

  ZeroTextfieldStyleSet._({
    required this.defaultDecorationType,
    required this.textfieldSize,
    required this.focusedBorderColor,
    required this.focusedColor,
    required this.outline,
    required this.rounded,
    required this.filled,
    required this.underline,
  });

  /// Main [ZeroTextfieldStyle] that would be applied globally
  ZeroTextfieldStyle get mainStyle {
    switch (defaultDecorationType) {
      case InputDecorationType.outline:
        return outline;
      case InputDecorationType.rounded:
        return rounded;
      case InputDecorationType.fill:
        return filled;
      case InputDecorationType.underline:
        return underline;
    }
  }

  ZeroTextfieldStyleSet copyWith({
    ZeroTextfieldStyle? outline,
    ZeroTextfieldStyle? rounded,
    ZeroTextfieldStyle? filled,
    ZeroTextfieldStyle? underline,
    InputDecorationType? defaultDecorationType,
    ZeroTextfieldSize? textfieldSize,
    Color? focusedBorderColor,
    Color? focusedColor,
  }) {
    return ZeroTextfieldStyleSet._(
      outline: outline ?? this.outline,
      rounded: rounded ?? this.rounded,
      filled: filled ?? this.filled,
      textfieldSize: textfieldSize ?? this.textfieldSize,
      underline: underline ?? this.underline,
      defaultDecorationType:
          defaultDecorationType ?? this.defaultDecorationType,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      focusedColor: focusedColor ?? this.focusedColor,
    );
  }

  static ZeroTextfieldStyleSet lerp(
      ZeroTextfieldStyleSet? a, ZeroTextfieldStyleSet? b, double t) {
    return ZeroTextfieldStyleSet._(
        filled: ZeroTextfieldStyle.lerp(a?.filled, b?.filled, t),
        rounded: ZeroTextfieldStyle.lerp(a?.rounded, b?.rounded, t),
        outline: ZeroTextfieldStyle.lerp(a?.outline, b?.outline, t),
        underline: ZeroTextfieldStyle.lerp(a?.underline, b?.underline, t),
        defaultDecorationType:
            (t < 0.5 ? a?.defaultDecorationType : b?.defaultDecorationType) ??
                InputDecorationType.outline,
        textfieldSize: (t < 0.5 ? a?.textfieldSize : b?.textfieldSize) ??
            ZeroTextfieldSize.small,
        focusedBorderColor:
            Color.lerp(a?.focusedBorderColor, b?.focusedBorderColor, t)!,
        focusedColor: Color.lerp(a?.focusedColor, b?.focusedColor, t)!);
  }

  ZeroTextfieldStyleSet merge(ZeroTextfieldStyleSet? other) {
    if (other == null) return this;
    return ZeroTextfieldStyleSet._(
      filled: filled.merge(other.filled),
      outline: outline.merge(other.outline),
      rounded: rounded.merge(other.rounded),
      underline: underline.merge(other.underline),
      defaultDecorationType: other.defaultDecorationType,
      textfieldSize: other.textfieldSize,
      focusedBorderColor: other.focusedBorderColor,
      focusedColor: other.focusedColor,
    );
  }

  factory ZeroTextfieldStyleSet.fromDecorationType({
    ZeroTextfieldStyle? outline,
    ZeroTextfieldStyle? rounded,
    ZeroTextfieldStyle? filled,
    ZeroTextfieldStyle? underline,
    required InputDecorationType defaultDecorationType,
    ZeroTextfieldSize? textfieldSize,
    Color? focusedBorderColor,
    Color? focusedColor,
  }) {
    return ZeroTextfieldStyleSet._(
      defaultDecorationType: defaultDecorationType,
      textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
      outline: ZeroTextfieldStyle.outline(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      filled: ZeroTextfieldStyle.fill(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      underline: ZeroTextfieldStyle.underline(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      rounded: ZeroTextfieldStyle.rounded(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      focusedBorderColor: focusedBorderColor,
      focusedColor: focusedColor,
    );
  }

  factory ZeroTextfieldStyleSet.fallback({
    ZeroTextfieldStyle? outline,
    ZeroTextfieldStyle? rounded,
    ZeroTextfieldStyle? filled,
    ZeroTextfieldStyle? underline,
    required InputDecorationType defaultDecorationType,
    required ZeroTextfieldSize textfieldSize,
    required Color focusedBorderColor,
    required Color focusedColor,
  }) {
    return ZeroTextfieldStyleSet._(
      defaultDecorationType: defaultDecorationType,
      textfieldSize: textfieldSize,
      outline: ZeroTextfieldStyle.outline(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      filled: ZeroTextfieldStyle.fill(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      underline: ZeroTextfieldStyle.underline(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      rounded: ZeroTextfieldStyle.rounded(
          focusedBorderColor: focusedBorderColor, focusedColor: focusedColor),
      focusedBorderColor: focusedBorderColor,
      focusedColor: focusedColor,
    );
  }
}

const double _kDefaultSmallTextfieldRadius = 8.0;
const double _kDefaultBorderWidth = 1.0;

class ZeroTextfieldStyle {
  final InputDecorationType inputDecorationType;
  final ZeroTextfieldSize textfieldSize;
  final bool enabled;
  final bool error;
  final Color focusedBorderColor;
  final Color focusedColor;
  final Color? fillColor;
  final BorderRadius? radius;

  ZeroTextfieldStyle({
    required this.inputDecorationType,
    required this.textfieldSize,
    required this.focusedBorderColor,
    required this.focusedColor,
    this.radius,
    this.fillColor,
    this.enabled = true,
    this.error = false,
  });

  factory ZeroTextfieldStyle.outline({
    ZeroTextfieldSize? textfieldSize,
    Color? focusedBorderColor,
    BorderRadius? radius,
    Color? focusedColor,
  }) {
    return ZeroTextfieldStyle(
        inputDecorationType: InputDecorationType.outline,
        textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
        focusedBorderColor: focusedBorderColor ?? ZeroColors.primary,
        radius: radius ??
            const BorderRadius.all(
                Radius.circular(_kDefaultSmallTextfieldRadius)),
        focusedColor: focusedBorderColor ?? ZeroColors.primary);
  }

  factory ZeroTextfieldStyle.rounded(
          {ZeroTextfieldSize? textfieldSize,
          Color? focusedBorderColor,
          Color? focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.rounded,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor ?? ZeroColors.primary,
          focusedColor: focusedBorderColor ?? ZeroColors.primary);

  factory ZeroTextfieldStyle.fill(
          {ZeroTextfieldSize? textfieldSize,
          Color? focusedBorderColor,
          Color? fillColor,
          Color? focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.fill,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor ?? ZeroColors.primary,
          fillColor: fillColor ?? ZeroColors.primary.lighten(0.12),
          focusedColor: focusedBorderColor ?? ZeroColors.primary);

  factory ZeroTextfieldStyle.underline(
          {ZeroTextfieldSize? textfieldSize,
          Color? focusedBorderColor,
          Color? focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.underline,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor ?? ZeroColors.primary,
          focusedColor: focusedBorderColor ?? ZeroColors.primary);

  Color getFillColor({
    required bool enabled,
    required bool error,
  }) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return ZeroColors.white;
      case InputDecorationType.rounded:
        return ZeroColors.white;
      case InputDecorationType.underline:
        return ZeroColors.white;
      case InputDecorationType.fill:
        if (!enabled) return ZeroColors.neutral[3];
        return !error
            ? fillColor ?? ZeroColors.primary[1]
            : ZeroColors.dustRed[1];
    }
  }

  bool get filled => inputDecorationType == InputDecorationType.fill;

  Color get borderColor => focusedBorderColor;

  BorderRadius borderRadius(ZeroTextfieldSize sizeType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return const BorderRadius.all(
            Radius.circular(_kDefaultSmallTextfieldRadius));
      case InputDecorationType.rounded:
        return BorderRadius.circular(sizeType.roundedRadius);
      case InputDecorationType.underline:
        return const BorderRadius.all(Radius.zero);
      case InputDecorationType.fill:
        return const BorderRadius.only(
            topLeft: Radius.circular(_kDefaultSmallTextfieldRadius),
            topRight: Radius.circular(_kDefaultSmallTextfieldRadius));
    }
  }

  double get borderWidth {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return _kDefaultBorderWidth;
      case InputDecorationType.rounded:
        return 1;
      case InputDecorationType.underline:
        return 1;
      case InputDecorationType.fill:
        return 1;
    }
  }

  InputBorder border(ZeroTextfieldSize sizeType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.rounded:
        return OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.underline:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.fill:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
    }
  }

  Color floatingLabelColor(bool error) {
    return !error ? focusedBorderColor : ZeroColors.dustRed[7];
  }

  Color? iconColor(bool error) {
    return !error ? null : ZeroColors.dustRed[7];
  }

  InputBorder focusedBorder(ZeroTextfieldSize sizeType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: focusedBorderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.rounded:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: focusedBorderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.underline:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: focusedBorderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.fill:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 1),
            borderRadius: borderRadius(sizeType));
    }
  }

  InputBorder disabledBorder(ZeroTextfieldSize sizeType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral[5], width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.rounded:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral[5], width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.underline:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral[5], width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.fill:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral[7], width: borderWidth),
            borderRadius: borderRadius(sizeType));
    }
  }

  InputBorder errorBorder(ZeroTextfieldSize sizeType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return OutlineInputBorder(
            borderSide: BorderSide(color: ZeroColors.dustRed[7], width: 0),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.rounded:
        return OutlineInputBorder(
            borderSide: BorderSide(color: ZeroColors.dustRed[7], width: 0),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.underline:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: ZeroColors.dustRed[7], width: 0),
            borderRadius: borderRadius(sizeType));
      case InputDecorationType.fill:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: ZeroColors.dustRed[7], width: 0),
            borderRadius: borderRadius(sizeType));
    }
  }

  TextStyle textStyle(bool enabled) {
    Color fontColor = enabled ? ZeroColors.neutral[10] : ZeroColors.neutral[7];
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return TextStyle(color: fontColor, fontSize: 16);
      case InputDecorationType.rounded:
        return TextStyle(color: fontColor, fontSize: 16);
      case InputDecorationType.fill:
        return TextStyle(color: fontColor, fontSize: 16);
      case InputDecorationType.underline:
        return TextStyle(color: fontColor, fontSize: 16);
    }
  }

  TextStyle floatingLabelStyle({required bool enabled, required bool error}) {
    Color fontColor =
        !enabled ? ZeroColors.neutral[7] : floatingLabelColor(error);

    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return TextStyle(color: fontColor, fontSize: 16);
      case InputDecorationType.rounded:
        return TextStyle(color: fontColor, fontSize: 16);
      case InputDecorationType.fill:
        return TextStyle(color: fontColor, fontSize: 16);
      case InputDecorationType.underline:
        return TextStyle(color: fontColor, fontSize: 16);
    }
  }

  FloatingLabelBehavior get floatingLabelBehavior => FloatingLabelBehavior.auto;

  TextStyle get errorStyle => TextStyle(
        fontSize: 11,
        color: ZeroColors.dustRed[7],
      );

  bool get alignLabelWithHint => textfieldSize == ZeroTextfieldSize.multiline;

  ZeroTextfieldStyle copyWith(
      {InputDecorationType? inputDecorationType,
      ZeroTextfieldSize? textfieldSize,
      bool? enabled,
      bool? error,
      Color? focusedBorderColor,
      Color? focusedColor,
      Color? fillColor}) {
    return ZeroTextfieldStyle(
        inputDecorationType: inputDecorationType ?? this.inputDecorationType,
        textfieldSize: textfieldSize ?? this.textfieldSize,
        enabled: enabled ?? this.enabled,
        error: error ?? this.error,
        focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
        focusedColor: focusedColor ?? this.focusedColor,
        fillColor: fillColor ?? this.fillColor);
  }

  ZeroTextfieldStyle merge(ZeroTextfieldStyle? other) {
    if (other == null) return this;

    return ZeroTextfieldStyle(
      inputDecorationType: other.inputDecorationType,
      textfieldSize: other.textfieldSize,
      enabled: other.enabled,
      error: other.error,
      focusedBorderColor: other.focusedBorderColor,
      focusedColor: other.focusedColor,
      fillColor: other.fillColor,
    );
  }

  InputDecorationTheme toInputDecorationTheme() {
    return InputDecorationTheme(
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: floatingLabelStyle(enabled: enabled, error: error),
      alignLabelWithHint: alignLabelWithHint,
      labelStyle: textStyle(enabled),
      isDense: textfieldSize.isDense,
      contentPadding: textfieldSize.contentPadding,
      focusColor: focusedColor,
      fillColor: getFillColor(enabled: enabled, error: error),
      filled: filled,
      focusedBorder: focusedBorder(textfieldSize),
      border: border(textfieldSize),
      disabledBorder: disabledBorder(textfieldSize),
      errorBorder: errorBorder(textfieldSize),
      focusedErrorBorder: errorBorder(textfieldSize),
    );
  }

  InputDecoration toInputDecoration() {
    return InputDecoration(
      floatingLabelAlignment: FloatingLabelAlignment.start,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelStyle: floatingLabelStyle(enabled: enabled, error: error),
      alignLabelWithHint: alignLabelWithHint,
      labelStyle: textStyle(enabled),
      isDense: textfieldSize.isDense,
      contentPadding: textfieldSize.contentPadding,
      focusColor: focusedColor,
      fillColor: getFillColor(enabled: enabled, error: error),
      filled: filled,
      focusedBorder: focusedBorder(textfieldSize),
      border: border(textfieldSize),
      disabledBorder: disabledBorder(textfieldSize),
      errorBorder: errorBorder(textfieldSize),
      focusedErrorBorder: errorBorder(textfieldSize),
    );
  }

  static ZeroTextfieldStyle lerp(
    ZeroTextfieldStyle? a,
    ZeroTextfieldStyle? b,
    double t,
  ) {
    return ZeroTextfieldStyle(
      inputDecorationType:
          (t < 0.5 ? a?.inputDecorationType : b?.inputDecorationType) ??
              InputDecorationType.outline,
      textfieldSize: (t < 0.5 ? a?.textfieldSize : b?.textfieldSize) ??
          ZeroTextfieldSize.small,
      enabled: (t < 0.5 ? a?.enabled : b?.enabled) ?? false,
      error: (t < 0.5 ? a?.error : b?.error) ?? false,
      focusedBorderColor:
          Color.lerp(a?.focusedBorderColor, b?.focusedBorderColor, t) ??
              Colors.transparent,
      focusedColor:
          Color.lerp(a?.focusedColor, b?.focusedColor, t) ?? Colors.transparent,
      fillColor: Color.lerp(a?.fillColor, b?.fillColor, t),
    );
  }
}
