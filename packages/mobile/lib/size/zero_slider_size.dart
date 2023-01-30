enum ZeroSliderSize {
  small,
  large;

  double get lineWidth {
    switch (this) {
      case small:
        return 2;
      case large:
        return 4;
    }
  }

  double get thumbSize {
    switch (this) {
      case small:
        return 12;
      case large:
        return 20;
    }
  }

  double get thumbMargin {
    switch (this) {
      case small:
        return 12;
      case large:
        return 8;
    }
  }
}
