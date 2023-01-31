extension XNum on num {
  /// Convert thousand `num` to K, million to M, and billion to B
  String get kmbFormat {
    if (this > 999 && this < 99999) {
      return "${(this / 1000).round()}K";
    } else if (this > 99999 && this < 999999) {
      return "${(this / 1000).round()}K";
    } else if (this > 999999 && this < 999999999) {
      return "${(this / 1000000).round()}M";
    } else if (this > 999999999) {
      return "${(this / 1000000000).round()}B";
    } else {
      return toString();
    }
  }
}
