import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent tooltipWidgetbookComponenet = WidgetbookComponent(
  name: 'Tooltip',
  useCases: [
    WidgetbookUseCase(
      name: 'toolstip',
      builder: (context) => Tooltip(
        message: context.knobs.text(
          label: 'Text',
          initialValue: 'Tooltip Text',
        ),
        child: const Text('Tooltip'),
      ),
    ),
    WidgetbookUseCase(
      name: 'Tooltip',
      builder: (context) => ZeroTooltip(
        text: context.knobs.text(
          label: 'Text',
          initialValue: 'Tooltip Text',
        ),
        type: context.knobs.options(
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
