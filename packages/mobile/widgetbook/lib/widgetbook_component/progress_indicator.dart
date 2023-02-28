import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../options/color_options.dart';
import '../utils.dart';

WidgetbookComponent progressIndicatorWidgetbookComponent = WidgetbookComponent(
  name: 'Progress Indicator',
  useCases: [
    WidgetbookUseCase(
      name: 'Circular',
      builder: (context) {
        return PreviewWidget(
          child: ZeroProgressIndicator.circular(
            value: context.knobs.nullableSlider(label: 'Value', min: 0, max: 1),
            style: ZeroProgressStyle(
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              valueColor: context.knobs.options(
                label: 'Value Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              lineSize: context.knobs
                  .number(label: 'Stroke Width', initialValue: 4)
                  .toDouble(),
            ),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Linear',
      builder: (context) {
        return PreviewWidget(
          child: SizedBox(
            width: 300,
            child: ZeroProgressIndicator.linear(
              value:
                  context.knobs.nullableSlider(label: 'Value', min: 0, max: 1),
              style: ZeroProgressStyle(
                backgroundColor: context.knobs.options(
                  label: 'Background Color',
                  options: [
                    const Option(label: 'Default', value: null),
                    ...colorOptions
                  ],
                ),
                valueColor: context.knobs.options(
                  label: 'Value Color',
                  options: [
                    const Option(label: 'Default', value: null),
                    ...colorOptions
                  ],
                ),
                lineSize: context.knobs
                    .number(label: 'Stroke Height', initialValue: 4)
                    .toDouble(),
              ),
            ),
          ),
        );
      },
    ),
  ],
);
