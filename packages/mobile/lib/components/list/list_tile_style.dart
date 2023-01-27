import 'package:flutter/widgets.dart';

class ZeroListTileStyle {
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

  /// Override from global theme of [ZeroTheme.listTile] dividerColor
  ///
  /// Customer divider color
  final Color? dividerColor;

  /// Creates a [ZeroListTile] style that defines the color and style parameters for
  /// descendant [ZeroListTile]s.
  const ZeroListTileStyle({
    this.selectedColor,
    this.hoverColor,
    this.backgroundColor,
    this.titleTextStyle,
    this.subTitleTextStyle,
    this.dividerColor,
  });

  /// It returns a new instance of the class with the given parameters.
  ///
  /// Args:
  ///   selectedColor (Color): The color of the tile when it is selected.
  ///   hoverColor (Color): The color of the tile when the mouse is hovering over it.
  ///   backgroundColor (Color): The background color of the tile.
  ///   titleTextStyle (TextStyle): The text style for the title.
  ///   subTitleTextStyle (TextStyle): The text style of the subtitle.
  ///   dividerColor (Color): The color of the divider between the title and subtitle.
  ///
  /// Returns:
  ///   A new instance of ZeroListTileStyle with the updated values.
  ZeroListTileStyle copyWith({
    Color? selectedColor,
    Color? hoverColor,
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    TextStyle? subTitleTextStyle,
    Color? dividerColor,
  }) {
    return ZeroListTileStyle(
      selectedColor: selectedColor ?? this.selectedColor,
      hoverColor: hoverColor ?? this.hoverColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? this.subTitleTextStyle,
      dividerColor: dividerColor ?? this.dividerColor,
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

    return ZeroListTileStyle(
      selectedColor: selectedColor ?? other.selectedColor,
      hoverColor: hoverColor ?? other.hoverColor,
      backgroundColor: backgroundColor ?? other.backgroundColor,
      titleTextStyle: titleTextStyle ?? other.titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? other.subTitleTextStyle,
      dividerColor: dividerColor ?? other.dividerColor,
    );
  }

  @override
  bool operator ==(covariant ZeroListTileStyle other) {
    if (identical(this, other)) return true;

    return other.selectedColor == selectedColor &&
        other.hoverColor == hoverColor &&
        other.backgroundColor == backgroundColor &&
        other.titleTextStyle == titleTextStyle &&
        other.subTitleTextStyle == subTitleTextStyle &&
        other.dividerColor == dividerColor;
  }

  @override
  int get hashCode {
    return selectedColor.hashCode ^
        hoverColor.hashCode ^
        backgroundColor.hashCode ^
        titleTextStyle.hashCode ^
        subTitleTextStyle.hashCode ^
        dividerColor.hashCode;
  }
}
