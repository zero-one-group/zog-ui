enum ButtonGroupType {
  filled, // 'default' can not be used since this is a dart keyword
  outlined,
  text,
  underline,
  ;

  bool get renderBorder {
    switch (this) {
      case filled:
      case outlined:
        return true;
      default:
        return false;
    }
  }
}
