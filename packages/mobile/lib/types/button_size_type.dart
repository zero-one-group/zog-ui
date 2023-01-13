import 'package:flutter/material.dart';

enum ZeroButtonSizeType {
  small,
  medium,
  large,
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
