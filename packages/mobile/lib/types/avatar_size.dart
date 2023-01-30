import 'package:flutter/material.dart';

enum AvatarSize {
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
  ;

  double get avatarDiameter {
    switch (this) {
      case xxs:
        return 16.0;
      case xs:
        return 24.0;
      case s:
        return 32.0;
      case m:
        return 48.0;
      case l:
        return 64.0;
      case xl:
        return 96.0;
      case xxl:
        return 128.0;
    }
  }

  double get avatarRadius => avatarDiameter / 2;

  double get badgeDiameter => avatarDiameter / 3;

  double get badgeRadius => avatarRadius / 3;

  /// The total width and heigth of [SizedBox] wrapping the [CircleAvatar].
  /// This is basically the avatarRadius plus the padding
  double get areaWidth => avatarDiameter + (avatarDiameter / 18);

  double get fontSize => avatarDiameter / 3;
}
