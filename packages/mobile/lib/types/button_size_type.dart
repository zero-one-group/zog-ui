import 'package:flutter/material.dart';

enum ButtonSizeType {
  small,
  medium,
  large,
  ;

  EdgeInsets get padding {
    switch (this) {
      case ButtonSizeType.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 4);
      case ButtonSizeType.medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 6);
      case ButtonSizeType.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 8);
    }
  }

  double get fontSize {
    switch (this) {
      case ButtonSizeType.small:
        return 12.0;
      case ButtonSizeType.medium:
        return 14.0;
      case ButtonSizeType.large:
        return 16.0;
    }
  }

  double get height {
    switch (this) {
      case small:
        return 24;
      case medium:
        return 32;
      case large:
        return 40;
      default:
        return 32;
    }
  }

  double get width {
    switch (this) {
      case small:
        return 56;
      case medium:
        return 76;
      case large:
        return 90;
      default:
        return 76;
    }
  }

  BorderRadius get borderRadius {
    switch (this) {
      case small:
        return const BorderRadius.all(Radius.circular(4));
      case medium:
        return const BorderRadius.all(Radius.circular(6));
      case large:
        return const BorderRadius.all(Radius.circular(8));
    }
  }
}
