import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent navigationDrawerWidgetbookComponent = WidgetbookComponent(
  name: 'Navigation Drawer',
  useCases: [
    WidgetbookUseCase(
      name: 'Start Drawer',
      builder: (context) => PreviewWidget(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tap the humberger menu'),
          ),
          drawer: ZeroNavigationDrawer(
            style: ZeroNavigationDrawerStyle(
              separatorDrawer: context.knobs
                  .boolean(label: 'Separator Section', initialValue: true),
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: _backgroundOptions,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(
                    context.knobs
                        .number(label: 'Border Radius', initialValue: 16)
                        .toDouble(),
                  ),
                ),
              ),
              width: context.knobs
                  .number(
                    label: 'Width',
                    description:
                        'Recommendation: minimum width is 300 & by default width is 300',
                    initialValue: 300,
                  )
                  .toDouble(),
            ),
            header: ZeroNavigationDrawerHeader(
              child: Image.network(
                'https://i0.wp.com/www.globalemancipation.ngo/wp-content/uploads/2017/09/github-logo.png?ssl=1',
                height: 32,
              ),
            ),
            children: [
              ZeroNavigationDrawerSection(
                title: const Text('Section Header'),
                menus: [
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.alert),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.api),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.aim),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.clear),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                ],
              ),
              ZeroNavigationDrawerSection(
                title: const Text('Section Header'),
                menus: [
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.alert),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.api),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.aim),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    leftIcon: const Icon(ZeroIcons.clear),
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                ],
              ),
              ZeroNavigationDrawerSection(
                title: const Text('Section Header'),
                menus: [
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                ],
              ),
              ZeroNavigationDrawerSection(
                title: const Text('Section Header'),
                menus: [
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                  ZeroListTile(
                    title: 'List Item',
                    rightIcon: const Text('100+'),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  ],
);

List<Option<Color>> _backgroundOptions = [
  const Option(label: 'White', value: ZeroColors.white),
  ...colorOptions,
];
