import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent tooltipWidgetbookComponent = WidgetbookComponent(
  name: 'Tooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'Tooltip',
      builder: (context) => PreviewWidget(
        child: ZeroTooltip(
          text: context.knobs.text(
            label: 'Text',
            initialValue: 'Tooltip Text',
          ),
          brightness: context.knobs.options(
            label: 'Type',
            options: _types,
          ),
          variant: context.knobs.options(
            label: 'Variant',
            options: _variants,
          ),
          position: context.knobs.options(
            label: 'Position',
            options: _positions,
          ),
          child: const Text('Tooltip'),
        ),
      ),
    ),
  ],
);

List<Option<Brightness>> _types = [
  const Option(label: 'Dark', value: Brightness.dark),
  const Option(label: 'Light', value: Brightness.light),
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
