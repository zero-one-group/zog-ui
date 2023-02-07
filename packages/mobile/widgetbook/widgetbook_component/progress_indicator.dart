import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent progressIndicatorWidgetbookComponent = WidgetbookComponent(
  name: 'Progress Indicator',
  useCases: [
    WidgetbookUseCase(
      name: 'Circular',
      builder: (context) {
        double? value;

        if (!context.knobs.boolean(label: 'Animated')) {
          value = context.knobs.slider(
            label: 'Value',
            initialValue: .4,
            min: 0,
            max: 1,
          );
        } else {
          value = null;
        }

        return PreviewWidget(
          child: ZeroProgressIndicator.circular(
            value: value,
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
