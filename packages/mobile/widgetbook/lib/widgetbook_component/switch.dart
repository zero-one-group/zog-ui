import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent switchWidgetbookComponent = WidgetbookComponent(
  name: 'Switch',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) {
        bool active = false;

        return _SwitchBuilder(
          builder: (style, setState) {
            return ZeroSwitch(
              style: style,
              onChanged: (value) {
                setState(() {
                  active = value;
                });
              },
              value: active,
              isDisabled: context.knobs.boolean(label: 'Disabled'),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Custom',
      builder: (context) {
        bool active = false;

        return _SwitchBuilder(
          builder: (style, setState) {
            return ZeroSwitch(
              style: style,
              onChanged: (value) {
                setState(() {
                  active = value;
                });
              },
              value: active,
              activeIcon: context.knobs.options(
                label: 'Active Icon',
                options: _iconOptions,
              ),
              inactiveIcon: context.knobs.options(
                label: 'Inactive Icon',
                options: _iconOptions.sublist(1),
              ),
              isDisabled: context.knobs.boolean(label: 'Disabled'),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Android',
      builder: (context) {
        bool active = false;

        return _SwitchBuilder(
          builder: (style, setState) {
            return ZeroSwitchAndroid(
              style: style,
              onChanged: (value) {
                setState(() {
                  active = value;
                });
              },
              value: active,
              isDisabled: context.knobs.boolean(label: 'Disabled'),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Android with Icons',
      builder: (context) {
        bool active = false;

        return _SwitchBuilder(
          builder: (style, setState) {
            return ZeroSwitchAndroid(
              style: style,
              onChanged: (value) {
                setState(() {
                  active = value;
                });
              },
              value: active,
              activeIcon: context.knobs.options(
                label: 'Active Icon',
                options: _iconOptions.sublist(2),
              ),
              inactiveIcon: context.knobs.options(
                label: 'Inactive Icon',
                options: _iconOptions.sublist(3),
              ),
              isDisabled: context.knobs.boolean(label: 'Disabled'),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'IOS',
      builder: (context) {
        bool active = false;

        return _SwitchBuilder(
          builder: (style, setState) {
            return ZeroSwitchIOS(
              style: style,
              onChanged: (value) {
                setState(() {
                  active = value;
                });
              },
              value: active,
              isDisabled: context.knobs.boolean(label: 'Disabled'),
            );
          },
        );
      },
    ),
    WidgetbookUseCase(
      name: 'Global Style',
      builder: (context) {
        bool active = false;

        return _SwitchBuilder(
          builder: (style, setState) {
            return Builder(builder: (context) {
              return ZeroTheme(
                data: context.theme.copyWith(
                  switchStyle: context.theme.switchStyle.copyWith(
                    basic: context.theme.switchStyle.basic.merge(style),
                    android: context.theme.switchStyle.android.merge(style),
                    iOS: context.theme.switchStyle.iOS.merge(style),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: double.infinity),
                    ZeroSwitch(
                      onChanged: (value) {
                        setState(() {
                          active = value;
                        });
                      },
                      value: active,
                      isDisabled: context.knobs.boolean(label: 'Disabled'),
                    ),
                    ZeroSwitchAndroid(
                      onChanged: (value) {
                        setState(() {
                          active = value;
                        });
                      },
                      value: active,
                      isDisabled: context.knobs.boolean(label: 'Disabled'),
                    ),
                    ZeroSwitchIOS(
                      onChanged: (value) {
                        setState(() {
                          active = value;
                        });
                      },
                      value: active,
                      isDisabled: context.knobs.boolean(label: 'Disabled'),
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    ),
  ],
);

typedef _Builder = Widget Function(ZeroSwitchStyle style, StateSetter setState);

class _SwitchBuilder extends StatelessWidget {
  const _SwitchBuilder({required this.builder});

  final _Builder builder;

  @override
  Widget build(BuildContext context) {
    return PreviewWidget(
      child: StatefulBuilder(
        builder: (context, setState) => builder(
          ZeroSwitchStyle(
            activeColor: context.knobs.options(
              label: 'Active Track Color',
              options: [
                const Option(label: 'Default', value: null),
                ..._colorOptions.sublist(3)
              ],
            ),
            inactiveColor: context.knobs.options(
              label: 'Inactive Track Color',
              options: _colorOptions,
            ),
            activeThumbColor: context.knobs.options(
              label: 'Active Thumb Color',
              options: [
                const Option(label: 'Default', value: null),
                ..._colorOptions.sublist(3)
              ],
            ),
            inactiveThumbColor: context.knobs.options(
              label: 'Inactive Thumb Color',
              options: [
                const Option(label: 'Default', value: null),
                ..._colorOptions.sublist(2)
              ],
            ),
          ),
          setState,
        ),
      ),
    );
  }
}

List<Option<Color?>> _colorOptions = [
  const Option(label: 'Default', value: null),
  const Option(label: 'Neutral', value: ZeroColors.neutral),
  const Option(label: 'White', value: ZeroColors.white),
  ...colorOptions.where((element) => element.label != 'Neutral'),
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
