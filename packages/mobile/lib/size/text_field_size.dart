import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zog_ui/zog_ui.dart';

enum ZeroTextfieldSize {
  small,
  large,
  multiline,
  ;

  /// TextField's height
  double get height {
    if (this == multiline) {
      return 112;
    } else if (this == large) {
      return 56;
    } else {
      return 48;
    }
  }

  /// Radius to form rounded shape [TextField]
  double get roundedRadius => height / 2;

  EdgeInsets get contentPadding {
    if (this == multiline) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 22);
    } else if (this == large) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 22);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  bool get isDense => false;

  Widget? prefixIcon(Widget? prefixIcon, {required bool error}) {
    if (prefixIcon == null) return null;

    return prefixIcon;
  }

  Widget? suffixIcon(Widget? suffixIcon, {required bool error}) {
    // default suffixIcon when error
    if (error && suffixIcon == null) {
      return IconButton(
          icon: SvgPicture.asset(Assets.icons.errorDefault,
              package: 'zog_ui', color: ZeroColors.dustRed[7]),
          onPressed: null);
    }

    return suffixIcon;
  }
}
