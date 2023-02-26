import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroListTileStyle with Diagnosticable {
  /// Override from global theme of [ZeroTheme.listTile] selectedColor
  ///
  /// Background color when [ZeroListTile] state is selected
  final Color? selectedColor;

  /// Override from global theme of [ZeroTheme.listTile] hoverColor
  ///
  /// Background color when [ZeroListTile] hovered
  final Color? hoverColor;

  /// Override from global theme of [ZeroTheme.listTile] backgroundColor
  ///
  /// Default background color of [ZeroListTile]
  final Color? backgroundColor;

  /// Override from global theme of [ZeroTheme.listTile] titleTextStyle
  ///
  /// Text style for title
  final TextStyle? titleTextStyle;

  /// Override from global theme of [ZeroTheme.listTile] subTitleTextStyle
  ///
  /// Text Style for subtitle
  final TextStyle? subTitleTextStyle;

  /// Override from global theme of [ZeroTheme.listTile] smallTitleTextStyle
  ///
  /// Text style for title, while type is small
  final TextStyle? smallTitleTextStyle;

  /// Override from global theme of [ZeroTheme.listTile] smallSubTitleTextStyle
  ///
  /// Text Style for subtitle while type is small
  final TextStyle? smallSubTitleTextStyle;

  /// Override from global theme of [ZeroTheme.listTile] dividerColor
  ///
  /// Customer divider color
  final Color? dividerColor;

  /// Content padding
  final EdgeInsets? contentPadding;

  /// Content padding, while size is small
  final EdgeInsets? smallContentPadding;

  /// Creates a [ZeroListTile] style that defines the color and style parameters for
  /// descendant [ZeroListTile]s.
  const ZeroListTileStyle({
    this.selectedColor,
    this.hoverColor,
    this.backgroundColor,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.dividerColor,
    this.smallTitleTextStyle,
    this.smallSubTitleTextStyle,
    this.contentPadding,
    this.smallContentPadding,
  });

  /// It returns a new instance of the class with the given parameters.
  ///
  /// Args:
  ///   selectedColor (Color): The color of the tile when it is selected.
  ///   hoverColor (Color): The color of the tile when the mouse is hovering over it.
  ///   backgroundColor (Color): The background color of the tile.
  ///   titleTextStyle (TextStyle): The text style for the title.
  ///   subTitleTextStyle (TextStyle): The text style of the subtitle.
  ///   smallTitleTextStyle (TextStyle): The text style for the title when the list tile is small.
  ///   smallSubTitleTextStyle (TextStyle): The text style for the subtitle when the list tile is small.
  ///   dividerColor (Color): The color of the divider between the title and subtitle.
  ///   contentPadding (EdgeInsets): The padding of the content of the list tile.
  ///   smallContentPadding (EdgeInsets): The padding for the small tile.
  ///
  /// Returns:
  ///   A new instance of ZeroListTileStyle with the updated values.
  ZeroListTileStyle copyWith({
    Color? selectedColor,
    Color? hoverColor,
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    TextStyle? subTitleTextStyle,
    TextStyle? smallTitleTextStyle,
    TextStyle? smallSubTitleTextStyle,
    Color? dividerColor,
    EdgeInsets? contentPadding,
    EdgeInsets? smallContentPadding,
  }) {
    return ZeroListTileStyle(
      selectedColor: selectedColor ?? this.selectedColor,
      hoverColor: hoverColor ?? this.hoverColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? this.subTitleTextStyle,
      dividerColor: dividerColor ?? this.dividerColor,
      contentPadding: contentPadding ?? this.contentPadding,
      smallContentPadding: smallContentPadding ?? this.smallContentPadding,
      smallTitleTextStyle: smallSubTitleTextStyle ?? this.smallTitleTextStyle,
      smallSubTitleTextStyle:
          smallSubTitleTextStyle ?? this.smallSubTitleTextStyle,
    );
  }

  /// If the value of the current instance is null, use the value of the other instance
  ///
  /// Args:
  ///   other (ZeroListTileStyle): The other style to merge with.
  ///
  /// Returns:
  ///   A new instance of ZeroListTileStyle with the values of the current instance and the other
  /// instance.
  ZeroListTileStyle merge(ZeroListTileStyle? other) {
    if (other == null) return this;
    return copyWith(
      selectedColor: other.selectedColor,
      hoverColor: other.hoverColor,
      backgroundColor: other.backgroundColor,
      titleTextStyle:
          titleTextStyle?.merge(other.titleTextStyle) ?? other.titleTextStyle,
      subTitleTextStyle: subTitleTextStyle?.merge(other.subTitleTextStyle) ??
          other.subTitleTextStyle,
      dividerColor: other.dividerColor,
      contentPadding: other.contentPadding,
      smallContentPadding: other.smallContentPadding,
      smallTitleTextStyle:
          smallTitleTextStyle?.merge(other.smallTitleTextStyle) ??
              other.smallSubTitleTextStyle,
      smallSubTitleTextStyle:
          smallSubTitleTextStyle?.merge(other.smallSubTitleTextStyle) ??
              other.smallSubTitleTextStyle,
    );
  }

  static ZeroListTileStyle lerp(
      ZeroListTileStyle? a, ZeroListTileStyle? b, double t) {
    return ZeroListTileStyle(
      selectedColor: Color.lerp(a?.selectedColor, b?.selectedColor, t),
      hoverColor: Color.lerp(a?.hoverColor, b?.hoverColor, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      titleTextStyle: TextStyle.lerp(a?.titleTextStyle, b?.titleTextStyle, t),
      subTitleTextStyle:
          TextStyle.lerp(a?.subTitleTextStyle, b?.subTitleTextStyle, t),
      dividerColor: Color.lerp(a?.dividerColor, b?.dividerColor, t),
      contentPadding: EdgeInsets.lerp(a?.contentPadding, b?.contentPadding, t),
      smallContentPadding:
          EdgeInsets.lerp(a?.smallContentPadding, b?.smallContentPadding, t),
      smallTitleTextStyle:
          TextStyle.lerp(a?.smallTitleTextStyle, b?.smallTitleTextStyle, t),
      smallSubTitleTextStyle: TextStyle.lerp(
          a?.smallSubTitleTextStyle, b?.smallSubTitleTextStyle, t),
    );
  }

  /// Return default styles
  static ZeroListTileStyle fallback({
    Color? selectedColor,
    Color? hoverColor,
    Color? backgroundColor,
    Color? dividerColor,
  }) =>
      ZeroListTileStyle(
        selectedColor: selectedColor,
        hoverColor: hoverColor,
        backgroundColor: backgroundColor,
        dividerColor: dividerColor,
        titleTextStyle: TextStyle(color: ZeroColors.neutral[10], fontSize: 16),
        subTitleTextStyle:
            TextStyle(color: ZeroColors.neutral[7], fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        smallContentPadding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        smallTitleTextStyle:
            TextStyle(color: ZeroColors.neutral[10], fontSize: 14),
        smallSubTitleTextStyle:
            TextStyle(color: ZeroColors.neutral[7], fontSize: 12),
      );

  @override
  bool operator ==(covariant ZeroListTileStyle other) {
    if (identical(this, other)) return true;

    return other.selectedColor == selectedColor &&
        other.hoverColor == hoverColor &&
        other.backgroundColor == backgroundColor &&
        other.titleTextStyle == titleTextStyle &&
        other.subTitleTextStyle == subTitleTextStyle &&
        other.dividerColor == dividerColor &&
        other.contentPadding == contentPadding &&
        other.smallContentPadding == smallContentPadding &&
        other.smallTitleTextStyle == smallTitleTextStyle &&
        other.smallSubTitleTextStyle == smallSubTitleTextStyle;
  }

  @override
  int get hashCode {
    return selectedColor.hashCode ^
        hoverColor.hashCode ^
        backgroundColor.hashCode ^
        titleTextStyle.hashCode ^
        subTitleTextStyle.hashCode ^
        dividerColor.hashCode ^
        contentPadding.hashCode ^
        smallContentPadding.hashCode ^
        smallTitleTextStyle.hashCode ^
        smallSubTitleTextStyle.hashCode;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('selectedColor', selectedColor))
      ..add(ColorProperty('hoverColor', hoverColor))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('dividerColor', dividerColor));
  }
}
