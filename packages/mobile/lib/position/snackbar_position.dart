import 'package:flutter/material.dart';

enum SnackbarPosition {
  top,
  bottom,
  center;

  Alignment get alignment {
    switch (this) {
      case SnackbarPosition.top:
        return Alignment.topCenter;
      case SnackbarPosition.bottom:
        return Alignment.bottomCenter;
      case SnackbarPosition.center:
        return Alignment.center;
    }
  }
}
