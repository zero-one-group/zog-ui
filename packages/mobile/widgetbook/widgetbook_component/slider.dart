import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent sliderWidgetbookComponenet = WidgetbookComponent(
  name: 'Slider',
  useCases: [
    WidgetbookUseCase(
      name: 'Slider',
      builder: (context) => Center(
        child: ZeroSlider(
          activeColor: context.knobs.options(
            label: 'Active Color',
            options: _colorOptions,
          ),
          tickBehavior: context.knobs.boolean(label: 'Tick Behavior'),
          showTicks: context.knobs.boolean(label: 'Show Ticks'),
          tickInterval: context.knobs
              .number(
                label: 'Tick Interval',
                initialValue: 10,
              )
              .toInt(),
          size: context.knobs.options(label: 'Size', options: _sizeTypes),
          tooltipVariant: context.knobs.options(
            label: 'Tooltip Variant',
            options: _tooltipVariants,
          ),
          isDisabled: context.knobs.boolean(label: 'IsDisabled'),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Range Slider',
      builder: (context) => LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: ZeroRangeSlider(
            activeColor: context.knobs.options(
              label: 'Active Color',
              options: _colorOptions,
            ),
            tickBehavior: context.knobs.boolean(label: 'Tick Behavior'),
            showTicks: context.knobs.boolean(label: 'Show Ticks'),
            tickInterval: context.knobs
                .number(
                  label: 'Tick Interval',
                  initialValue: 10,
                )
                .toInt(),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            tooltipVariant: context.knobs.options(
              label: 'Tooltip Variant',
              options: _tooltipVariants,
            ),
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
List<Option<Color>> _colorOptions = [
  const Option(
    label: 'Primary 6',
    value: ZeroColors.primary,
  ),
  const Option(
    label: 'Sunrise Yellow 6',
    value: ZeroColors.sunriseYellow,
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
