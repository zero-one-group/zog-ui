import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent buttonGroupWidgetbookComponent = WidgetbookComponent(
  name: 'Button Group',
  useCases: [
    WidgetbookUseCase(
        name: 'Labels Only',
        builder: (context) {
          const List<String> labels = ['Tab Tab Long Text', 'Tab 2', 'Tab 3'];

          List<bool> isSelected = [false, false, false];
          return ZeroButtonGroup.labelsOnly(
            labels: labels,
            isSelected: isSelected,
            withIcon: context.knobs
                .boolean(label: 'With Select Icon', initialValue: false),
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
                value: ButtonSizeType.large,
              ),
              const Option(
                label: 'Medium',
                value: ButtonSizeType.medium,
              ),
              const Option(
                label: 'Small',
                value: ButtonSizeType.small,
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
            buttonRadiusType: context.knobs.options(label: 'Radius', options: [
              const Option(
                label: 'Rectangle',
                value: ButtonRadiusType.rectangle,
              ),
              const Option(
                label: 'Curved',
                value: ButtonRadiusType.curved,
              ),
              const Option(
                label: 'Rounded',
                value: ButtonRadiusType.rounded,
              ),
            ]),
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
          return ZeroButtonGroup.iconsOnly(
            icons: labels,
            isSelected: isSelected,
            buttonSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Large',
                value: ButtonSizeType.large,
              ),
              const Option(
                label: 'Medium',
                value: ButtonSizeType.medium,
              ),
              const Option(
                label: 'Small',
                value: ButtonSizeType.small,
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
            buttonRadiusType: context.knobs.options(label: 'Radius', options: [
              const Option(
                label: 'Rectangle',
                value: ButtonRadiusType.rectangle,
              ),
              const Option(
                label: 'Curved',
                value: ButtonRadiusType.curved,
              ),
              const Option(
                label: 'Rounded',
                value: ButtonRadiusType.rounded,
              ),
            ]),
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
          return ZeroButtonGroup.labelsWithIcons(
            labels: labels,
            icons: icons,
            isSelected: isSelected,
            buttonSizeType: context.knobs.options(label: 'Size', options: [
              const Option(
                label: 'Large',
                value: ButtonSizeType.large,
              ),
              const Option(
                label: 'Medium',
                value: ButtonSizeType.medium,
              ),
              const Option(
                label: 'Small',
                value: ButtonSizeType.small,
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
            buttonRadiusType: context.knobs.options(label: 'Radius', options: [
              const Option(
                label: 'Rectangle',
                value: ButtonRadiusType.rectangle,
              ),
              const Option(
                label: 'Curved',
                value: ButtonRadiusType.curved,
              ),
              const Option(
                label: 'Rounded',
                value: ButtonRadiusType.rounded,
              ),
            ]),
          );
        }),
  ],
);
