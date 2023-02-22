import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent sliderWidgetbookComponenet = WidgetbookComponent(
  name: 'Slider',
  useCases: [
    WidgetbookUseCase(
      name: 'Slider',
      builder: (context) => PreviewWidget(
        child: ZeroSlider(
          style: ZeroSliderStyle(
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
            thumbColor: context.knobs.options(
              label: 'Thumb Color',
              options: [
                const Option(label: 'Default', value: null),
                ...colorOptions
              ],
            ),
            tickColor: context.knobs.options(
              label: 'Tick Color',
              options: [
                const Option(label: 'Default', value: null),
                ...colorOptions
              ],
            ),
            tickBehavior: context.knobs.boolean(label: 'Tick Behavior'),
            tooltipVariant: context.knobs.options(
              label: 'Tooltip Variant',
              options: _tooltipVariants,
            ),
          ),
          showTicks: context.knobs.boolean(label: 'Show Ticks'),
          tickInterval: context.knobs
              .number(
                label: 'Tick Interval',
                initialValue: 10,
              )
              .toInt(),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          isDisabled: context.knobs.boolean(label: 'IsDisabled'),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Range Slider',
      builder: (context) => LayoutBuilder(builder: (context, constraints) {
        return PreviewWidget(
          child: ZeroRangeSlider(
            style: ZeroSliderStyle(
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
              thumbColor: context.knobs.options(
                label: 'Thumb Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              tickColor: context.knobs.options(
                label: 'Tick Color',
                options: [
                  const Option(label: 'Default', value: null),
                  ...colorOptions
                ],
              ),
              tickBehavior: context.knobs.boolean(label: 'Tick Behavior'),
              tooltipVariant: context.knobs.options(
                label: 'Tooltip Variant',
                options: _tooltipVariants,
              ),
            ),
            showTicks: context.knobs.boolean(label: 'Show Ticks'),
            tickInterval: context.knobs
                .number(
                  label: 'Tick Interval',
                  initialValue: 10,
                )
                .toInt(),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            isDisabled: context.knobs.boolean(label: 'IsDisabled'),
          ),
        );
      }),
    ),
  ],
);

List<Option<ZeroSliderSize>> _sizeTypes = [
  const Option(label: 'Large', value: ZeroSliderSize.large),
  const Option(label: 'Small', value: ZeroSliderSize.small),
];

List<Option<ZeroTooltipVariant>> _tooltipVariants = [
  const Option(label: 'Rectangle', value: ZeroTooltipVariant.rectangle),
  const Option(label: 'Rounded', value: ZeroTooltipVariant.rounded),
  const Option(label: 'Custom', value: ZeroTooltipVariant.custom),
];
