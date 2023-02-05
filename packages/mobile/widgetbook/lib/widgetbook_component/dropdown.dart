import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

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

List<Option<MultipleItemsVariant>> multipleItemVariantOptions = [
  const Option(
    label: 'Default',
    value: MultipleItemsVariant.plain,
  ),
  const Option(
    label: 'Checkbox',
    value: MultipleItemsVariant.checkboxes,
  ),
];

List<Option<SelectedItemsStyle>> selectedItemsStyleOptions = [
  const Option(
    label: 'Text',
    value: SelectedItemsStyle.text,
  ),
  const Option(
    label: 'Chip',
    value: SelectedItemsStyle.chip,
  ),
  const Option(
    label: 'Chip Inverted',
    value: SelectedItemsStyle.chipInverted,
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

WidgetbookComponent dropdownWidgetbookComponent = WidgetbookComponent(
  name: 'Dropdown',
  useCases: [
    WidgetbookUseCase(
        name: 'Default',
        builder: (context) {
          return PreviewWidget(
              child: ZeroDropdown(
            items: items,
            hintText: context.knobs
                .text(
                  label: 'Hint Text',
                  initialValue: 'Hint ',
                )
                .toString(),
            labelText: context.knobs
                .text(
                  label: 'Label Text',
                  initialValue: 'Label Text',
                )
                .toString(),
            inputDecorationType: context.knobs
                .options(label: 'Decoration', options: decorationOptions),
            onChanged: (value) {},
            textfieldSize:
                context.knobs.options(label: 'Size', options: sizeOptions),
            suffixIcon: context.knobs
                .options(label: 'Suffix Icon', options: suffixOptions),
          ));
        }),
    WidgetbookUseCase(
        name: 'Default (No Label)',
        builder: (context) {
          return Center(
              child: ZeroDropdown(
            items: items,
            hintText: context.knobs
                .text(
                  label: 'Hint Text',
                  initialValue: 'Hint ',
                )
                .toString(),
            inputDecorationType: context.knobs
                .options(label: 'Decoration', options: decorationOptions),
            onChanged: (value) {},
            textfieldSize:
                context.knobs.options(label: 'Size', options: sizeOptions),
            suffixIcon: context.knobs
                .options(label: 'Suffix Icon', options: suffixOptions),
          ));
        }),
    WidgetbookUseCase(
        name: 'Multiple',
        builder: (context) {
          return Center(
            child: ZeroDropdown.multiple(
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
              inputDecorationType: context.knobs
                  .options(label: 'Decoration', options: decorationOptions),
              textfieldSize:
                  context.knobs.options(label: 'Size', options: sizeOptions),
              suffixIcon: context.knobs
                  .options(label: 'Suffix Icon', options: suffixOptions),
              multipleItemsVariant: context.knobs.options(
                  label: 'Multiple Item Variant',
                  options: multipleItemVariantOptions),
              items: items,
              onChanged: (value) {},
              selectedItemsStyle: context.knobs.options(
                  label: 'Selected Items Style',
                  options: selectedItemsStyleOptions),
            ),
          );
        }),
    WidgetbookUseCase(
        name: 'Multiple (No Label)',
        builder: (context) {
          return Center(
            child: ZeroDropdown.multiple(
              hintText: context.knobs
                  .text(
                    label: 'Hint Text',
                    initialValue: 'Hint Text',
                  )
                  .toString(),
              inputDecorationType: context.knobs
                  .options(label: 'Decoration', options: decorationOptions),
              textfieldSize:
                  context.knobs.options(label: 'Size', options: sizeOptions),
              suffixIcon: context.knobs
                  .options(label: 'Suffix Icon', options: suffixOptions),
              multipleItemsVariant: context.knobs.options(
                  label: 'Multiple Item Variant',
                  options: multipleItemVariantOptions),
              items: items,
              onChanged: (value) {},
              selectedItemsStyle: context.knobs.options(
                  label: 'Selected Items Style',
                  options: selectedItemsStyleOptions),
            ),
          );
        }),
  ],
);
