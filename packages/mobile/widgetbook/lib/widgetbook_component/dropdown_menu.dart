import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

List items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

List<Option<InputDecorationType>> decorationOptions = [
  const Option(
    label: 'Outline',
    value: InputDecorationType.outline,
  ),
  const Option(
    label: 'Round',
    value: InputDecorationType.rounded,
  ),
  const Option(
    label: 'Fill',
    value: InputDecorationType.fill,
  ),
  const Option(
    label: 'Underline',
    value: InputDecorationType.underline,
  ),
];

List<Option<ZeroTextfieldSize>> sizeOptions = [
  const Option(
    label: 'Small',
    value: ZeroTextfieldSize.small,
  ),
  const Option(
    label: 'Large',
    value: ZeroTextfieldSize.large,
  ),
];

List<Option<Widget?>> suffixOptions = [
  const Option(
    label: 'No Icon',
    value: null,
  ),
  const Option(
    label: 'Icons.arrow_drop_down',
    value: Icon(Icons.arrow_drop_down),
  ),
  const Option(
    label: 'Icons.date_range',
    value: Icon(Icons.date_range),
  ),
  const Option(
    label: 'Icons.question_answer',
    value: Icon(Icons.question_answer),
  ),
];

List<Option<Widget?>> iconsOptions = [
  const Option(
    label: 'Icons.arrow_drop_down',
    value: Icon(
      Icons.arrow_drop_down,
      color: Colors.white,
    ),
  ),
  const Option(
    label: 'Icons.date_range',
    value: Icon(
      Icons.date_range,
      color: Colors.white,
    ),
  ),
  const Option(
    label: 'Icons.question_answer',
    value: Icon(
      Icons.question_answer,
      color: Colors.white,
    ),
  ),
];

List<Option<double>> widths = [
  const Option(label: '200', value: 200.0),
  const Option(label: '300', value: 300.0),
  const Option(label: '400', value: 400.0),
];

WidgetbookComponent dropdownMenuWidgetbookComponent = WidgetbookComponent(
  name: 'Dropdown Menu',
  useCases: [
    WidgetbookUseCase(
        name: 'Dropdown Menu',
        builder: (context) {
          return PreviewWidget(
            child: ZeroDropdownMenu(
              hintText: context.knobs
                  .text(
                    label: 'Hint Text',
                    initialValue: 'Hint Text',
                  )
                  .toString(),
              labelText: context.knobs
                  .text(
                    label: 'Label Text',
                    initialValue: 'Label Text',
                  )
                  .toString(),
              width: context.knobs.options(label: 'Width', options: widths),
              inputDecorationType: context.knobs
                  .options(label: 'Decoration', options: decorationOptions),
              textfieldSize:
                  context.knobs.options(label: 'Size', options: sizeOptions),
              leadingIcon: context.knobs
                  .options(label: 'Leading Icon', options: iconsOptions),
              trailingIcon: context.knobs
                  .options(label: 'Trailing Icon', options: suffixOptions),
              items: items,
              onSelected: (value) {},
            ),
          );
        }),
  ],
);
