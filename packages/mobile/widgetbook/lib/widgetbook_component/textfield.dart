import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent textFieldWidgetbookComponent = WidgetbookComponent(
  name: 'Text Field',
  useCases: [
    WidgetbookUseCase(
      name: 'Outline',
      builder: (context) {
        return PreviewWidget(
          child: ZeroTextField.outline(
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
            helperText: context.knobs
                .text(
                  label: 'Helper Text',
                  initialValue: 'Helper Text',
                )
                .toString(),
            textfielSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Small',
                value: ZeroTextfieldSize.small,
              ),
              const Option(
                label: 'Large',
                value: ZeroTextfieldSize.large,
              ),
            ]),
            prefixIcon: context.knobs.options(label: 'Prefix Icon', options: [
              const Option(
                label: 'No Icon',
                value: null,
              ),
              const Option(
                label: 'Icons.search',
                value: Icon(Icons.search),
              ),
              const Option(
                label: 'Icons.person',
                value: Icon(Icons.person),
              ),
              const Option(
                label: 'Icons.lock',
                value: Icon(Icons.lock),
              ),
            ]),
            suffixIcon: context.knobs.options(label: 'Suffix Icon', options: [
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
            ]),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Outline Multiline',
      builder: (context) {
        return PreviewWidget(
          child: ZeroTextFieldMultiline.outline(
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
            helperText: context.knobs
                .text(
                  label: 'Helper Text',
                  initialValue: 'Helper Text',
                )
                .toString(),
            textfielSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Small',
                value: ZeroTextfieldSize.small,
              ),
              const Option(
                label: 'Large',
                value: ZeroTextfieldSize.large,
              ),
            ]),
            suffix: context.knobs.options(label: 'Suffix Widget', options: [
              const Option(
                label: 'No Widget',
                value: null,
              ),
              const Option(
                label: 'Icons.close_outlined',
                value: Icon(Icons.close_outlined),
              ),
              const Option(
                label: 'Icons.help',
                value: Icon(Icons.help),
              ),
              const Option(
                label: 'Icons.access_alarm',
                value: Icon(Icons.access_alarm),
              ),
            ]),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Fill',
      builder: (context) {
        return PreviewWidget(
          child: ZeroTextField.filled(
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
            helperText: context.knobs
                .text(
                  label: 'Helper Text',
                  initialValue: 'Helper Text',
                )
                .toString(),
            textfielSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Small',
                value: ZeroTextfieldSize.small,
              ),
              const Option(
                label: 'Large',
                value: ZeroTextfieldSize.large,
              ),
            ]),
            prefixIcon: context.knobs.options(label: 'Prefix Icon', options: [
              const Option(
                label: 'No Icon',
                value: null,
              ),
              const Option(
                label: 'Icons.search',
                value: Icon(Icons.search),
              ),
              const Option(
                label: 'Icons.person',
                value: Icon(Icons.person),
              ),
              const Option(
                label: 'Icons.lock',
                value: Icon(Icons.lock),
              ),
            ]),
            suffixIcon: context.knobs.options(label: 'Suffix Icon', options: [
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
            ]),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Fill Multiline',
      builder: (context) {
        return PreviewWidget(
          child: ZeroTextFieldMultiline.fill(
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
            helperText: context.knobs
                .text(
                  label: 'Helper Text',
                  initialValue: 'Helper Text',
                )
                .toString(),
            textfielSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Small',
                value: ZeroTextfieldSize.small,
              ),
              const Option(
                label: 'Large',
                value: ZeroTextfieldSize.large,
              ),
            ]),
            suffix: context.knobs.options(label: 'Suffix Widget', options: [
              const Option(
                label: 'No Widget',
                value: null,
              ),
              const Option(
                label: 'Icons.close_outlined',
                value: Icon(Icons.close_outlined),
              ),
              const Option(
                label: 'Icons.help',
                value: Icon(Icons.help),
              ),
              const Option(
                label: 'Icons.access_alarm',
                value: Icon(Icons.access_alarm),
              ),
            ]),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Underline',
      builder: (context) {
        return PreviewWidget(
          child: ZeroTextField.underline(
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
            helperText: context.knobs
                .text(
                  label: 'Helper Text',
                  initialValue: 'Helper Text',
                )
                .toString(),
            textfielSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Small',
                value: ZeroTextfieldSize.small,
              ),
              const Option(
                label: 'Large',
                value: ZeroTextfieldSize.large,
              ),
            ]),
            prefixIcon: context.knobs.options(label: 'Prefix Icon', options: [
              const Option(
                label: 'No Icon',
                value: null,
              ),
              const Option(
                label: 'Icons.search',
                value: Icon(Icons.search),
              ),
              const Option(
                label: 'Icons.person',
                value: Icon(Icons.person),
              ),
              const Option(
                label: 'Icons.lock',
                value: Icon(Icons.lock),
              ),
            ]),
            suffixIcon: context.knobs.options(label: 'Suffix Icon', options: [
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
            ]),
          ),
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Underline Multiline',
      builder: (context) {
        return PreviewWidget(
          child: ZeroTextFieldMultiline.underline(
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
            helperText: context.knobs
                .text(
                  label: 'Helper Text',
                  initialValue: 'Helper Text',
                )
                .toString(),
            textfielSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Small',
                value: ZeroTextfieldSize.small,
              ),
              const Option(
                label: 'Large',
                value: ZeroTextfieldSize.large,
              ),
            ]),
            suffix: context.knobs.options(label: 'Suffix Widget', options: [
              const Option(
                label: 'No Widget',
                value: null,
              ),
              const Option(
                label: 'Icons.close_outlined',
                value: Icon(Icons.close_outlined),
              ),
              const Option(
                label: 'Icons.help',
                value: Icon(Icons.help),
              ),
              const Option(
                label: 'Icons.access_alarm',
                value: Icon(Icons.access_alarm),
              ),
            ]),
          ),
        );
      },
    ),
  ],
);
