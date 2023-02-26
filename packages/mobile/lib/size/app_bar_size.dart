enum ZeroAppBarSize {
  /// [ZeroAppBar] smallest size
  ///
  /// The title will be on the top side next to leading and actions
  small,

  /// The title will be below with a spacer
  medium,

  /// The title will be below with a more spacer
  large;

  /// Get height / size by type of [ZeroAppBarSize]
  double get getSize {
    switch (this) {
      case small:
        return 64;
      case medium:
        return 110;
      case large:
        return 152;
    }
  }
}
