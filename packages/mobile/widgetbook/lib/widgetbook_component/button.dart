import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent buttonWidgetbookComponent = WidgetbookComponent(
  name: 'Button',
  useCases: [
    WidgetbookUseCase(
      name: 'Primary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.primary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: Text(context.knobs.text(
            label: 'Text',
            initialValue: 'Button',
          )),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Secondary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.secondary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: Text(
            context.knobs.text(
              label: 'Text',
              initialValue: 'Button',
            ),
          ),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Text',
      builder: (context) => PreviewWidget(
        child: ZeroButton.text(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: Text(context.knobs.text(
            label: 'Text',
            initialValue: 'Button',
          )),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'L-Icon Primary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.primary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _leftIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'L-Icon Secondary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.secondary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _leftIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'L-Icon Text',
      builder: (context) => PreviewWidget(
        child: ZeroButton.text(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _leftIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'R-Icon Primary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.primary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _rightIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'R-Icon Secondary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.secondary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _rightIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'R-Icon Text',
      builder: (context) => PreviewWidget(
        child: ZeroButton.text(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _rightIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'RL-Icon Primary',
      builder: (context) => PreviewWidget(
        child: ZeroButton.primary(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _leftRightIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'RL-Icon Secondary',
      builder: (context) => PreviewWidget(
        child: Scaffold(
          body: Center(
            child: ZeroButton.secondary(
              buttonSizeType: context.knobs.options(
                options: buttonSizeTypes,
                label: 'Button Size Type',
              ),
              buttonRadiusType: context.knobs.options(
                options: buttonRadiusTypes,
                label: 'Button Radius Type',
              ),
              isDisabled: context.knobs.boolean(
                label: 'Is Disabled',
                initialValue: false,
              ),
              child: _leftRightIcon(context),
              onPressed: () {},
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'RL-Icon Text',
      builder: (context) => PreviewWidget(
        child: ZeroButton.text(
          buttonSizeType: context.knobs.options(
            options: buttonSizeTypes,
            label: 'Button Size Type',
          ),
          buttonRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          isDisabled: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          ),
          child: _leftRightIcon(context),
          onPressed: () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Icon Primary',
      builder: (context) => PreviewWidget(
        child: ZeroButtonIcon.primary(
          icon: context.knobs.options(label: 'Icon', options: icons),
          size: context.knobs.options(
            options: buttonSize,
            label: 'Button Size Type',
          ),
          borderRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          onPressed: context.knobs.boolean(
            label: 'Is Disabled',
            initialValue: false,
          )
              ? null
              : () {},
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Icon Secondary',
      builder: (context) => PreviewWidget(
        child: ZeroButtonIcon.secondary(
          icon: context.knobs.options(label: 'Icon', options: icons),
          size: context.knobs.options(
            options: buttonSize,
            label: 'Button Size Type',
          ),
          borderRadiusType: context.knobs.options(
            options: buttonRadiusTypes,
            label: 'Button Radius Type',
          ),
          onPressed: context.knobs.boolean(
                    label: 'Is Disabled',
                    initialValue: false,
                  ) ==
                  true
              ? null
              : () {},
        ),
      ),
    ),
  ],
);

Widget _leftIcon(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      context.knobs.options(label: 'Left Icon', options: icons),
      const SizedBox(width: 10),
      Text(context.knobs.text(
        label: 'Text',
        initialValue: 'Button',
      )),
    ],
  );
}

Widget _rightIcon(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(context.knobs.text(
        label: 'Text',
        initialValue: 'Button',
      )),
      const SizedBox(width: 10),
      context.knobs.options(label: 'Right Icon', options: icons)
    ],
  );
}

Widget _leftRightIcon(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      context.knobs.options(label: 'Left Icon', options: icons),
      const SizedBox(width: 10),
      Text(context.knobs.text(
        label: 'Text',
        initialValue: 'Button',
      )),
      const SizedBox(width: 10),
      context.knobs.options(label: 'Right Icon', options: icons)
    ],
  );
}

List<Option<Icon>> icons = [
  const Option(
      label: 'Search',
      value: Icon(
        Icons.search,
        size: 18,
      )),
  const Option(
      label: 'Add',
      value: Icon(
        Icons.add,
        size: 18,
      )),
  const Option(
      label: 'Delete',
      value: Icon(
        Icons.delete,
        size: 18,
      )),
  const Option(
      label: 'Edit',
      value: Icon(
        Icons.edit,
        size: 18,
      )),
  const Option(
      label: 'Settings',
      value: Icon(
        Icons.settings,
        size: 18,
      )),
  const Option(
      label: 'Share',
      value: Icon(
        Icons.share,
        size: 18,
      )),
  const Option(
      label: 'Save',
      value: Icon(
        Icons.save,
        size: 18,
      )),
  const Option(
      label: 'Close',
      value: Icon(
        Icons.close,
        size: 18,
      )),
];

List<Option<ZeroSizeType>> buttonSizeTypes = [
  const Option(label: 'Small', value: ZeroSizeType.small),
  const Option(label: 'Medium', value: ZeroSizeType.medium),
  const Option(label: 'Large', value: ZeroSizeType.large),
];

List<Option<ZeroButtonSize>> buttonSize = [
  const Option(label: 'Small', value: ZeroButtonSize.small),
  const Option(label: 'Medium', value: ZeroButtonSize.medium),
  const Option(label: 'Large', value: ZeroButtonSize.large),
];

List<Option<ZeroButtonRadiusType>> buttonRadiusTypes = [
  const Option(label: 'Rectangle', value: ZeroButtonRadiusType.rectangle),
  const Option(label: 'Curved', value: ZeroButtonRadiusType.curved),
  const Option(label: 'Rounded', value: ZeroButtonRadiusType.rounded),
];
