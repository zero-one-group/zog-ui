import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/types/textfield/size_type.dart';

enum InputDecorationType {
  outline,
  round,
  underline,
  fill,
  ;

  Color fillColor({
    required bool enabled,
    required bool error,
  }) {
    switch (this) {
      case outline:
        return ZeroColors.white;
      case round:
        return ZeroColors.white;
      case underline:
        return ZeroColors.white;
      case fill:
        if (!enabled) return ZeroColors.neutral3;
        return !error ? ZeroColors.primary1 : ZeroColors.dustRed1;
    }
  }

  bool get filled {
    switch (this) {
      case outline:
        return false;
      case round:
        return false;
      case underline:
        return false;
      case fill:
        return true;
    }
  }

  Color get focusedColor {
    switch (this) {
      case outline:
        return ZeroColors.primary7;
      case round:
        return ZeroColors.primary7;
      case underline:
        return ZeroColors.primary7;
      case fill:
        return ZeroColors.primary7;
    }
  }

  Color get borderColor {
    switch (this) {
      case outline:
        return ZeroColors.primary7;
      case round:
        return ZeroColors.primary7;
      case underline:
        return ZeroColors.primary7;
      case fill:
        return ZeroColors.primary7;
    }
  }

  BorderRadius borderRadius(TextfieldSizeType sizeType) {
    switch (this) {
      case outline:
        return const BorderRadius.all(Radius.circular(8));
      case round:
        return BorderRadius.circular(sizeType.roundedRadius);
      case underline:
        return const BorderRadius.all(Radius.zero);
      case fill:
        return const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8));
    }
  }

  double get borderWidth {
    switch (this) {
      case outline:
        return 1;
      case round:
        return 1;
      case underline:
        return 1;
      case fill:
        return 1;
    }
  }

  InputBorder border(TextfieldSizeType sizeType) {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case round:
        return OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case underline:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case fill:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
    }
  }

  Color get focusedBordeColor {
    switch (this) {
      case outline:
        return ZeroColors.primary7;
      case round:
        return ZeroColors.primary7;
      case underline:
        return ZeroColors.primary7;
      case fill:
        return ZeroColors.primary7;
    }
  }

  Color floatingLabelColor(bool error) {
    switch (this) {
      case outline:
        return !error ? ZeroColors.primary7 : ZeroColors.dustRed7;
      case round:
        return !error ? ZeroColors.primary7 : ZeroColors.dustRed7;
      case fill:
        return !error ? ZeroColors.primary7 : ZeroColors.dustRed7;
      case underline:
        return !error ? ZeroColors.primary7 : ZeroColors.dustRed7;
    }
  }

  Color? iconColor(bool error) {
    switch (this) {
      case outline:
        return !error ? null : ZeroColors.dustRed7;
      case round:
        return !error ? null : ZeroColors.dustRed7;
      case fill:
        return !error ? null : ZeroColors.dustRed7;
      case underline:
        return !error ? null : ZeroColors.dustRed7;
    }
  }

  InputBorder focusedBorder(TextfieldSizeType sizeType) {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: focusedBordeColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case round:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: focusedBordeColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case underline:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: focusedBordeColor, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case fill:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: focusedBordeColor, width: 1),
            borderRadius: borderRadius(sizeType));
    }
  }

  InputBorder disabledBorder(TextfieldSizeType sizeType) {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral5, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case round:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral5, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case underline:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral5, width: borderWidth),
            borderRadius: borderRadius(sizeType));
      case fill:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: ZeroColors.neutral7, width: borderWidth),
            borderRadius: borderRadius(sizeType));
    }
  }

  InputBorder errorBorder(TextfieldSizeType sizeType) {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius(sizeType));
      case round:
        return OutlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius(sizeType));
      case underline:
        return UnderlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius(sizeType));
      case fill:
        return UnderlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius(sizeType));
    }
  }

  TextStyle textStyle(bool enabled) {
    Color fontColor = enabled ? ZeroColors.neutral10 : ZeroColors.neutral7;
    switch (this) {
      case outline:
        return TextStyle(color: fontColor, fontSize: 16);
      case round:
        return TextStyle(color: fontColor, fontSize: 16);
      case fill:
        return TextStyle(color: fontColor, fontSize: 16);
      case underline:
        return TextStyle(color: fontColor, fontSize: 16);
    }
  }

  TextStyle floatingLabelStyle({required bool enabled, required bool error}) {
    Color fontColor =
        !enabled ? ZeroColors.neutral7 : floatingLabelColor(error);

    switch (this) {
      case outline:
        return TextStyle(color: fontColor, fontSize: 16);
      case round:
        return TextStyle(color: fontColor, fontSize: 16);
      case fill:
        return TextStyle(color: fontColor, fontSize: 16);
      case underline:
        return TextStyle(color: fontColor, fontSize: 16);
    }
  }

  FloatingLabelBehavior get floatingLabelBehavior => FloatingLabelBehavior.auto;

  TextStyle get errorStyle => const TextStyle(
        fontSize: 11,
        color: ZeroColors.dustRed7,
      );

  bool? get alignLabelWithHint {
    switch (this) {
      case outline:
        return false;
      case round:
        return false;
      case fill:
        return false;
      case underline:
        return false;
    }
  }
}
