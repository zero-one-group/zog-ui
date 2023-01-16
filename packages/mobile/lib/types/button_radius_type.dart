import 'package:flutter/material.dart';

enum ZeroButtonRadiusType {
  rectangle,
  curved,
  rounded,
  ;

  BorderRadius get borderRadius {
    switch (this) {
      case ButtonRadiusType.rectangle:
        return const BorderRadius.all(Radius.circular(0));
      case ButtonRadiusType.curved:
        return const BorderRadius.all(Radius.circular(8));
      case ButtonRadiusType.rounded:
        return const BorderRadius.all(Radius.circular(24));
    }
  }
}

/// [_buttonRadiusType] is the function to get [BorderRadius] from [ZeroButtonRadiusType
BorderRadius buttonRadiusSize(ZeroButtonRadiusType buttonType) {
  switch (buttonType) {
    case ZeroButtonRadiusType.rectangle:
      return const BorderRadius.all(Radius.circular(0));
    case ZeroButtonRadiusType.curved:
      return const BorderRadius.all(Radius.circular(8));
    case ZeroButtonRadiusType.rounded:
      return const BorderRadius.all(Radius.circular(24));
  }
}
