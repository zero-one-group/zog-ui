import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent ratingWidgetbookComponent = WidgetbookComponent(
  name: 'Rating',
  useCases: [
    WidgetbookUseCase(
      name: 'Star',
      builder: (context) => PreviewWidget(
        child: ZeroRating(
          itemCount: context.knobs
              .number(
                label: 'Item Count',
                initialValue: 5,
              )
              .toInt(),
          spacing: context.knobs
              .number(
                label: 'Spacing',
                initialValue: 0,
              )
              .toDouble(),
          initialValue: context.knobs
              .number(
                label: 'Initial Value',
                initialValue: 1,
              )
              .toDouble(),
          minValue: context.knobs
              .number(
                label: 'Min Value',
                initialValue: 0,
              )
              .toDouble(),
          allowHalfRating: context.knobs.boolean(
            label: 'Allow Half Rating',
            initialValue: true,
          ),
          onRatingUpdate: (value) {},
          activeColor: context.knobs.options(
            label: 'Active Color',
            options: _colorOptions,
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Color',
            options: _colorOptions,
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          sizeType: context.knobs.options(
            label: 'Size Type',
            options: _sizeTypes,
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom',
      builder: (context) => PreviewWidget(
        child: ZeroRatingCustom(
          spacing: context.knobs
              .number(
                label: 'Spacing',
                initialValue: 0,
              )
              .toDouble(),
          initialValue: context.knobs
              .number(
                label: 'Initial Value',
                initialValue: 1,
              )
              .toDouble(),
          onRatingUpdate: (value) {},
          activeColor: context.knobs.options(
            label: 'Active Color',
            options: _colorOptions,
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Color',
            options: _colorOptions,
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          sizeType: context.knobs.options(
            label: 'Size Type',
            options: _sizeTypes,
          ),
        ),
      ),
    ),
  ],
);

List<Option<Color>> _colorOptions = [
  Option(
    label: 'Sunrise Yellow 6',
    value: ZeroColors.sunriseYellow[6],
  ),
  const Option(
    label: 'Neutral 6',
    value: ZeroColors.neutral,
  ),
  Option(
    label: 'Neutral 10',
    value: ZeroColors.neutral[10],
  ),
  Option(
    label: 'Sunrise Yellow 10',
    value: ZeroColors.sunriseYellow[10],
  ),
  Option(
    label: 'Primary 6',
    value: ZeroColors.primary[6],
  ),
  const Option(
    label: 'Danger',
    value: ZeroColors.danger,
  ),
  const Option(
    label: 'Info',
    value: ZeroColors.info,
  ),
  const Option(
    label: 'Warning',
    value: ZeroColors.warning,
  ),
];

List<Option<ZeroSizeType>> _sizeTypes = [
  const Option(label: 'Small', value: ZeroSizeType.small),
  const Option(label: 'Medium', value: ZeroSizeType.medium),
  const Option(label: 'Large', value: ZeroSizeType.large),
];
