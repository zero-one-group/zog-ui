enum InputDecorationType {
  /// For outlined border with rounded edges
  outline,

  /// For fully rounded shape on the left and right side
  rounded,

  /// Underline without outline border and fill color
  underline,

  /// With fill color
  fill;

  @override
  String toString() => name;
}
