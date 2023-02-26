import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent tabBarWidgetbookComponenet = WidgetbookComponent(
  name: 'TapBar',
  useCases: [
    WidgetbookUseCase(
      name: 'Basic',
      builder: (context) => PreviewWidget(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: ZeroAppBar(
              title: const Text('Tab Bar'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kZeroTabBarDefaultHeight),
                child: ZeroTabBar(
                  style: ZeroTabBarStyle(
                    activeColor: context.knobs.options<Color?>(
                      label: 'Active Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    backgroundColor: context.knobs.options<Color?>(
                      label: 'Background Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    inactiveColor: context.knobs.options<Color?>(
                      label: 'Inactive Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    indicatorColor: context.knobs.options<Color?>(
                      label: 'Indicator Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    isScrollable: context.knobs
                        .boolean(label: 'Is Scrollable', initialValue: false),
                  ),
                  tabs: const [
                    ZeroTab(label: Text('HOME')),
                    ZeroTab(label: Text('NOTIF')),
                    ZeroTab(label: Text('CONFIG')),
                    ZeroTab(label: Text('PROFILE')),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Icon',
      builder: (context) => PreviewWidget(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: ZeroAppBar(
              title: const Text('Tab Bar'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kZeroTabBarDefaultHeight),
                child: ZeroTabBar(
                  style: ZeroTabBarStyle(
                    activeColor: context.knobs.options<Color?>(
                      label: 'Active Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    backgroundColor: context.knobs.options<Color?>(
                      label: 'Background Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    inactiveColor: context.knobs.options<Color?>(
                      label: 'Inactive Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    indicatorColor: context.knobs.options<Color?>(
                      label: 'Indicator Color',
                      options: [
                        const Option(label: 'Default', value: null),
                        ...colorOptions
                      ],
                    ),
                    iconSize: context.knobs
                        .nullableNumber(
                          label: 'Icon Size',
                          initialValue: 20,
                        )
                        ?.toDouble(),
                    isScrollable: context.knobs
                        .boolean(label: 'Is Scrollable', initialValue: false),
                  ),
                  tabs: const [
                    ZeroTab(
                      label: Text('HOME'),
                      icon: Icon(ZeroIcons.home),
                    ),
                    ZeroTab(
                      label: Text('NOTIF'),
                      icon: Icon(ZeroIcons.notification),
                    ),
                    ZeroTab(
                      label: Text('CONFIG'),
                      icon: Icon(ZeroIcons.macCommand),
                    ),
                    ZeroTab(
                      label: Text('PROFILE'),
                      icon: Icon(ZeroIcons.user),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ],
);
