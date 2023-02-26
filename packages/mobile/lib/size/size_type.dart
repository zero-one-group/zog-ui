import 'package:flutter/material.dart';

enum ZeroSizeType {
  small,
  medium,
  large,
  ;

  EdgeInsets get padding {
    switch (this) {
      case small:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 6);
      case medium:
        return const EdgeInsets.symmetric(horizontal: 30, vertical: 10);
      case large:
        return const EdgeInsets.symmetric(horizontal: 34, vertical: 12);
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

  double get iconSize {
    switch (this) {
      case small:
        return 16.0;
      case medium:
        return 22.0;
      case large:
        return 28.0;
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

  /// [defaultButtonHeight] is function to get default height for [ZeroButton] when [height] is null
  double get defaultButtonHeight {
    switch (this) {
      case small:
        return 40.0;
      case medium:
        return 44.0;
      case large:
        return 48.0;
    }
  }
}
