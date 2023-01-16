import 'package:flutter/material.dart';

enum ZeroButtonSizeType {
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

  double get bottomBorderWidth {
    switch (this) {
      case small:
        return 1;
      case medium:
        return 2;
      case large:
        return 3;
      default:
        return 2;
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

/// [_defaultButtonHight] is function to get default height for [ZeroButton] when [height] is null
double defaultButtonHeight(ZeroButtonSizeType size) {
  switch (size) {
    case ZeroButtonSizeType.small:
      return 40.0;
    case ZeroButtonSizeType.medium:
      return 44.0;
    case ZeroButtonSizeType.large:
      return 48.0;
  }
}

/// [_paddingSize] is the function to get [EdgeInsets] from [ZeroButtonSizeType] when [padding] is not set
EdgeInsets paddingSize(ZeroButtonSizeType size) {
  switch (size) {
    case ZeroButtonSizeType.small:
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 0);
    case ZeroButtonSizeType.medium:
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 0);
    case ZeroButtonSizeType.large:
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 0);
  }
}

/// [_fontSize] is the function to get [double] for text size based on [ZeroButtonSizeType]
double fontSize(ZeroButtonSizeType size) {
  switch (size) {
    case ZeroButtonSizeType.small:
      return 12.0;
    case ZeroButtonSizeType.medium:
      return 14.0;
    case ZeroButtonSizeType.large:
      return 16.0;
  }
}
