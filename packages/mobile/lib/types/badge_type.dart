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
