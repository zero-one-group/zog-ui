import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/options/color_options.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

import '../utils.dart';

WidgetbookComponent appBarWidgetbookComponent = WidgetbookComponent(
  name: 'App Bar',
  useCases: [
    WidgetbookUseCase(
      name: 'App Bar',
      builder: (context) => PreviewWidget(
        child: Scaffold(
          appBar: ZeroAppBar(
            title: Text(
              context.knobs.text(label: 'Title', initialValue: 'Title'),
            ),
            actions: context.knobs
                .options(label: 'Actions', options: _actionsOptions),
            leading: context.knobs
                .options(label: 'Leading', options: _leadingOptions),
            size: context.knobs.options(label: 'Size', options: _sizeOptions),
            style: ZeroAppBarStyle(
              backgroundColor: context.knobs.options(
                label: 'Background Color',
                options: _backgroundColorOptions,
              ),
              foregroundColor: context.knobs.options(
                label: 'Foreground Color',
                options: _foregroundColorOptions,
              ),
              centerTitle: context.knobs.boolean(label: 'Center Title'),
              statusBarBrightness: context.knobs.options(
                label: 'Status Bar Brighness',
                options: _brightnessOptions,
              ),
            ),
          ),
        ),
      ),
    ),
  ],
);

List<Option<Color>> _backgroundColorOptions = [
  const Option(
    label: 'White',
    value: Colors.white,
  ),
  ...colorOptions,
];

List<Option<Color>> _foregroundColorOptions = [
  const Option(
    label: 'Black',
    value: Colors.black,
  ),
  const Option(
    label: 'White',
    value: Colors.white,
  ),
  ...colorOptions,
];

List<Option<ZeroAppBarSize>> _sizeOptions = [
  const Option(label: 'Small', value: ZeroAppBarSize.small),
  const Option(label: 'Medium', value: ZeroAppBarSize.medium),
  const Option(label: 'Large', value: ZeroAppBarSize.large),
];

List<Option<Widget?>> _leadingOptions = [
  const Option(label: 'None', value: null),
  Option(
    label: 'Back',
    value: IconButton(onPressed: () {}, icon: const Icon(ZeroIcons.arrowLeft)),
  ),
  Option(
    label: 'Menu',
    value: IconButton(onPressed: () {}, icon: const Icon(ZeroIcons.menu)),
  ),
];

List<Option<List<Widget>?>> _actionsOptions = [
  const Option(label: 'None', value: null),
  Option(
    label: '1',
    value: [
      IconButton(
        onPressed: () {},
        icon: const Icon(ZeroIcons.appSync),
      ),
    ],
  ),
  Option(
    label: '2',
    value: [
      IconButton(
        onPressed: () {},
        icon: const Icon(ZeroIcons.appSync),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(ZeroIcons.bug),
      ),
    ],
  ),
];

List<Option<Brightness>> _brightnessOptions = [
  const Option(label: 'Light', value: Brightness.light),
  const Option(label: 'Dark', value: Brightness.dark),
];
