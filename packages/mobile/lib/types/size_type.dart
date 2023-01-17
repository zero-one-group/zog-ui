import 'package:flutter/material.dart';

enum ZeroSizeType {
  small,
  medium,
  large,
  ;

  EdgeInsets get padding {
    switch (this) {
      case small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 4);
      case medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 6);
      case large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 8);
    }
  }

  double get fontSize {
    switch (this) {
      case small:
        return 12.0;
      case medium:
        return 14.0;
      case large:
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

/// [defaultButtonHight] is function to get default height for [ZeroButton] when [height] is null
double defaultButtonHeight(ZeroSizeType size) {
  switch (size) {
    case ZeroSizeType.small:
      return 40.0;
    case ZeroSizeType.medium:
      return 44.0;
    case ZeroSizeType.large:
      return 48.0;
  }
}

/// [paddingSize] is the function to get [EdgeInsets] from [ZeroSizeType] when [padding] is not set
EdgeInsets paddingSize(ZeroSizeType size) {
  switch (size) {
    case ZeroSizeType.small:
      return const EdgeInsets.symmetric(horizontal: 12, vertical: 0);
    case ZeroSizeType.medium:
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 0);
    case ZeroSizeType.large:
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 0);
  }
}

/// [fontSize] is the function to get [double] for text size based on [ZeroSizeType]
double fontSize(ZeroSizeType size) {
  switch (size) {
    case ZeroSizeType.small:
      return 12.0;
    case ZeroSizeType.medium:
      return 14.0;
    case ZeroSizeType.large:
      return 16.0;
  }
}
