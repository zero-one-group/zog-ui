part of 'zero_skeleton.dart';

class _ZeroShimmer extends StatefulWidget {
  const _ZeroShimmer({
    Key? key,
    this.shimmerGradient,
    this.darkShimmerGradient,
    this.themeMode,
    this.duration,
    this.child,
  }) : super(key: key);

  final LinearGradient? shimmerGradient;
  final LinearGradient? darkShimmerGradient;

  /// Theme mode whether it is light or dark
  final ThemeMode? themeMode;

  /// How log the shimmer appears
  final Duration? duration;

  final Widget? child;

  @override
  ZeroShimmerState createState() => ZeroShimmerState();
}

class ZeroShimmerState extends State<_ZeroShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(
          min: -2.0,
          max: 2,
          period: widget.duration ?? const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  ThemeMode get _appThemeMode => context.theme.brightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;

  LinearGradient get gradient => ((widget.themeMode ??
              ZeroSkeletonTheme.of(context)?.themeMode ??
              _appThemeMode) ==
          ThemeMode.dark)
      ? _darkGradient
      : _lightGradient;

  LinearGradient get _lightGradient =>
      widget.shimmerGradient ??
      ZeroSkeletonTheme.of(context)?.shimmerGradient ??
      shimmerGradient;

  LinearGradient get _darkGradient =>
      widget.darkShimmerGradient ??
      ZeroSkeletonTheme.of(context)?.darkShimmerGradient ??
      darkShimmerGradient;

  LinearGradient get currentGradient => LinearGradient(
        colors: gradient.colors,
        stops: gradient.stops,
        begin: gradient.begin,
        end: gradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );

  bool get isSized => context.findRenderObject() != null
      ? (context.findRenderObject() as RenderBox).hasSize
      : false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child != null
        ? _Shimmer(
            shimmer: this,
            child: widget.child!,
          )
        : const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class _Shimmer extends InheritedWidget {
  final ZeroShimmerState shimmer;
  const _Shimmer({
    Key? key,
    required Widget child,
    required this.shimmer,
  }) : super(key: key, child: child);

  static ZeroShimmerState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_Shimmer>()?.shimmer;

  @override
  bool updateShouldNotify(_Shimmer oldWidget) => shimmer != oldWidget.shimmer;
}
