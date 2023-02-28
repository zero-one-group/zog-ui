import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent buttonGroupWidgetbookComponent = WidgetbookComponent(
  name: 'Button Group',
  useCases: [
    WidgetbookUseCase(
        name: 'Labels Only',
        builder: (context) {
          const List<String> labels = ['Tab Long Text 1', 'Tab 2', 'Tab 3'];

          List<bool> selecteds = [false, false, false];
          return PreviewWidget(
            child: StatefulBuilder(builder: (context, setState) {
              return ZeroButtonGroup.labelsOnly(
                labels: labels,
                selecteds: selecteds,
                onChanged: (value) {
                  setState(() {
                    selecteds = value;
                  });
                },
                multipleSelect: context.knobs
                    .boolean(label: 'Multiple-Select', initialValue: false),
                withIcon: context.knobs
                    .boolean(label: 'With Select Icon', initialValue: false),
                vertical: context.knobs
                    .boolean(label: 'Vertical', initialValue: false),
                selectIcon:
                    context.knobs.options(label: 'Select Icon', options: [
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
                    value: ButtonGroupType.filled,
                  ),
                  const Option(
                    label: 'Outline',
                    value: ButtonGroupType.outlined,
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
                style: _getStyle(context),
              );
            }),
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

          List<bool> selecteds = [false, false, false];
          return PreviewWidget(
            child: StatefulBuilder(builder: (context, setState) {
              return ZeroButtonGroup.iconsOnly(
                icons: labels,
                selecteds: selecteds,
                onChanged: (value) {
                  setState(() {
                    selecteds = value;
                  });
                },
                vertical: context.knobs
                    .boolean(label: 'Vertical', initialValue: false),
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
                    value: ButtonGroupType.filled,
                  ),
                  const Option(
                    label: 'Outline',
                    value: ButtonGroupType.outlined,
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
                style: _getStyle(context),
              );
            }),
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

          List<bool> selecteds = [false, false, false];
          return PreviewWidget(
            child: StatefulBuilder(builder: (context, setState) {
              return ZeroButtonGroup.labelsWithIcons(
                labels: labels,
                vertical: context.knobs
                    .boolean(label: 'Vertical', initialValue: false),
                multipleSelect: context.knobs
                    .boolean(label: 'Multiple-Select', initialValue: false),
                icons: icons,
                selecteds: selecteds,
                onChanged: (value) {
                  setState(() {
                    selecteds = value;
                  });
                },
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
                    value: ButtonGroupType.filled,
                  ),
                  const Option(
                    label: 'Outline',
                    value: ButtonGroupType.outlined,
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
                style: _getStyle(context),
              );
            }),
          );
        }),
  ],
);

ZeroButtonGroupStyle _getStyle(BuildContext context) {
  final colors = [
    const Option(label: 'Default', value: null),
    ...colorOptions,
  ];
  return ZeroButtonGroupStyle(
    activeColor: context.knobs.options(
      label: 'Active Color',
      options: colors,
    ),
    inactiveColor: context.knobs.options(
      label: 'Inactive Color',
      options: colors,
    ),
    activeBorderColor: context.knobs.options(
      label: 'Active Border Color',
      options: colors,
    ),
    inactiveBorderColor: context.knobs.options(
      label: 'Inactive Border Color',
      options: colors,
    ),
    activeTextStyle: TextStyle(
      color: context.knobs.options(
        label: 'Active Text Color',
        options: colors,
      ),
    ),
    inactiveTextStyle: TextStyle(
      color: context.knobs.options(
        label: 'Inactive Text Color',
        options: colors,
      ),
    ),
  );
}
