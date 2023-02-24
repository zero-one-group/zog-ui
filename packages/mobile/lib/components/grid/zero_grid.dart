import 'package:flutter/material.dart';

part 'gridview.dart';

class ZeroGrid extends StatelessWidget {
  /// The number of columns to display.
  /// default is 4
  final int columnCount;

  /// The amount of space by which to inset the children.
  /// horizontal spacing
  /// default is 4
  final double crossAxisSpacing;

  /// The amount of space by which to inset the children.
  /// vertical spacing
  /// default is 4
  final double mainAxisSpacing;

  /// The widgets below this widget in the tree.
  /// default is empty list
  final List<ZeroGridItem> children;

  /// padding from parent widget
  final EdgeInsets padding;
  const ZeroGrid({
    super.key,
    this.columnCount = 4,
    this.crossAxisSpacing = 4,
    this.mainAxisSpacing = 4,
    this.children = const [],
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LayoutBuilder(builder: (context, constraints) {
        return _GridView(
          columnCount: columnCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          children: children,
          maxWidth: constraints.maxWidth,
        );
      }),
    );
  }
}

/// [ZeroGridItem] is a widget that can be used to display a widget in a grid.
/// used in child of [ZeroGrid]
class ZeroGridItem {
  /// The widget below this widget in the tree.
  final Widget child;

  /// The number of columns to display.
  /// this is the number of columns that the child will occupy
  /// same like colSpan table in html which is horizontal merge of columns
  /// default is 1 and max reference to [ZeroGrid.columnCount] value
  /// this value cannot be greater than [ZeroGrid.columnCount] and cannot be less than 1
  final int mainAxisCount;

  /// The number of rows to display.
  /// this is the number of rows that the child will occupy
  /// same like rowSpan table in html which is vertical merge of rows
  /// default is 1 and cannot be less than 1
  final int crossAxisCount;
  const ZeroGridItem({
    this.child = const SizedBox(),
    this.mainAxisCount = 1,
    this.crossAxisCount = 1,
  });
}
