import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent bottomSheetWidgetbookComponent = WidgetbookComponent(
  name: 'Bottom Sheet',
  useCases: [
    WidgetbookUseCase(
      name: 'Bottom Sheet',
      builder: (context) => PreviewWidget(child: Builder(builder: (context) {
        final style = ZeroBottomSheetStyle(
          backgroundColor: context.knobs.options(
            label: 'Background Color',
            options: [
              const Option(label: 'Default', value: null),
              ...colorOptions
            ],
          ),
          handleColor: context.knobs.options(
            label: 'Handle Color',
            options: [
              const Option(label: 'Default', value: null),
              ...colorOptions
            ],
          ),
          useHandle:
              context.knobs.boolean(label: 'Use Handle', initialValue: true),
          elevation: context.knobs
              .number(label: 'Elevation', initialValue: 10)
              .toDouble(),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              context.knobs
                  .number(label: 'Border Radius', initialValue: 28)
                  .toDouble(),
            ),
          ),
        );

        return ZeroButton.primary(
          child: const Text('Bottom Sheet'),
          onPressed: () {
            showZeroBottomSheet(
              context,
              style: style,
              builder: (context) => Container(
                height: 300,
              ),
            );
          },
        );
      })),
    ),
    WidgetbookUseCase(
      name: 'Modal Bottom Sheet',
      builder: (context) => PreviewWidget(child: Builder(builder: (context) {
        final style = ZeroBottomSheetStyle(
          backgroundColor: context.knobs.options(
            label: 'Background Color',
            options: [
              const Option(label: 'Default', value: null),
              ...colorOptions
            ],
          ),
          barierColor: context.knobs.options(
            label: 'Barier Color',
            options: [
              const Option(label: 'Default', value: null),
              ...colorOptions
            ],
          ),
          handleColor: context.knobs.options(
            label: 'Handle Color',
            options: [
              const Option(label: 'Default', value: null),
              ...colorOptions
            ],
          ),
          useHandle:
              context.knobs.boolean(label: 'Use Handle', initialValue: true),
          elevation: context.knobs
              .number(label: 'Elevation', initialValue: 10)
              .toDouble(),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              context.knobs
                  .number(label: 'Border Radius', initialValue: 28)
                  .toDouble(),
            ),
          ),
        );

        return ZeroButton.primary(
          child: const Text('Modal Bottom Sheet'),
          onPressed: () {
            showZeroModalBottomSheet(
              context,
              style: style,
              builder: (context) => Container(
                height: 300,
              ),
            );
          },
        );
      })),
    ),
  ],
);
