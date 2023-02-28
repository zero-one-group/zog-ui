import 'package:flutter/widgets.dart';
import 'package:zog_ui/zog_ui.dart';

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
  bottomRight;

  /// Calculation of the top position on the badge
  ///
  /// If [ZeroBadgePosition] is top, it will `return 0`, otherwise it will `return null`
  double? top(double childPadding) =>
      this == topLeft || this == topRight ? -(childPadding / 2) : null;

  /// Calculation of the bottom position on the badge
  ///
  /// If [ZeroBadgePosition] is bottom, it will `return 0`, otherwise it will `return null`
  double? bottom(double childPadding) =>
      this == bottomLeft || this == bottomRight ? -(childPadding / 2) : null;

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
  ///   childPadding (double): The padding of the child widget.
  ///
  /// Returns:
  ///   A double value.
  double? left({
    required double childSize,
    required ZeroBadgeType type,
    required double childPadding,
  }) {
    if (this == topLeft || this == bottomLeft) {
      // Check if type is standard return [childSize]
      return type != ZeroBadgeType.dot ? childSize - (childPadding / 2) : 0;
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
  ///   childPadding (double): The padding of the child widget.
  ///
  /// Returns:
  ///   The return value is a double? (nullable double)
  double? right({
    required double childSize,
    required ZeroBadgeType type,
    required double childPadding,
  }) {
    if (this == topRight || this == bottomRight) {
      // Check if type is standard return [childSize]
      return type != ZeroBadgeType.dot ? childSize - (childPadding / 2) : 0;
    }

    return null;
  }

  /// Returns the padding value of the child widget in the badge widget [ZeroBadge]
  EdgeInsetsGeometry childPadding() => const EdgeInsets.all(12);
}
