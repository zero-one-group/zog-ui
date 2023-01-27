import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:zero_ui_mobile/components/list/list_tile_style.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

WidgetbookComponent listTileWidgetbookComponenet = WidgetbookComponent(
  name: 'List Tile',
  useCases: [
    WidgetbookUseCase(
      name: 'Default',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title: 'List Item',
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            onTap: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'With Subtitle',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title:
                context.knobs.text(label: 'Title', initialValue: 'List Item'),
            subtitle: context.knobs
                .text(label: 'Subtitle', initialValue: 'Secondary '),
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            onTap: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Left Icon',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title:
                context.knobs.text(label: 'Title', initialValue: 'List Item'),
            subtitle: context.knobs
                .text(label: 'Subtitle', initialValue: 'Secondary '),
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            leftIcon:
                context.knobs.options(label: 'Left Icon', options: _leftIcons),
            onTap: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Right Icon',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title:
                context.knobs.text(label: 'Title', initialValue: 'List Item'),
            subtitle: context.knobs
                .text(label: 'Subtitle', initialValue: 'Secondary '),
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            rightIcon: context.knobs
                .options(label: 'Right Icon', options: _rightIcons),
            onTap: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Left & Right Icon',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title:
                context.knobs.text(label: 'Title', initialValue: 'List Item'),
            subtitle: context.knobs
                .text(label: 'Subtitle', initialValue: 'Secondary '),
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            leftIcon:
                context.knobs.options(label: 'Left Icon', options: _leftIcons),
            rightIcon: context.knobs
                .options(label: 'Right Icon', options: _rightIcons),
            onTap: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Disabled',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title:
                context.knobs.text(label: 'Title', initialValue: 'List Item'),
            subtitle: context.knobs
                .text(label: 'Subtitle', initialValue: 'Secondary '),
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            leftIcon:
                context.knobs.options(label: 'Left Icon', options: _leftIcons),
            rightIcon: context.knobs
                .options(label: 'Right Icon', options: _rightIcons),
            disabled:
                context.knobs.boolean(label: 'Disabled', initialValue: true),
            onTap: () {},
          ),
        ),
      ),
    ),
    WidgetbookUseCase(
      name: 'Custom Style',
      builder: (context) => Scaffold(
        body: Center(
          child: ZeroListTile(
            title:
                context.knobs.text(label: 'Title', initialValue: 'List Item'),
            subtitle: context.knobs
                .text(label: 'Subtitle', initialValue: 'Secondary '),
            selected: context.knobs.boolean(label: 'Selected'),
            size: context.knobs.options(label: 'Size', options: _sizeTypes),
            withDivider: context.knobs.boolean(label: 'With Divider'),
            leftIcon:
                context.knobs.options(label: 'Left Icon', options: _leftIcons),
            rightIcon: context.knobs
                .options(label: 'Right Icon', options: _rightIcons),
            style: ZeroListTileStyle(
              backgroundColor: Colors.pink.withOpacity(0.5),
              dividerColor: Colors.blue,
              selectedColor: Colors.yellow,
              subTitleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 14),
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {},
          ),
        ),
      ),
    ),
  ],
);

List<Option<Icon>> _leftIcons = [
  const Option(label: 'Search', value: Icon(Icons.search)),
  const Option(label: 'Add', value: Icon(Icons.add)),
  const Option(label: 'Delete', value: Icon(Icons.delete)),
  const Option(label: 'Edit', value: Icon(Icons.edit)),
  const Option(label: 'Settings', value: Icon(Icons.settings)),
  const Option(label: 'Share', value: Icon(Icons.share)),
  const Option(label: 'Save', value: Icon(Icons.save)),
  const Option(label: 'Close', value: Icon(Icons.close)),
];

List<Option<Icon>> _rightIcons = [
  const Option(label: 'Next', value: Icon(Icons.navigate_next)),
  const Option(label: 'Expand More', value: Icon(Icons.expand_more)),
  const Option(label: 'Expand Less', value: Icon(Icons.expand_less)),
];

List<Option<ZeroListTileSizeType>> _sizeTypes = [
  const Option(label: 'Large', value: ZeroListTileSizeType.large),
  const Option(label: 'Small', value: ZeroListTileSizeType.small),
];

List<Option<ZeroButtonRadiusType>> buttonRadiusTypes = [
  const Option(label: 'Rectangle', value: ZeroButtonRadiusType.rectangle),
  const Option(label: 'Curved', value: ZeroButtonRadiusType.curved),
  const Option(label: 'Rounded', value: ZeroButtonRadiusType.rounded),
];
