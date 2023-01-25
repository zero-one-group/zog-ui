import 'package:flutter/material.dart';

/// [ZeroBadge] component position options
///
/// This enum determine the position of the badge (top, bottom, right, left)
enum ZeroBadgePosition {
  /// Identify the badge with the top left
  topLeft,

  /// Identify the badge with the top right
  topRight,

  /// Identify the badge with the bottom left
  bottomLeft,

  /// Identify the badge with the bottom right
  bottomRight,
}

/// List of types on the badge
///
/// This enum is used in the [ZeroBadge] component
enum ZeroBadgeType {
  /// the text in the badge will be displayed in its entirety without being cut off
  standard,

  /// Use to display badges such as a counter or number.
  /// This type can only display a maximum of 3 chars
  number,

  /// Only displays the dot indicator on the badge
  dot,
}

/// Utility extension to get some value from [ZeroBadgePosition]
extension ZeroBadgePositionX on ZeroBadgePosition {
  /// Calculation of the top position on the badge
  ///
  /// If [ZeroBadgePosition] is top, it will `return 0`, otherwise it will `return null`
  double? get top =>
      this == ZeroBadgePosition.topLeft || this == ZeroBadgePosition.topRight
          ? 0
          : null;

  /// Calculation of the bottom position on the badge
  ///
  /// If [ZeroBadgePosition] is bottom, it will `return 0`, otherwise it will `return null`
  double? get bottom => this == ZeroBadgePosition.bottomLeft ||
          this == ZeroBadgePosition.bottomRight
      ? 0
      : null;

  /// Calculation of the left position on the badge
  ///
  /// If the position is topLeft or bottomLeft, return the childSize if the type is standard, otherwise
  /// return 0
  ///
  /// If [ZeroBadgePosition] is not left, return null
  ///
  /// Args:
  ///   childSize (double): The size of the child widget.
  ///   type (ZeroBadgeType): The type of badge.
  ///
  /// Returns:
  ///   A double value.
  double? left({required double childSize, required ZeroBadgeType type}) {
    if (this == ZeroBadgePosition.topLeft ||
        this == ZeroBadgePosition.bottomLeft) {
      // Check if type is standard return [childSize]
      return type == ZeroBadgeType.standard ? childSize : 0;
    }

    return null;
  }

  /// Calculation of the right position on the badge
  ///
  /// If the position is topRight or bottomRight, return the childSize if the type is standard,
  /// otherwise return 0
  ///
  /// If [ZeroBadgePosition] is not right, return null
  ///
  /// Args:
  ///   childSize (double): The size of the child widget.
  ///   type (ZeroBadgeType): The type of badge.
  ///
  /// Returns:
  ///   The return value is a double? (nullable double)
  double? right({required double childSize, required ZeroBadgeType type}) {
    if (this == ZeroBadgePosition.topRight ||
        this == ZeroBadgePosition.bottomRight) {
      // Check if type is standard return [childSize]
      return type == ZeroBadgeType.standard ? childSize : 0;
    }

    return null;
  }

  /// Returns the padding value of the child widget in the badge widget [ZeroBadge]
  EdgeInsetsGeometry childPadding() => const EdgeInsets.all(12);
}
