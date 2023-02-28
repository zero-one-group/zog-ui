import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class ZeroAvatarStyle with Diagnosticable {
  /// [backgroundColor] of the avatar when no image
  final Color? backgroundColor;

  /// Background color of the badge when no child
  final Color? badgeColor;

  /// Border color of the avatar
  final Color? borderColor;

  /// text Color of the initials
  final Color? initialColor;

  /// [TextStyle] of initial text
  final TextStyle? initialStyle;

  const ZeroAvatarStyle({
    this.backgroundColor,
    this.badgeColor,
    this.borderColor,
    this.initialColor,
    this.initialStyle,
  });

  /// A default value style of [ZeroAvatarStyle]
  static ZeroAvatarStyle fallback({
    Color? backgroundColor,
    Color? badgeColor,
    Color? borderColor,
    Color? initialColor,
    TextStyle? initialStyle,
  }) =>
      ZeroAvatarStyle(
        backgroundColor: backgroundColor ?? ZeroColors.primary,
        badgeColor: badgeColor ?? ZeroColors.polarGreen,
        borderColor: borderColor ?? ZeroColors.white,
        initialColor: initialColor ?? ZeroColors.white,
        initialStyle: initialStyle,
      );

  /// If the caller passes in a value for a parameter, use that value, otherwise use the value from this
  /// object.
  ///
  ///   A new instance of ZeroAvatarStyle with the same properties as the original instance, except for
  /// the properties that are explicitly overridden.
  ZeroAvatarStyle copyWith({
    Color? backgroundColor,
    Color? badgeColor,
    Color? borderColor,
    Color? initialColor,
    TextStyle? initialStyle,
  }) {
    return ZeroAvatarStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      badgeColor: badgeColor ?? this.badgeColor,
      borderColor: borderColor ?? this.borderColor,
      initialColor: initialColor ?? this.initialColor,
      initialStyle: initialStyle ?? this.initialStyle,
    );
  }

  ZeroAvatarStyle merge(ZeroAvatarStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      badgeColor: other.badgeColor,
      borderColor: other.borderColor,
      initialColor: other.initialColor,
      initialStyle: other.initialStyle,
    );
  }

  static ZeroAvatarStyle lerp(
      ZeroAvatarStyle? a, ZeroAvatarStyle? b, double t) {
    return ZeroAvatarStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      badgeColor: Color.lerp(a?.badgeColor, b?.badgeColor, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      initialColor: Color.lerp(a?.initialColor, b?.initialColor, t),
      initialStyle: TextStyle.lerp(a?.initialStyle, b?.initialStyle, t),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('badgeColor', badgeColor))
      ..add(ColorProperty('borderColor', borderColor))
      ..add(ColorProperty('initialColor', initialColor));
  }
}
