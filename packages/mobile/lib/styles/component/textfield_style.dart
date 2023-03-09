import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

/// A styles set of [ZeroTextField] for all variants
class ZeroTextfieldStyleSet {
  final ZeroTextfieldStyle outline;
  final ZeroTextfieldStyle rounded;
  final ZeroTextfieldStyle filled;
  final ZeroTextfieldStyle underline;
  final InputDecorationType inputDecorationType;

  ZeroTextfieldStyleSet(
      {required this.outline,
      required this.rounded,
      required this.filled,
      required this.underline,
      required this.inputDecorationType});

  /// Main [ZeroTextfieldStyle] that would be applied globally
  ZeroTextfieldStyle get mainStyle {
    switch (inputDecorationType) {
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
    InputDecorationType? inputDecorationType,
  }) {
    return ZeroTextfieldStyleSet(
      outline: outline ?? this.outline,
      rounded: rounded ?? this.rounded,
      filled: filled ?? this.filled,
      underline: underline ?? this.underline,
      inputDecorationType: inputDecorationType ?? this.inputDecorationType,
    );
  }

  static ZeroTextfieldStyleSet lerp(
      ZeroTextfieldStyleSet? a, ZeroTextfieldStyleSet? b, double t) {
    return ZeroTextfieldStyleSet(
      filled: ZeroTextfieldStyle.lerp(a?.filled, b?.filled, t),
      rounded: ZeroTextfieldStyle.lerp(a?.rounded, b?.rounded, t),
      outline: ZeroTextfieldStyle.lerp(a?.outline, b?.outline, t),
      underline: ZeroTextfieldStyle.lerp(a?.underline, b?.underline, t),
      inputDecorationType:
          (t < 0.5 ? a?.inputDecorationType : b?.inputDecorationType) ??
              InputDecorationType.outline,
    );
  }

  ZeroTextfieldStyleSet merge(ZeroTextfieldStyleSet? other) {
    if (other == null) return this;
    return ZeroTextfieldStyleSet(
        filled: other.filled,
        outline: other.outline,
        rounded: other.rounded,
        underline: other.underline,
        inputDecorationType: other.inputDecorationType);
  }
}

class ZeroTextfieldStyle {
  final InputDecorationType inputDecorationType;
  final ZeroTextfieldSize textfieldSize;
  final bool enabled;
  final bool error;
  final Color focusedBorderColor;
  final Color focusedColor;
  final Color? fillColor;

  ZeroTextfieldStyle({
    required this.inputDecorationType,
    required this.textfieldSize,
    required this.focusedBorderColor,
    required this.focusedColor,
    this.fillColor,
    this.enabled = true,
    this.error = false,
  });

  factory ZeroTextfieldStyle.outline(
          {ZeroTextfieldSize? textfieldSize,
          required Color focusedBorderColor,
          required Color? focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.outline,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor,
          focusedColor: focusedBorderColor);

  factory ZeroTextfieldStyle.rounded(
          {ZeroTextfieldSize? textfieldSize,
          required Color focusedBorderColor,
          required Color focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.rounded,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor,
          focusedColor: focusedColor);

  factory ZeroTextfieldStyle.fill(
          {ZeroTextfieldSize? textfieldSize,
          required Color focusedBorderColor,
          required Color fillColor,
          required Color focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.fill,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor,
          fillColor: fillColor,
          focusedColor: focusedBorderColor);

  factory ZeroTextfieldStyle.underline(
          {ZeroTextfieldSize? textfieldSize,
          required Color focusedBorderColor,
          required Color focusedColor}) =>
      ZeroTextfieldStyle(
          inputDecorationType: InputDecorationType.underline,
          textfieldSize: textfieldSize ?? ZeroTextfieldSize.small,
          focusedBorderColor: focusedBorderColor,
          focusedColor: focusedBorderColor);

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

  bool get filled => true;

  Color get borderColor => focusedBorderColor;

  BorderRadius borderRadius(ZeroTextfieldSize sizeType) {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return const BorderRadius.all(Radius.circular(8));
      case InputDecorationType.rounded:
        return BorderRadius.circular(sizeType.roundedRadius);
      case InputDecorationType.underline:
        return const BorderRadius.all(Radius.zero);
      case InputDecorationType.fill:
        return const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8));
    }
  }

  double get borderWidth {
    switch (inputDecorationType) {
      case InputDecorationType.outline:
        return 1;
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
    debugPrint('copyWith fillColor $fillColor');
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
