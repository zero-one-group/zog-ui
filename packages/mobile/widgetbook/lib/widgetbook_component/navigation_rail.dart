import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent navigationRailWidgetbookComponent = WidgetbookComponent(
  name: 'Navigation Rail',
  useCases: [
    WidgetbookUseCase(
      name: 'Navigation Rail',
      builder: (context) => PreviewWidget(
        child: Builder(builder: (context) {
          int activeIndex = 0;
          return StatefulBuilder(
            builder: (context, setState) => Scaffold(
              body: Row(
                children: [
                  ZeroNavigationRail(
                    style: ZeroNavigationRailStyle(
                      backgroundColor: context.knobs.options(
                        label: 'Background Color',
                        options: _backgroundOptions,
                      ),
                      activeColor: context.knobs.options(
                        label: 'Icon Color on Active',
                        options: _backgroundOptions,
                      ),
                      indicatorColor: context.knobs.options(
                        label: 'Indicator Color',
                        options: colorOptions,
                      ),
                      inactiveColor: context.knobs.options(
                        label: 'Inactive Color',
                        options: [
                          const Option(label: 'Default', value: null),
                          ...colorOptions
                        ],
                      ),
                    ),
                    items: const [
                      ZeroNavigationRailItem(
                        icon: Icon(ZeroIcons.home),
                        activeIcon: Icon(ZeroIcons.homeFilled),
                        label: Text('Home'),
                      ),
                      ZeroNavigationRailItem(
                        icon: Icon(ZeroIcons.star),
                        activeIcon: Icon(ZeroIcons.starFilled),
                        label: Text('Star'),
                      ),
                      ZeroNavigationRailItem(
                        icon: Icon(ZeroIcons.file),
                        activeIcon: Icon(ZeroIcons.fileFilled),
                        label: Text('File'),
                      ),
                      ZeroNavigationRailItem(
                        icon: Icon(ZeroIcons.bug),
                        activeIcon: Icon(ZeroIcons.bugFilled),
                        label: Text('Bug'),
                      ),
                      ZeroNavigationRailItem(
                        icon: Icon(ZeroIcons.heart),
                        activeIcon: Icon(ZeroIcons.heartFilled),
                        label: Text('Heart'),
                      ),
                      ZeroNavigationRailItem(
                        icon: Icon(ZeroIcons.car),
                        activeIcon: Icon(ZeroIcons.carFilled),
                        label: Text('Car'),
                      ),
                    ],
                    action: context.knobs
                        .options(label: 'Action', options: _actionOptions),
                    leading: context.knobs
                        .options(label: 'Leading', options: _leadingOptions),
                    activeIndex: activeIndex,
                    onTap: (index) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    ),
  ],
);

List<Option<Widget?>> _actionOptions = [
  const Option(label: 'None', value: null),
  Option(
    label: 'Search',
    value: ZeroButtonIcon.primary(
      icon: const Icon(ZeroIcons.search),
      onPressed: () {},
      borderRadiusType: ZeroButtonRadiusType.curved,
      size: ZeroButtonSize.large,
    ),
  ),
  Option(
    label: 'Add',
    value: ZeroButtonIcon.primary(
      icon: const Icon(ZeroIcons.plus),
      onPressed: () {},
      borderRadiusType: ZeroButtonRadiusType.curved,
      size: ZeroButtonSize.large,
    ),
  ),
];

List<Option<Widget?>> _leadingOptions = [
  const Option(label: 'None', value: null),
  Option(
      label: 'Menu',
      value: IconButton(onPressed: () {}, icon: const Icon(ZeroIcons.menu))),
  Option(
      label: 'Back',
      value:
          IconButton(onPressed: () {}, icon: const Icon(ZeroIcons.arrowLeft))),
];

List<Option<Color>> _backgroundOptions = [
  const Option(label: 'White', value: ZeroColors.white),
  ...colorOptions,
];
