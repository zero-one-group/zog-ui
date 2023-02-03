import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent iconWidgetbookComponent = WidgetbookComponent(
  name: 'Icon',
  useCases: [
    WidgetbookUseCase(
      name: 'Single Tone',
      builder: (context) => PreviewWidget(
        child: LayoutBuilder(builder: (context, constraints) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth ~/ 120,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: 500,
            itemBuilder: (context, index) {
              return Column(
                children: const [
                  Icon(ZeroIcons.alert),
                  Text('Aims'),
                ],
              );
            },
          );
        }),
      ),
    ),
  ],
);
