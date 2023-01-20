import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';

enum InputDecorationType {
  outline,
  underline,
  fill,
  ;

  Color fillColor({required bool error, required bool enabled}) {
    switch (this) {
      case outline:
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
      case underline:
        return false;
      case fill:
        return true;
    }
  }

  Color get focusedBorderolor {
    switch (this) {
      case outline:
        return ZeroColors.primary7;
      case underline:
        return ZeroColors.white;
      case fill:
        return ZeroColors.primary7;
    }
  }

  Color get borderolor {
    switch (this) {
      case outline:
        return ZeroColors.primary7;
      case underline:
        return ZeroColors.white;
      case fill:
        return ZeroColors.primary1;
    }
  }

  BorderRadius get borderRadius {
    switch (this) {
      case outline:
        return const BorderRadius.all(Radius.circular(8));
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
      case underline:
        return 1;
      case fill:
        return 1;
    }
  }

  InputBorder get border {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide: BorderSide(color: borderolor, width: borderWidth),
            borderRadius: borderRadius);
      case underline:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: borderolor, width: borderWidth),
            borderRadius: borderRadius);
      case fill:
        return UnderlineInputBorder(
            borderSide: BorderSide(color: borderolor, width: borderWidth),
            borderRadius: borderRadius);
    }
  }

  Color get focusedBordeColor {
    switch (this) {
      case outline:
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
      case fill:
        return !error ? ZeroColors.primary7 : ZeroColors.dustRed7;
      case underline:
        return !error ? ZeroColors.primary7 : ZeroColors.dustRed7;
    }
  }

  InputBorder get focusedBorder {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide:
                BorderSide(color: focusedBordeColor, width: borderWidth),
            borderRadius: borderRadius);
      case underline:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: focusedBordeColor, width: borderWidth),
            borderRadius: borderRadius);
      case fill:
        return UnderlineInputBorder(
            borderSide:
                BorderSide(color: focusedBordeColor, width: borderWidth),
            borderRadius: borderRadius);
    }
  }

  InputBorder get errorBorder {
    switch (this) {
      case outline:
        return OutlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius);
      case underline:
        return UnderlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius);
      case fill:
        return UnderlineInputBorder(
            borderSide: const BorderSide(color: ZeroColors.dustRed7, width: 0),
            borderRadius: borderRadius);
    }
  }
}
