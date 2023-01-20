import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/colors/zero_colors.dart';
import 'package:zero_ui_mobile/components/rating/zero_rating.dart';
import 'package:zero_ui_mobile/components/rating/zero_rating_custom.dart';
import 'package:zero_ui_mobile/types/size_type.dart';

WidgetbookComponent ratingWidgetbookComponenet = WidgetbookComponent(
  name: 'Rating',
  useCases: [
    WidgetbookUseCase(
      name: 'Star',
      builder: (context) => ZeroRating(
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
    WidgetbookUseCase(
      name: 'Custom',
      builder: (context) => ZeroRatingCustom(
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
  ],
);

List<Option<Color>> _colorOptions = [
  const Option(
    label: 'Sunrise Yellow 6',
    value: ZeroColors.sunriseYellow6,
  ),
  const Option(
    label: 'Neutral 6',
    value: ZeroColors.neutral6,
  ),
  const Option(
    label: 'Neutral 10',
    value: ZeroColors.neutral10,
  ),
  const Option(
    label: 'Sunrise Yellow 10',
    value: ZeroColors.sunriseYellow10,
  ),
  const Option(
    label: 'Primary 6',
    value: ZeroColors.primary6,
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
