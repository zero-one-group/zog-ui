import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

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
          style: ZeroRatingStyle(
              activeColor: context.knobs.options(
                label: 'Active Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              inactiveColor: context.knobs.options(
                label: 'Inactive Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              spacing: context.knobs
                  .number(
                    label: 'Spacing',
                    initialValue: 0,
                  )
                  .toDouble()),
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
        child: ZeroRating(
          itemCount: context.knobs
              .number(
                label: 'Item Count',
                initialValue: 5,
              )
              .toInt(),
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
          style: ZeroRatingStyle(
              activeColor: context.knobs.options(
                label: 'Active Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              inactiveColor: context.knobs.options(
                label: 'Inactive Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              spacing: context.knobs
                  .number(
                    label: 'Spacing',
                    initialValue: 0,
                  )
                  .toDouble()),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          sizeType: context.knobs.options(
            label: 'Size Type',
            options: _sizeTypes,
          ),
          ratingWidget: RatingWidget(
            full: const Icon(Icons.play_circle),
            half: const Icon(Icons.play_circle_outlined),
            empty: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    ),
  ],
);

List<Option<ZeroSizeType>> _sizeTypes = [
  const Option(label: 'Small', value: ZeroSizeType.small),
  const Option(label: 'Medium', value: ZeroSizeType.medium),
  const Option(label: 'Large', value: ZeroSizeType.large),
];
