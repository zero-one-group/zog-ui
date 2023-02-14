import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

// import '../color_options.dart';
import '../utils.dart';

WidgetbookComponent switchWidgetbookComponent = WidgetbookComponent(
  name: 'Switch',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => PreviewWidget(
        child: ZeroSwitch(
          value: context.knobs.boolean(label: 'Value'),
          activeColor: context.knobs.options(
            label: 'Active Track Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Track Color',
            options: _colorOptions,
          ),
          activeThumbColor: context.knobs.options(
            label: 'Active Thumb Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveThumbColor: context.knobs.options(
            label: 'Inactive Thumb Color',
            options: _colorOptions.sublist(1),
          ),
          onChanged: (value) {},
          isDisabled: context.knobs.boolean(label: 'Disabled'),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom',
      builder: (context) => PreviewWidget(
        child: ZeroSwitch(
          value: context.knobs.boolean(label: 'Value'),
          activeColor: context.knobs.options(
            label: 'Active Track Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Track Color',
            options: _colorOptions,
          ),
          activeThumbColor: context.knobs.options(
            label: 'Active Thumb Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveThumbColor: context.knobs.options(
            label: 'Inactive Thumb Color',
            options: _colorOptions.sublist(1),
          ),
          onChanged: (value) {},
          isDisabled: context.knobs.boolean(label: 'Disabled'),
          activeIcon: context.knobs.options(
            label: 'Active Icon',
            options: _iconOptions,
          ),
          inactiveIcon: context.knobs.options(
            label: 'Inactive Icon',
            options: _iconOptions.sublist(1),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Android',
      builder: (context) => PreviewWidget(
        child: ZeroSwitchAndroid(
          value: context.knobs.boolean(label: 'Value'),
          activeColor: context.knobs.options(
            label: 'Active Track Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Track Color',
            options: _colorOptions,
          ),
          activeThumbColor: context.knobs.options(
            label: 'Active Thumb Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveThumbColor: context.knobs.options(
            label: 'Inactive Thumb Color',
            options: _colorOptions.sublist(1),
          ),
          onChanged: (value) {},
          isDisabled: context.knobs.boolean(label: 'Disabled'),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Android with Icons',
      builder: (context) => PreviewWidget(
        child: ZeroSwitchAndroid(
          value: context.knobs.boolean(label: 'Value'),
          activeColor: context.knobs.options(
            label: 'Active Track Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Track Color',
            options: _colorOptions,
          ),
          activeThumbColor: context.knobs.options(
            label: 'Active Thumb Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveThumbColor: context.knobs.options(
            label: 'Inactive Thumb Color',
            options: _colorOptions.sublist(1),
          ),
          onChanged: (value) {},
          isDisabled: context.knobs.boolean(label: 'Disabled'),
          activeIcon: context.knobs.options(
            label: 'Active Icon',
            options: _iconOptions.sublist(2),
          ),
          inactiveIcon: context.knobs.options(
            label: 'Inactive Icon',
            options: _iconOptions.sublist(3),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'IOS',
      builder: (context) => PreviewWidget(
        child: ZeroSwitchIOS(
          value: context.knobs.boolean(label: 'Value'),
          activeColor: context.knobs.options(
            label: 'Active Track Color',
            options: _colorOptions.sublist(2),
          ),
          inactiveColor: context.knobs.options(
            label: 'Inactive Track Color',
            options: _colorOptions,
          ),
          activeThumbColor: context.knobs.options(
            label: 'Active Thumb Color',
            options: _colorOptions.sublist(1),
          ),
          inactiveThumbColor: context.knobs.options(
            label: 'Inactive Thumb Color',
            options: _colorOptions.sublist(1),
          ),
          onChanged: (value) {},
          isDisabled: context.knobs.boolean(label: 'Disabled'),
        ),
      ),
    ),
  ],
);

List<Option<Color>> _colorOptions = [
  const Option(label: 'Neutral', value: ZeroColors.neutral),
  const Option(label: 'White', value: ZeroColors.white),
  const Option(label: 'Primary', value: ZeroColors.primary),
  const Option(label: 'Calendula Gold', value: ZeroColors.calendulaGold),
  const Option(label: 'Sunrise Yellow', value: ZeroColors.sunriseYellow),
  const Option(label: 'Lime', value: ZeroColors.lime),
  const Option(label: 'Polar Green', value: ZeroColors.polarGreen),
  const Option(label: 'Dust Red', value: ZeroColors.dustRed),
  const Option(label: 'Vocano', value: ZeroColors.vocano),
  const Option(label: 'Sunset Orange', value: ZeroColors.sunsetOrange),
  const Option(label: 'Geek Blue', value: ZeroColors.geekBlue),
  const Option(label: 'Golden Purple', value: ZeroColors.goldenPurple),
  const Option(label: 'Magenta', value: ZeroColors.magenta),
];

List<Option<Icon>> _iconOptions = [
  const Option(
    label: 'Sunny',
    value: Icon(
      Icons.sunny,
    ),
  ),
  const Option(
    label: 'Nightlight',
    value: Icon(
      Icons.nightlight_round,
    ),
  ),
  const Option(
    label: 'Check',
    value: Icon(
      Icons.check,
    ),
  ),
  const Option(
    label: 'Close',
    value: Icon(
      Icons.close,
    ),
  ),
  const Option(
    label: 'Search',
    value: Icon(
      Icons.search,
    ),
  ),
  const Option(
    label: 'Add',
    value: Icon(
      Icons.add,
    ),
  ),
  const Option(
    label: 'Delete',
    value: Icon(
      Icons.delete,
    ),
  ),
  const Option(
    label: 'Edit',
    value: Icon(
      Icons.edit,
    ),
  ),
  const Option(
    label: 'Settings',
    value: Icon(
      Icons.settings,
    ),
  ),
  const Option(
    label: 'Share',
    value: Icon(
      Icons.share,
    ),
  ),
  const Option(
    label: 'Save',
    value: Icon(
      Icons.save,
    ),
  ),
];
