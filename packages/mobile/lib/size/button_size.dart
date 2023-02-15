import 'package:zero_ui_mobile/zero_ui_mobile.dart';

enum ZeroButtonSize {
  /// [ZeroButton] smallest size
  small,
  medium,
  large;

  /// Get size button icon by style
  double? getSize(ZeroButtonIconStyleSet style) {
    switch (this) {
      case large:
        return style.largeSize;
      case medium:
        return style.mediumSize;
      case small:
        return style.smallSize;
    }
  }

  double iconSizeCorrection(ZeroButtonIconStyleSet style) {
    switch (this) {
      case large:
        return 0;
      case medium:
        return -2;
      case small:
        return -4;
    }
  }
}
