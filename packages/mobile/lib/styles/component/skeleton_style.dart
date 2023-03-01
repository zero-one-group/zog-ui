import 'package:flutter/material.dart';

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFD6D6E4),
    Color(0xFFD1D1DF),
    Color(0xFFD6D6E4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.0,
    0.3,
    0.5,
    0.7,
    1,
  ],
  begin: Alignment(-2.4, -0.2),
  end: Alignment(2.4, 0.2),
  tileMode: TileMode.clamp,
);

const darkShimmerGradient = LinearGradient(
  colors: [
    Color(0xFF222222),
    Color(0xFF242424),
    Color(0xFF2B2B2B),
    Color(0xFF242424),
    Color(0xFF222222),
  ],
  stops: [
    0.0,
    0.2,
    0.5,
    0.8,
    1,
  ],
  begin: Alignment(-2.4, -0.2),
  end: Alignment(2.4, 0.2),
  tileMode: TileMode.clamp,
);

class ZeroSkeletonStyleSet {
  final SkeletonAvatarStyle? avatar;
  final SkeletonLineStyle? line;
  final SkeletonListTileStyle? listTile;
  final SkeletonParagraphStyle? paragraph;

  const ZeroSkeletonStyleSet(
      {this.avatar, this.line, this.listTile, this.paragraph});

  ZeroSkeletonStyleSet copyWith({
    SkeletonAvatarStyle? avatar,
    SkeletonLineStyle? line,
    SkeletonListTileStyle? listTile,
    SkeletonParagraphStyle? paragraph,
  }) =>
      ZeroSkeletonStyleSet(
        avatar: avatar ?? this.avatar,
        line: line ?? this.line,
        listTile: listTile ?? this.listTile,
        paragraph: paragraph ?? this.paragraph,
      );

  ZeroSkeletonStyleSet merge(ZeroSkeletonStyleSet? other) {
    if (other == null) return this;

    return ZeroSkeletonStyleSet(
      avatar: avatar?.merge(other.avatar) ?? other.avatar,
      line: line?.merge(other.line) ?? other.line,
      listTile: listTile?.merge(other.listTile) ?? other.listTile,
      paragraph: paragraph?.merge(other.paragraph) ?? other.paragraph,
    );
  }

  static ZeroSkeletonStyleSet lerp(
      ZeroSkeletonStyleSet? a, ZeroSkeletonStyleSet? b, double t) {
    return ZeroSkeletonStyleSet(
      avatar: SkeletonAvatarStyle.lerp(a?.avatar, b?.avatar, t),
      line: SkeletonLineStyle.lerp(a?.line, b?.line, t),
      listTile: SkeletonListTileStyle.lerp(a?.listTile, b?.listTile, t),
      paragraph: SkeletonParagraphStyle.lerp(a?.paragraph, b?.paragraph, t),
    );
  }
}

class SkeletonAvatarStyle {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool? randomWidth;
  final double? minWidth;
  final double? maxWidth;
  final bool? randomHeight;
  final double? minHeight;
  final double? maxHeight;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;

  /// Skeleton Style for Avatar
  const SkeletonAvatarStyle({
    this.width = 48,
    this.height = 48,
    this.padding = const EdgeInsets.all(0),
    this.randomWidth,
    this.minWidth,
    this.maxWidth,
    this.randomHeight,
    this.minHeight,
    this.maxHeight,
    this.shape = BoxShape.rectangle,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  })  : assert(minWidth == null ||
            (minWidth > 0 && (maxWidth == null || maxWidth > minWidth))),
        assert(maxWidth == null ||
            (maxWidth > 0 && (minWidth == null || minWidth < maxWidth))),
        assert(minHeight == null ||
            (minHeight > 0 && (maxHeight == null || maxHeight > minHeight))),
        assert(maxHeight == null ||
            (maxHeight > 0 && (minHeight == null || minHeight < maxHeight)));

  SkeletonAvatarStyle copyWith({
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool? randomWidth,
    double? minWidth,
    double? maxWidth,
    bool? randomHeight,
    double? minHeight,
    double? maxHeight,
    BoxShape? shape,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SkeletonAvatarStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      randomWidth: randomWidth ?? this.randomWidth,
      randomHeight: randomHeight ?? this.randomHeight,
      minHeight: minHeight ?? this.minHeight,
      minWidth: minWidth ?? this.minWidth,
      maxHeight: maxHeight ?? this.maxHeight,
      maxWidth: maxWidth ?? this.maxWidth,
      shape: shape ?? this.shape,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  SkeletonAvatarStyle merge(SkeletonAvatarStyle? other) {
    return copyWith(
      width: other?.width,
      height: other?.height,
      padding: other?.padding,
      randomHeight: other?.randomHeight,
      randomWidth: other?.randomWidth,
      minHeight: other?.minHeight,
      minWidth: other?.minWidth,
      maxHeight: other?.maxHeight,
      maxWidth: other?.maxWidth,
      shape: other?.shape,
      borderRadius: other?.borderRadius,
    );
  }

  static SkeletonAvatarStyle lerp(
      SkeletonAvatarStyle? a, SkeletonAvatarStyle? b, double t) {
    return SkeletonAvatarStyle(
      width: t < 0.5 ? a?.width : b?.width,
      height: t < 0.5 ? a?.height : b?.height,
      padding:
          EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t) ?? EdgeInsets.zero,
      randomHeight: t < 0.5 ? a?.randomHeight : b?.randomHeight,
      randomWidth: t < 0.5 ? a?.randomWidth : b?.randomWidth,
      minHeight: t < 0.5 ? a?.minHeight : b?.minHeight,
      minWidth: t < 0.5 ? a?.minWidth : b?.minWidth,
      maxHeight: t < 0.5 ? a?.maxHeight : b?.maxHeight,
      maxWidth: t < 0.5 ? a?.maxWidth : b?.maxWidth,
      shape: (t < 0.5 ? a?.shape : b?.shape) ?? BoxShape.rectangle,
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }
}

/// Skeleton Style for line
class SkeletonLineStyle {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final bool? randomLength;
  final double? minLength;
  final double? maxLength;
  final AlignmentGeometry alignment;
  final BorderRadiusGeometry? borderRadius;

  const SkeletonLineStyle(
      {this.width = double.infinity,
      this.height = 18,
      this.padding = const EdgeInsets.all(0),
      this.randomLength,
      this.minLength,
      this.maxLength,
      this.borderRadius = const BorderRadius.all(Radius.circular(2)),
      this.alignment = AlignmentDirectional.centerStart})
      : assert(minLength == null ||
            (minLength > 0 && (maxLength == null || maxLength > minLength))),
        assert(maxLength == null ||
            (maxLength > 0 && (minLength == null || minLength < maxLength)));

  SkeletonLineStyle copyWith({
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    bool? randomLength,
    double? minLength,
    double? maxLength,
    AlignmentGeometry? alignment,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SkeletonLineStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      padding: padding ?? this.padding,
      randomLength: randomLength ?? this.randomLength,
      alignment: alignment ?? this.alignment,
      minLength: minLength ?? this.minLength,
      maxLength: maxLength ?? this.maxLength,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  SkeletonLineStyle merge(SkeletonLineStyle? other) {
    return copyWith(
      width: other?.width,
      height: other?.height,
      padding: other?.padding,
      alignment: other?.alignment,
      randomLength: other?.randomLength,
      minLength: other?.minLength,
      maxLength: other?.maxLength,
      borderRadius: other?.borderRadius,
    );
  }

  static SkeletonLineStyle lerp(
    SkeletonLineStyle? a,
    SkeletonLineStyle? b,
    double t,
  ) {
    return SkeletonLineStyle(
      width: t < 0.5 ? a?.width : b?.width,
      height: t < 0.5 ? a?.height : b?.height,
      padding:
          EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t) ?? EdgeInsets.zero,
      alignment: AlignmentGeometry.lerp(a?.alignment, b?.alignment, t) ??
          AlignmentDirectional.centerStart,
      randomLength: t < 0.5 ? a?.randomLength : b?.randomLength,
      minLength: t < 0.5 ? a?.minLength : b?.minLength,
      maxLength: t < 0.5 ? a?.maxLength : b?.maxLength,
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
    );
  }
}

/// Skeleton Style for paragraph text
class SkeletonParagraphStyle {
  final int lines;
  final EdgeInsetsGeometry padding;
  final double spacing;
  final SkeletonLineStyle lineStyle;

  const SkeletonParagraphStyle({
    this.lines = 3,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    this.spacing = 12,
    this.lineStyle = const SkeletonLineStyle(),
  });

  SkeletonParagraphStyle copyWith({
    int? lines,
    double? spacing,
    EdgeInsetsGeometry? padding,
    SkeletonLineStyle? lineStyle,
  }) {
    return SkeletonParagraphStyle(
      lines: lines ?? this.lines,
      padding: padding ?? this.padding,
      lineStyle: lineStyle ?? this.lineStyle,
      spacing: spacing ?? this.spacing,
    );
  }

  SkeletonParagraphStyle merge(SkeletonParagraphStyle? other) {
    return copyWith(
      lines: other?.lines,
      padding: other?.padding,
      lineStyle: other?.lineStyle,
      spacing: other?.spacing,
    );
  }

  static SkeletonParagraphStyle lerp(
    SkeletonParagraphStyle? a,
    SkeletonParagraphStyle? b,
    double t,
  ) {
    return SkeletonParagraphStyle(
      lines: (t < 0.5 ? a?.lines : b?.lines) ?? 3,
      padding:
          EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t) ?? EdgeInsets.zero,
      lineStyle: SkeletonLineStyle.lerp(a?.lineStyle, b?.lineStyle, t),
      spacing: (t < 0.5 ? a?.spacing : b?.spacing) ?? 12,
    );
  }
}

/// Skeleton Style for List Tile
class SkeletonListTileStyle {
  final bool hasLeading;
  final SkeletonAvatarStyle? leadingStyle;
  final SkeletonLineStyle? titleStyle;
  final bool hasSubtitle;
  final SkeletonLineStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final double? contentSpacing;
  final double? verticalSpacing;

  const SkeletonListTileStyle({
    this.hasLeading = true,
    this.leadingStyle,
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
  });

  SkeletonListTileStyle copyWith({
    bool? hasLeading,
    SkeletonAvatarStyle? leadingStyle,
    SkeletonLineStyle? titleStyle,
    bool? hasSubtitle,
    SkeletonLineStyle? subtitleStyle,
    EdgeInsetsGeometry? padding,
    double? contentSpacing,
    double? verticalSpacing,
  }) {
    return SkeletonListTileStyle(
      hasLeading: hasLeading ?? this.hasLeading,
      leadingStyle: leadingStyle ?? this.leadingStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      hasSubtitle: hasSubtitle ?? this.hasSubtitle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      padding: padding ?? this.padding,
      contentSpacing: contentSpacing ?? this.contentSpacing,
      verticalSpacing: verticalSpacing ?? this.verticalSpacing,
    );
  }

  SkeletonListTileStyle merge(SkeletonListTileStyle? other) {
    return copyWith(
      hasLeading: other?.hasLeading,
      leadingStyle:
          leadingStyle?.merge(other?.leadingStyle) ?? other?.leadingStyle,
      titleStyle: other?.titleStyle,
      hasSubtitle: other?.hasSubtitle,
      subtitleStyle:
          subtitleStyle?.merge(other?.subtitleStyle) ?? other?.subtitleStyle,
      padding: other?.padding,
      contentSpacing: other?.contentSpacing,
      verticalSpacing: other?.verticalSpacing,
    );
  }

  static SkeletonListTileStyle lerp(
    SkeletonListTileStyle? a,
    SkeletonListTileStyle? b,
    double t,
  ) {
    return SkeletonListTileStyle(
      hasLeading: (t < 0.5 ? a?.hasLeading : b?.hasLeading) ?? true,
      leadingStyle:
          SkeletonAvatarStyle.lerp(a?.leadingStyle, b?.leadingStyle, t),
      padding:
          EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t) ?? EdgeInsets.zero,
      hasSubtitle: (t < 0.5 ? a?.hasSubtitle : b?.hasSubtitle) ?? false,
      contentSpacing: t < 0.5 ? a?.contentSpacing : b?.contentSpacing,
      verticalSpacing: t < 0.5 ? a?.verticalSpacing : b?.verticalSpacing,
      subtitleStyle:
          SkeletonLineStyle.lerp(a?.subtitleStyle, b?.subtitleStyle, t),
      titleStyle: SkeletonLineStyle.lerp(a?.titleStyle, b?.titleStyle, t),
    );
  }
}

class ZeroSkeletonTheme extends InheritedWidget {
  final LinearGradient? shimmerGradient;
  final LinearGradient? darkShimmerGradient;
  final ThemeMode? themeMode;

  const ZeroSkeletonTheme({
    Key? key,
    required Widget child,
    this.shimmerGradient,
    this.darkShimmerGradient,
    this.themeMode,
  }) : super(key: key, child: child);

  static ZeroSkeletonTheme? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ZeroSkeletonTheme>();

  @override
  bool updateShouldNotify(ZeroSkeletonTheme oldWidget) =>
      oldWidget.themeMode != themeMode ||
      oldWidget.shimmerGradient != shimmerGradient ||
      oldWidget.darkShimmerGradient != darkShimmerGradient;
}
