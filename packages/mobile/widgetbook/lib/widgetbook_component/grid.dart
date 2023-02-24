import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent gridWidgetbookComponent = WidgetbookComponent(
  name: 'Grid',
  useCases: [
    WidgetbookUseCase(
      name: 'Basic',
      builder: (context) => ZeroGrid(
        columnCount: 6,
        crossAxisSpacing: context.knobs
            .number(
              label: 'Cross Axis Spacing',
              initialValue: 4,
            )
            .toDouble(),
        mainAxisSpacing: context.knobs
            .number(
              label: 'Main Axis Spacing',
              initialValue: 4,
            )
            .toDouble(),
        padding: EdgeInsets.all(
          context.knobs
              .number(
                label: 'Padding',
                initialValue: 4,
              )
              .toDouble(),
        ),
        children: [
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 6,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 3,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 3,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Masonry',
      builder: (context) => ZeroGrid(
        columnCount: 4,
        crossAxisSpacing: context.knobs
            .number(
              label: 'Cross Axis Spacing',
              initialValue: 4,
            )
            .toDouble(),
        mainAxisSpacing: context.knobs
            .number(
              label: 'Main Axis Spacing',
              initialValue: 4,
            )
            .toDouble(),
        padding: EdgeInsets.all(
          context.knobs
              .number(
                label: 'Padding',
                initialValue: 4,
              )
              .toDouble(),
        ),
        children: [
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 1,
            crossAxisCount: 1,
          ),
        ],
      ),
    ),
    WidgetbookUseCase(
      name: 'Staggered',
      builder: (context) => ZeroGrid(
        columnCount: 8,
        crossAxisSpacing: context.knobs
            .number(
              label: 'Cross Axis Spacing',
              initialValue: 4,
            )
            .toDouble(),
        mainAxisSpacing: context.knobs
            .number(
              label: 'Main Axis Spacing',
              initialValue: 4,
            )
            .toDouble(),
        padding: EdgeInsets.all(
          context.knobs
              .number(
                label: 'Padding',
                initialValue: 4,
              )
              .toDouble(),
        ),
        children: [
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 8,
            crossAxisCount: 4,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 4,
            crossAxisCount: 4,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 4,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 4,
            crossAxisCount: 2,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 2,
            crossAxisCount: 4,
          ),
          ZeroGridItem(
            child: Container(
              color: Colors.grey.shade400,
            ),
            mainAxisCount: 4,
            crossAxisCount: 2,
          ),
        ],
      ),
    ),
  ],
);
