import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroBadge extends StatelessWidget {
  const ZeroBadge({
    Key? key,
    this.position = ZeroBadgePosition.topRight,
    this.type = ZeroBadgeType.standard,
    required this.child,
    this.childSize = 24,
    this.badgeText,
    this.onTap,
    this.stackFit = StackFit.loose,
    this.badgeColor,
    this.badgeTextColor = Colors.white,
    this.padding,
  }) : super(key: key);

  /// Allows to set custom position of badge according to [child].
  ///
  /// By default value is [ZeroBadgePosition.topRight]
  final ZeroBadgePosition position;

  /// Allows to set custom type of badge according to [child].
  ///
  /// By default value is [ZeroBadgeType.standard]
  final ZeroBadgeType type;

  /// The badge child, e.g. cart icon button.
  final Widget child;

  /// Important set this childSize if custom child,
  /// This childSize is taken from the width of the child.
  ///
  /// By default the childSize value is 24
  final double childSize;

  /// Allows for custom text on the badge indicator.
  /// Important, this indicator text only appears if the type is not [ZeroBadgeType.dot]
  ///
  /// If types:
  ///
  /// - [ZeroBadgeType.standard] => [badgeText] will display the entire text
  /// - [ZeroBadgeType.number] => [badgeText] will display a maximum of 2-3 chars,
  ///   and the recommendation for the number type is only to fill in the counter value number
  /// - [ZeroBadgeType.dot] => [badgeText] will not be displayed
  final String? badgeText;

  /// Will be called when you tap on the badge or child
  /// Important: if the badge is outside of the child
  /// the additional padding will be applied to make the full badge clickable
  final VoidCallback? onTap;

  /// Allows to edit fit parameter to [Stack] widget.
  /// The default value is [StackFit.loose].
  final StackFit stackFit;

  /// The color that will be displayed on the badge indicator
  final Color? badgeColor;

  /// The color that will be displayed on the text of badge indicator
  final Color badgeTextColor;

  /// The padding of child with indicator
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    /// Get badge color, with fallback from primary color current theme
    final color = badgeColor ?? context.theme.primaryColor;

    // TODO: @wisnu
    final adaptivePadding = padding ?? position.childPadding();
    final adaptiveChildSize =
        childSize + adaptivePadding.horizontal - adaptivePadding.horizontal / 2;

    return Stack(
      clipBehavior: Clip.none,
      fit: stackFit,
      children: [
        // Build badge child
        GestureDetector(
          onTap: onTap,
          child: child,
        ),
        // Build badge indicator
        _BadgePositioned(
          position: position,
          type: type,
          childSize: adaptiveChildSize,
          childPadding: adaptiveChildSize,
          badge: GestureDetector(
            onTap: onTap,
            child: _Badge(
              color: color,
              type: type,
              badgeText: badgeText ?? '',
              textColor: badgeTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

/// Build a badge widget, and change its position according to the type and position type
class _BadgePositioned extends StatelessWidget {
  const _BadgePositioned({
    required this.badge,
    required this.position,
    required this.type,
    required this.childSize,
    required this.childPadding,
  });

  /// The Badge widget that will be built on this widget is in accordance with its position
  final Widget badge;

  /// Type to determine the position
  final ZeroBadgePosition position;

  /// The type of the badge
  final ZeroBadgeType type;

  /// The size of the child in the widget [ZeroBadge]
  final double childSize;

  /// The padding of child
  final double childPadding;

  @override
  Widget build(BuildContext context) {
    final left = position.left(
      childSize: childSize,
      type: type,
      childPadding: childPadding,
    );
    final right = position.right(
      childSize: childSize,
      type: type,
      childPadding: childPadding,
    );

    return Positioned(
      top: position.top(childPadding),
      bottom: position.bottom(childPadding),
      // If the type is standard, need to reverse the position between left and right
      left: type != ZeroBadgeType.dot ? right : left,
      right: type != ZeroBadgeType.dot ? left : right,
      child: badge,
    );
  }
}

/// Build a badge indicator widget base on type of [ZeroBadge]
class _Badge extends StatelessWidget {
  const _Badge({
    required this.color,
    required this.textColor,
    required this.type,
    required this.badgeText,
  });

  /// background color badge indicator
  final Color color;

  /// Color of text badge indicator
  final Color textColor;

  /// The type of the badge
  final ZeroBadgeType type;

  /// The text that will be displayed on the badge indicator,
  /// except for the type [ZeroBadgeType.dot]
  final String badgeText;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ZeroBadgeType.dot:
        // Build dot type badge
        return Container(
          width: 8,
          height: 9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        );
      case ZeroBadgeType.number:
        // Build number type badge
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          alignment: Alignment.center,
          child: Text(
            badgeText,
            style: TextStyle(color: textColor, fontSize: 11),
            maxLines: 1,
          ),
        );
      default:
        // Build standard type badge
        return Container(
          constraints: const BoxConstraints(
            maxHeight: 20,
            minHeight: 20,
            minWidth: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: color,
          ),
          alignment: Alignment.center,
          child: Text(
            badgeText,
            style: TextStyle(color: textColor, fontSize: 11),
          ),
        );
    }
  }
}
