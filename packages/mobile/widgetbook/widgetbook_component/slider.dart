import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent sliderWidgetbookComponenet = WidgetbookComponent(
  name: 'Slider',
  useCases: [
    WidgetbookUseCase(
      name: 'Slider',
      builder: (context) => MyWidget(),
    ),
  ],
);

List<Option<ZeroSliderSize>> _sizeTypes = [
  const Option(label: 'Small', value: ZeroSliderSize.small),
  const Option(label: 'Large', value: ZeroSliderSize.large),
];

List<Option<ZeroTooltipVariant>> _tooltipVariants = [
  const Option(label: 'Rectangle', value: ZeroTooltipVariant.rectangle),
  const Option(label: 'Rounded', value: ZeroTooltipVariant.rounded),
  const Option(label: 'Custom', value: ZeroTooltipVariant.custom),
];
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

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return ZeroSlider();
  }
}
