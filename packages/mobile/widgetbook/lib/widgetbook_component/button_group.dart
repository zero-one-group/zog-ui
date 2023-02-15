import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent buttonGroupWidgetbookComponent = WidgetbookComponent(
  name: 'Button Group',
  useCases: [
    WidgetbookUseCase(
        name: 'Labels Only',
        builder: (context) {
          const List<String> labels = ['Tab Long Text 1', 'Tab 2', 'Tab 3'];

          List<bool> isSelected = [false, false, false];
          return PreviewWidget(
            child: ZeroButtonGroup.labelsOnly(
              labels: labels,
              isSelected: isSelected,
              multipleSelect: context.knobs
                  .boolean(label: 'Multiple-Select', initialValue: false),
              withIcon: context.knobs
                  .boolean(label: 'With Select Icon', initialValue: false),
              vertical:
                  context.knobs.boolean(label: 'Vertical', initialValue: false),
              selectIcon: context.knobs.options(label: 'Select Icon', options: [
                const Option(
                  label: 'Check',
                  value: Icons.check,
                ),
                const Option(
                  label: 'Check Circle',
                  value: Icons.check_circle,
                ),
              ]),
              buttonSizeType: context.knobs.options(label: 'Size', options: [
                const Option(
                  label: 'Large',
                  value: ZeroSizeType.large,
                ),
                const Option(
                  label: 'Medium',
                  value: ZeroSizeType.medium,
                ),
                const Option(
                  label: 'Small',
                  value: ZeroSizeType.small,
                ),
              ]),
              buttonGroupType: context.knobs.options(label: 'Type', options: [
                const Option(
                  label: 'Default',
                  value: ButtonGroupType.solid,
                ),
                const Option(
                  label: 'Outline',
                  value: ButtonGroupType.outline,
                ),
                const Option(
                  label: 'Text',
                  value: ButtonGroupType.text,
                ),
                const Option(
                  label: 'Underline',
                  value: ButtonGroupType.underline,
                ),
              ]),
              buttonRadiusType:
                  context.knobs.options(label: 'Radius', options: [
                const Option(
                  label: 'Rectangle',
                  value: ZeroButtonRadiusType.rectangle,
                ),
                const Option(
                  label: 'Curved',
                  value: ZeroButtonRadiusType.curved,
                ),
                const Option(
                  label: 'Rounded',
                  value: ZeroButtonRadiusType.rounded,
                ),
              ]),
            ),
          );
        }),
    WidgetbookUseCase(
        name: 'Icons Only',
        builder: (context) {
          const List<IconData> labels = [
            Icons.message,
            Icons.wallet,
            Icons.hotel
          ];

          List<bool> isSelected = [false, false, false];
          return PreviewWidget(
            child: ZeroButtonGroup.iconsOnly(
              icons: labels,
              isSelected: isSelected,
              vertical:
                  context.knobs.boolean(label: 'Vertical', initialValue: false),
              multipleSelect: context.knobs
                  .boolean(label: 'Multiple-Select', initialValue: false),
              buttonSizeType: context.knobs.options(label: 'Size', options: [
                const Option(
                  label: 'Large',
                  value: ZeroSizeType.large,
                ),
                const Option(
                  label: 'Medium',
                  value: ZeroSizeType.medium,
                ),
                const Option(
                  label: 'Small',
                  value: ZeroSizeType.small,
                ),
              ]),
              buttonGroupType: context.knobs.options(label: 'Type', options: [
                const Option(
                  label: 'Default',
                  value: ButtonGroupType.solid,
                ),
                const Option(
                  label: 'Outline',
                  value: ButtonGroupType.outline,
                ),
                const Option(
                  label: 'Text',
                  value: ButtonGroupType.text,
                ),
                const Option(
                  label: 'Underline',
                  value: ButtonGroupType.underline,
                ),
              ]),
              square:
                  context.knobs.boolean(label: 'Square', initialValue: false),
              buttonRadiusType:
                  context.knobs.options(label: 'Radius', options: [
                const Option(
                  label: 'Rectangle',
                  value: ZeroButtonRadiusType.rectangle,
                ),
                const Option(
                  label: 'Curved',
                  value: ZeroButtonRadiusType.curved,
                ),
                const Option(
                  label: 'Rounded',
                  value: ZeroButtonRadiusType.rounded,
                ),
              ]),
            ),
          );
        }),
    WidgetbookUseCase(
        name: 'Labels with Icons',
        builder: (context) {
          const List<String> labels = ['Tab Long Text 1', 'Tab 2', 'Tab 3'];
          const List<IconData> icons = [
            Icons.message,
            Icons.wallet,
            Icons.hotel
          ];

          List<bool> isSelected = [false, false, false];
          return PreviewWidget(
            child: ZeroButtonGroup.labelsWithIcons(
              labels: labels,
              vertical:
                  context.knobs.boolean(label: 'Vertical', initialValue: false),
              multipleSelect: context.knobs
                  .boolean(label: 'Multiple-Select', initialValue: false),
              icons: icons,
              isSelected: isSelected,
              buttonSizeType: context.knobs.options(label: 'Size', options: [
                const Option(
                  label: 'Large',
                  value: ZeroSizeType.large,
                ),
                const Option(
                  label: 'Medium',
                  value: ZeroSizeType.medium,
                ),
                const Option(
                  label: 'Small',
                  value: ZeroSizeType.small,
                ),
              ]),
              buttonGroupType: context.knobs.options(label: 'Type', options: [
                const Option(
                  label: 'Default',
                  value: ButtonGroupType.solid,
                ),
                const Option(
                  label: 'Outline',
                  value: ButtonGroupType.outline,
                ),
                const Option(
                  label: 'Text',
                  value: ButtonGroupType.text,
                ),
                const Option(
                  label: 'Underline',
                  value: ButtonGroupType.underline,
                ),
              ]),
              buttonRadiusType:
                  context.knobs.options(label: 'Radius', options: [
                const Option(
                  label: 'Rectangle',
                  value: ZeroButtonRadiusType.rectangle,
                ),
                const Option(
                  label: 'Curved',
                  value: ZeroButtonRadiusType.curved,
                ),
                const Option(
                  label: 'Rounded',
                  value: ZeroButtonRadiusType.rounded,
                ),
              ]),
            ),
          );
        }),
  ],
);
