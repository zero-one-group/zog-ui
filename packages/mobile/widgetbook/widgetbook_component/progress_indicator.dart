import 'package:flutter/src/widgets/basic.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../color_options.dart';
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
            backgroundColor: context.knobs.options(
              label: 'Background Color',
              options: [const Option(label: 'Transparent', value: ZeroColors.transparent), ...colorOptions],
            ),
            valueColor: context.knobs.options(
              label: 'Value Color',
              options: colorOptions,
            ),
            strokeWidth: context.knobs.number(label: 'Stroke Width', initialValue: 4).toDouble(),
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
              value: context.knobs.nullableSlider(label: 'Value', min: 0, max: 1),
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: [const Option(label: 'Transparent', value: ZeroColors.transparent), ...colorOptions],
              ),
              valueColor: context.knobs.options(
                label: 'Value Color',
                options: colorOptions,
              ),
              height: context.knobs.number(label: 'Stroke Width', initialValue: 4).toDouble(),
            ),
          ),
        );
      },
    ),
  ],
);

List<Option<ZeroTooltipType>> _types = [
  const Option(label: 'Dark', value: ZeroTooltipType.dark),
  const Option(label: 'Light', value: ZeroTooltipType.light),
];

List<Option<ZeroTooltipVariant>> _variants = [
  const Option(label: 'Rectangle', value: ZeroTooltipVariant.rectangle),
  const Option(label: 'Rounded', value: ZeroTooltipVariant.rounded),
  const Option(label: 'Custom', value: ZeroTooltipVariant.custom),
];

List<Option<ZeroTooltipPosition>> _positions = [
  const Option(label: 'Top', value: ZeroTooltipPosition.top),
  const Option(label: 'Bottom', value: ZeroTooltipPosition.bottom),
  const Option(label: 'Left', value: ZeroTooltipPosition.left),
  const Option(label: 'Right', value: ZeroTooltipPosition.right),
];
