import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent checkboxWidgetbookComponent = WidgetbookComponent(
  name: 'Checkbox',
  useCases: [
    WidgetbookUseCase(
      name: 'Selected',
      builder: (context) => PreviewWidget(
        child: ZeroCheckbox(
          size: context.knobs.options(
            options: sizeTypes,
            label: 'Size',
          ),
          onChanged: (bool? value) {},
          value: true,
          tristate: true,
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Unselected',
      builder: (context) => PreviewWidget(
        child: ZeroCheckbox(
          size: context.knobs.options(
            options: sizeTypes,
            label: 'Size',
          ),
          onChanged: (bool? value) {},
          value: false,
          tristate: true,
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Indeterminate',
      builder: (context) => PreviewWidget(
        child: ZeroCheckbox(
          size: context.knobs.options(
            options: sizeTypes,
            label: 'Size',
          ),
          onChanged: (bool? value) {},
          value: null,
          tristate: true,
        ),
      ),
    ),
  ],
);

List<Option<ZeroSizeType>> sizeTypes = [
  const Option(label: 'Small', value: ZeroSizeType.small),
  const Option(label: 'Medium', value: ZeroSizeType.medium),
  const Option(label: 'Large', value: ZeroSizeType.large),
];
