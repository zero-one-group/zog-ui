import 'package:flutter/material.dart';

enum ButtonRadiusType {
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
