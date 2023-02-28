import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zog_ui/zog_ui.dart';

import '../utils.dart';

WidgetbookComponent navigationBarWidgetbookComponent = WidgetbookComponent(
  name: 'Navigation Bar',
  useCases: [
    WidgetbookUseCase(
      name: 'Navigation Bar',
      builder: (context) => const PreviewWidget(
        child: _NavigationBarWidget(),
      ),
    ),
  ],
);

class _NavigationBarWidget extends StatefulWidget {
  const _NavigationBarWidget();

  @override
  State<_NavigationBarWidget> createState() => __NavigationBarWidgetState();
}

class __NavigationBarWidgetState extends State<_NavigationBarWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ZeroNavigationBar(
        type: context.knobs.options(label: 'Type', options: _typeOptions),
        activeIndex: activeIndex,
        style: ZeroNavigationBarStyle(
          selectedColor: context.knobs
              .options(label: 'Selected Color', options: _defaultColorOptions),
          unselectedColor: context.knobs.options(
              label: 'Unselected Color', options: _defaultColorOptions),
          indicatorColor: context.knobs
              .options(label: 'Indicator Color', options: colorOptions)
              .withOpacity(0.3),
          indicatorType: context.knobs
              .options(label: 'Indicator', options: _indicatorOptions),
        ),
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: const [
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.home),
            activeIcon: Icon(ZeroIcons.homeFilled),
            label: 'Home',
          ),
          ZeroNavigationBarItem(
            icon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notification),
            ),
            activeIcon: ZeroBadge(
              badgeColor: Colors.red,
              badgeText: '12',
              type: ZeroBadgeType.number,
              padding: EdgeInsets.zero,
              child: Icon(ZeroIcons.notificationFilled),
            ),
            label: 'Notif',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.message),
            activeIcon: Icon(ZeroIcons.messageFilled),
            label: 'Message',
          ),
          ZeroNavigationBarItem(
            icon: Icon(ZeroIcons.fire),
            activeIcon: Icon(ZeroIcons.fireFilled),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

List<Option<ZeroNavigationBarType>> _typeOptions = [
  const Option(label: 'Icon Label', value: ZeroNavigationBarType.iconLabel),
  const Option(
      label: 'Label on Active', value: ZeroNavigationBarType.iconLabelOnActive),
];

List<Option<ZeroNavigationBarIndicatorType>> _indicatorOptions = [
  const Option(label: 'Oval', value: ZeroNavigationBarIndicatorType.oval),
  const Option(label: 'Circle', value: ZeroNavigationBarIndicatorType.circle),
];

List<Option<Color>> _defaultColorOptions = [
  const Option(label: 'Black', value: Colors.black),
  ...colorOptions,
];
