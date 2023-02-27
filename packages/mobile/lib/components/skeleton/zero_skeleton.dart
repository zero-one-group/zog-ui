import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import 'zero_shimmer.dart';

/// Wrapper of your entire widget that need to have skeleton
/// Set your entire widget in [child] parameter and whether it shows
/// the [child] or it shows the [skeleton] depends on [isLoading]
class ZeroSkeleton extends StatefulWidget {
  const ZeroSkeleton({
    Key? key,
    required this.isLoading,
    required this.skeleton,
    required this.child,
    this.lightShimmerGradient,
    this.darkShimmerGradient,
    this.duration,
    this.themeMode,
  }) : super(key: key);

  /// If `true`, the `skeleton` would appear, otherwise the `child` would appear
  final bool isLoading;

  /// The [skeleton loadin]g widget
  final SkeletonItem skeleton;

  /// The content widget that will be shown if `isLoading` is `false`
  final Widget child;

  final LinearGradient? lightShimmerGradient;
  final LinearGradient? darkShimmerGradient;

  /// How fast or how slow the skeleton animates in very repetition
  final Duration? duration;

  /// Whether it is dark or light
  final ThemeMode? themeMode;

  @override
  State<ZeroSkeleton> createState() => _ZeroSkeletonState();
}

class _ZeroSkeletonState extends State<ZeroSkeleton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 150),
      child: widget.isLoading
          ? ZeroShimmer(
              shimmerGradient: widget.lightShimmerGradient,
              darkShimmerGradient: widget.darkShimmerGradient,
              duration: widget.duration,
              themeMode: widget.themeMode,
              child: _SkeletonWidget(
                isLoading: widget.isLoading,
                skeleton: widget.skeleton,
              ),
            )
          : widget.child,
    );
  }
}

class _SkeletonWidget extends StatefulWidget {
  const _SkeletonWidget({
    Key? key,
    required this.isLoading,
    required this.skeleton,
  }) : super(key: key);

  final bool isLoading;
  final Widget skeleton;

  @override
  __SkeletonWidgetState createState() => __SkeletonWidgetState();
}

class __SkeletonWidgetState extends State<_SkeletonWidget> {
  Listenable? _shimmerChanges;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Collect ancestor shimmer info.
    final shimmer = Shimmer.of(context)!;
    if (!shimmer.isSized) {
      // The ancestor Shimmer widget has not laid
      // itself out yet. Return an empty box.
      return const SizedBox();
    }
    final shimmerSize = shimmer.size;
    final gradient = shimmer.currentGradient;

    if (context.findRenderObject() == null) return const SizedBox();

    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.skeleton,
    );
  }
}

/// The flexible skeleton loading widget.
class SkeletonItem extends StatelessWidget {
  final Widget child;
  const SkeletonItem({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    if (Shimmer.of(context) == null) {
      return ZeroShimmer(
        child: _SkeletonWidget(
          isLoading: true,
          skeleton: child,
        ),
      );
    }

    return child;
  }
}

class ZeroSkeletonAvatar extends SkeletonItem {
  final SkeletonAvatarStyle style;
  ZeroSkeletonAvatar({
    Key? key,
    this.style = const SkeletonAvatarStyle(),
  }) : super(
          key: key,
          child: Padding(
            padding: style.padding,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: ((style.randomWidth != null && style.randomWidth!) ||
                          (style.randomWidth == null &&
                              (style.minWidth != null &&
                                  style.maxWidth != null)))
                      ? doubleInRange(
                          style.minWidth ??
                              ((style.maxWidth ?? constraints.maxWidth) / 3),
                          style.maxWidth ?? constraints.maxWidth)
                      : style.width,
                  height: ((style.randomHeight != null &&
                              style.randomHeight!) ||
                          (style.randomHeight == null &&
                              (style.minHeight != null &&
                                  style.maxHeight != null)))
                      ? doubleInRange(
                          style.minHeight ??
                              ((style.maxHeight ?? constraints.maxHeight) / 3),
                          style.maxHeight ?? constraints.maxHeight)
                      : style.height,
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    shape: style.shape,
                    borderRadius: style.shape != BoxShape.circle
                        ? style.borderRadius
                        : null,
                  ),
                );
              },
            ),
          ),
        );
}

class ZeroSkeletonLine extends SkeletonItem {
  final SkeletonLineStyle style;
  ZeroSkeletonLine({Key? key, this.style = const SkeletonLineStyle()})
      : super(
          key: key,
          child: Align(
            alignment: style.alignment,
            child: Padding(
                padding: style.padding,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: ((style.randomLength != null &&
                                  style.randomLength!) ||
                              (style.randomLength == null &&
                                  (style.minLength != null &&
                                      style.maxLength != null)))
                          ? doubleInRange(
                              style.minLength ??
                                  ((style.maxLength ?? constraints.maxWidth) /
                                      3),
                              style.maxLength ?? constraints.maxWidth)
                          : style.width,
                      height: style.height,
                      decoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                        borderRadius: style.borderRadius,
                      ),
                    );
                  },
                )),
          ),
        );
}

class ZeroSkeletonParagraph extends SkeletonItem {
  final SkeletonParagraphStyle style;

  ZeroSkeletonParagraph({
    Key? key,
    this.style = const SkeletonParagraphStyle(),
  }) : super(
          key: key,
          child: Padding(
            padding: style.padding,
            child: Column(
              children: [
                for (var i = 1; i <= style.lines; i++) ...[
                  ZeroSkeletonLine(
                    style: style.lineStyle,
                  ),
                  if (i != style.lines)
                    SizedBox(
                      height: style.spacing,
                    )
                ]
              ],
            ),
          ),
        );
}

class ZeroSkeletonListTile extends SkeletonItem {
  final bool hasLeading;
  final SkeletonAvatarStyle? leadingStyle;
  final SkeletonLineStyle? titleStyle;
  final bool hasSubtitle;
  final SkeletonLineStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final double? contentSpacing;
  final double? verticalSpacing;
  final Widget? trailing;

  ZeroSkeletonListTile({
    Key? key,
    this.hasLeading = true,
    this.leadingStyle, //  = const SkeletonAvatarStyle(padding: EdgeInsets.all(0)),
    this.titleStyle = const SkeletonLineStyle(
      padding: EdgeInsets.all(0),
      height: 22,
    ),
    this.subtitleStyle = const SkeletonLineStyle(
      height: 16,
      padding: EdgeInsetsDirectional.only(end: 32),
    ),
    this.hasSubtitle = false,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.contentSpacing = 8,
    this.verticalSpacing = 8,
    this.trailing,
  }) : super(
          key: key,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (hasLeading)
                  ZeroSkeletonAvatar(
                    style: leadingStyle ?? const SkeletonAvatarStyle(),
                  ),
                SizedBox(
                  width: contentSpacing,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ZeroSkeletonLine(
                        style: titleStyle ?? const SkeletonLineStyle(),
                      ),
                      if (hasSubtitle) ...[
                        SizedBox(
                          height: verticalSpacing,
                        ),
                        ZeroSkeletonLine(
                          style: subtitleStyle ?? const SkeletonLineStyle(),
                        ),
                      ]
                    ],
                  ),
                ),
                if (trailing != null) trailing,
              ],
            ),
          ),
        );
}

class ZeroSkeletonListView extends SkeletonItem {
  final SkeletonItem? item;
  final SkeletonItem Function(BuildContext, int)? itemBuilder;
  final int? itemCount;
  final bool scrollable;
  final EdgeInsets? padding;
  final double? spacing;

  ZeroSkeletonListView({
    Key? key,
    this.item,
    this.itemBuilder,
    this.itemCount,
    this.scrollable = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.spacing = 8,
  }) : super(
            key: key,
            child: ListView.builder(
              padding: padding,
              physics: scrollable ? null : const NeverScrollableScrollPhysics(),
              itemCount: itemCount,
              itemBuilder: itemBuilder ??
                  (context, index) =>
                      item ??
                      ZeroSkeletonListTile(
                        hasSubtitle: true,
                      ),
            ));
}

double doubleInRange(num start, num end) =>
    Random().nextDouble() * (end - start) + start;
