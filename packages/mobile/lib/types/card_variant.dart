import 'package:flutter/material.dart';

import '../zero_ui_mobile.dart';

enum ZeroCardVariant {
  outline,
  filled,
  elevated;

  BoxDecoration get decoration {
    switch (this) {
      case ZeroCardVariant.outline:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ZeroColors.neutral[5]),
        );
      case ZeroCardVariant.filled:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        );
      case ZeroCardVariant.elevated:
        return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        );
    }
  }
}
