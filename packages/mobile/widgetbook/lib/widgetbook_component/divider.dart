import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent dividerWidgetbookComponent = WidgetbookComponent(
  name: 'Divider',
  useCases: [
    WidgetbookUseCase(
      name: 'Horizontal',
      builder: (context) => PreviewWidget(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: ZeroDivider.horizontal(
            variant: context.knobs
                .options(label: 'Variant', options: _variantOptions),
            style: ZeroDividerStyle(
              color:
                  context.knobs.options(label: 'Color', options: _colorOptions),
              size: context.knobs
                  .number(label: 'Size', initialValue: 1)
                  .toDouble(),
              endInset: context.knobs
                  .nullableNumber(label: 'End Inset', initialValue: 16)
                  ?.toDouble(),
              startInset: context.knobs
                  .nullableNumber(label: 'Start Inset', initialValue: 16)
                  ?.toDouble(),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Vertical',
      builder: (context) => PreviewWidget(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: ZeroDivider.vertical(
            variant: context.knobs
                .options(label: 'Variant', options: _variantOptions),
            style: ZeroDividerStyle(
              color:
                  context.knobs.options(label: 'Color', options: _colorOptions),
              size: context.knobs
                  .number(label: 'Size', initialValue: 1)
                  .toDouble(),
              endInset: context.knobs
                  .nullableNumber(label: 'End Inset', initialValue: 16)
                  ?.toDouble(),
              startInset: context.knobs
                  .nullableNumber(label: 'Start Inset', initialValue: 16)
                  ?.toDouble(),
            ),
          ),
        ),
      ),
    ),
  ],
);

List<Option<Color>> _colorOptions = [
  Option(
    label: 'Neutural 7',
    value: ZeroColors.neutral[7],
  ),
  Option(
    label: 'Primary 7',
    value: ZeroColors.primary[7],
  ),
  Option(
    label: 'Dust Red 7',
    value: ZeroColors.dustRed[7],
  ),
  Option(
    label: 'Polar Green 7',
    value: ZeroColors.polarGreen[7],
  ),
  Option(
    label: 'Sunset Orange 7',
    value: ZeroColors.sunsetOrange[7],
  ),
];

List<Option<ZeroDividerVariant>> _variantOptions = [
  const Option(
    label: 'Full Width',
    value: ZeroDividerVariant.fullWidth,
  ),
  const Option(
    label: 'Inset',
    value: ZeroDividerVariant.inset,
  ),
  const Option(
    label: 'Middle Inset',
    value: ZeroDividerVariant.middleInset,
  ),
];
