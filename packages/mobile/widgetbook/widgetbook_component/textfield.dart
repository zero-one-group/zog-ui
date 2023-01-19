import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/components/textfield/zero_textfield.dart';

WidgetbookComponent textFieldWidgetbookComponent = WidgetbookComponent(
  name: 'Text Field',
  useCases: [
    WidgetbookUseCase(
        name: 'Labels Only',
        builder: (context) {
          return const ZeroTextField(hintText: 'Input');
        }),
  ],
);
