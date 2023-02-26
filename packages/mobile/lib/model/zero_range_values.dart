class ZeroRangeValues {
  final int start;
  final int end;

  const ZeroRangeValues(this.start, this.end);

  @override
  String toString() {
    return 'ZeroRangeValues{start: $start, end: $end}';
  }

  ZeroRangeValues copyWith({int? start, int? end}) {
    return ZeroRangeValues(start ?? this.start, end ?? this.end);
  }
}
