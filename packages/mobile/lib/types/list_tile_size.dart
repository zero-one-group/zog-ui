import 'package:flutter/material.dart';

/// Enum for [ZeroListTile] size types
enum ZeroListTileSizeType {
  small,
  large;

  /// Getting the content padding of [ZeroListTile] preference according to the type and theme configuration
  EdgeInsetsGeometry contentPadding() {
    // TODO: identify content padding base on Theme
    switch (this) {
      case ZeroListTileSizeType.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 16);
      case ZeroListTileSizeType.large:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 16);
    }
  }

  /// Getting the font size preference according to the type and theme configuration
  double fontSize() {
    // TODO: identify font size base on Theme
    switch (this) {
      case ZeroListTileSizeType.small:
        return 14;
      case ZeroListTileSizeType.large:
        return 16;
    }
  }
}
