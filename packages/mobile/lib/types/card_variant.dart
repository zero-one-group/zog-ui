import 'package:flutter/material.dart';

import '../zog_ui.dart';

enum ZeroCardVariant {
  outline,
  filled,
  elevated;

  BoxDecoration get decoration {
    switch (this) {
      case ZeroCardVariant.outline:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ZeroColors.neutral[5]),
        );
      case ZeroCardVariant.filled:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        );
      case ZeroCardVariant.elevated:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        );
    }
  }
}
