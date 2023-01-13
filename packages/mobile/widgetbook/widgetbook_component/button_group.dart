import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/components/button/zero_button.dart';

WidgetbookComponent buttonWidgetbookComponenet = WidgetbookComponent(
  name: 'Button',
  useCases: [
    WidgetbookUseCase(
      name: 'Primary',
      builder: (context) => ZeroButton.primary(
        text: context.knobs.text(
          label: 'Text',
          initialValue: 'Button',
        ),
        width: context.knobs
            .number(
              label: 'Width',
            )
            .toDouble(),
        height: context.knobs
            .number(
              label: 'Height',
            )
            .toDouble(),
        onPressed: () {},
      ),
    ),
  ],
);
