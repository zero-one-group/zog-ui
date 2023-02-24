part of 'zero_grid.dart';

class _GridView extends StatefulWidget {
  final int columnCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final List<ZeroGridItem> children;
  final double maxWidth;
  const _GridView({
    this.columnCount = 4,
    this.crossAxisSpacing = 4,
    this.mainAxisSpacing = 4,
    this.children = const [],
    required this.maxWidth,
  });

  @override
  State<_GridView> createState() => __GridViewState();
}

class __GridViewState extends State<_GridView> {
  /// dynamic height for stack based on sum of height of children or rows
  double parentHeight = 0;

  /// list of grid which will be rendered in stack widget
  List<Widget> grids = [];

  List<Widget> createGrid() {
    double maxWidth = widget.maxWidth;
    int currentRow = 0;
    int currentColumn = 0;
    double offset = 0;
    List<List<int>> reservedColumns = [[]];

    int numColumns = widget.columnCount;
    double widthOfItem = maxWidth / numColumns;

    /// this function used in [List.generate] to create grid
    /// this for checking if the space of current column grid is available or not
    void nextColumn() {
      while (true) {
        if (reservedColumns[currentRow].isNotEmpty && reservedColumns[currentRow].first == currentColumn) {
          currentColumn++;
          reservedColumns[currentRow].removeAt(0);
        } else if (currentColumn >= numColumns) {
          currentRow++;
          currentColumn = 0;
          reservedColumns.add([]);
          parentHeight = (currentRow + 1) * (widthOfItem);
        } else {
          break;
        }
      }
    }

    return List.generate(
      widget.children.length,
      (index) {
        Widget toRender = const SizedBox();
        ZeroGridItem item = widget.children[index];
        assert(item.mainAxisCount <= numColumns, 'Main axis count must be less than or equal to numColumns');
        assert(item.mainAxisCount > 0, 'Main axis count must be greater than 0');
        assert(item.crossAxisCount > 0, 'Cross axis count must be greater than 0');

        /// go to next column
        /// if current column is reserved, we need to skip it
        nextColumn();

        /// check if current column is reserved to next row
        if (item.crossAxisCount > 1) {
          for (int i = 1; i < item.crossAxisCount; i++) {
            List<int> tReservedColumn = [];
            tReservedColumn.add(currentColumn);
            if (item.mainAxisCount > 1) {
              for (int j = 1; j < item.mainAxisCount; j++) {
                tReservedColumn.add(currentColumn + j);
              }
            }
            if (reservedColumns.length <= currentRow + i) {
              reservedColumns.add([]);
            }
            reservedColumns[currentRow + i] = [...reservedColumns[currentRow + i], ...tReservedColumn];
          }
        }

        if (index == widget.children.length - 1) {
          for (int i = currentRow; i < reservedColumns.length; i++) {
            if (reservedColumns[i].isNotEmpty) {
              parentHeight = (i + 1) * (widthOfItem);
            }
          }
        }

        double totalMainSpacing = (numColumns - 1) * widget.mainAxisSpacing;
        double widthRemaining = maxWidth - totalMainSpacing;
        double widthOfItemMain = widthRemaining / numColumns;

        /// calculate offset
        offset = (widthOfItemMain * currentColumn) + (currentColumn * widget.mainAxisSpacing);

        // check if current column is reserved
        // when current column is reserved, we need to skip it
        if (item.mainAxisCount > 1) {
          currentColumn += item.mainAxisCount;
          widthOfItemMain = widthOfItemMain * item.mainAxisCount + ((item.mainAxisCount - 1) * widget.mainAxisSpacing);
        } else {
          currentColumn++;
          widthOfItemMain = widthOfItemMain * item.mainAxisCount;
        }

        toRender = Positioned(
          top: widthOfItem * currentRow,
          left: offset,
          child: SizedBox(
            width: widthOfItemMain,
            height: widthOfItem * item.crossAxisCount - widget.crossAxisSpacing,
            child: item.child,
          ),
        );
        return toRender;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    grids = createGrid();
  }

  @override
  void didUpdateWidget(covariant _GridView oldWidget) {
    super.didUpdateWidget(oldWidget);
    grids = createGrid();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: parentHeight,
          width: widget.maxWidth,
        ),
        ...grids,
      ],
    );
  }
}
